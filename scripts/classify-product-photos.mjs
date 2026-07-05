#!/usr/bin/env node
/**
 * Classifie les photos public/products/ par OCR + règles MUSE.
 * Génère data/photo-universe-map.json et data/photo-product-meta.json
 *
 * Usage: node scripts/classify-product-photos.mjs
 */

import fs from "fs";
import path from "path";
import { fileURLToPath } from "url";
import Tesseract from "tesseract.js";

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const ROOT = path.join(__dirname, "..");
const PRODUCTS_DIR = path.join(ROOT, "public/products");
const MAP_FILE = path.join(ROOT, "data/photo-universe-map.json");
const META_FILE = path.join(ROOT, "data/photo-product-meta.json");

const IMAGE_EXT = new Set([".jpg", ".jpeg", ".png", ".webp"]);

const HARD_EXCLUDE = new Set([
  "african-american-man-holding-plant.jpg",
  "golden-easter-eggs-nest-isolated-white-background.jpg",
  "hifadhi_740-scaled.jpg",
  "5FC18661-AE54-4EE8-AAA4-35B765402892.png",
  "881482F3-6A78-4651-91CE-E5EB07E0380E.png",
  "953966F8-0291-4DAE-AB2C-660FC273DFA8.png",
  "c74816e9-977a-4d67-b81c-575c1d6581d4.png",
  "ad01b5e2-3733-4899-94cb-e35f89063cef.png",
]);

const EXCLUDE_PATTERNS = [
  /bovinia/i,
  /bone broth/i,
  /tallow/i,
  /cocoony/i,
  /world market/i,
  /fashion\s*&\s*home/i,
  /powered by bone/i,
];

const UNIVERSE_RULES = [
  { universe: "plaques-de-porte-chez-nous", patterns: [/door plaque/i, /chez les/i, /family plaque/i, /welcome plaque/i, /plaque de porte/i, /the diagne/i] },
  { universe: "boite-a-cles-murale", patterns: [/key hook/i, /key holder/i, /entry collection/i, /\bkeys\b/i, /mail slot/i, /entryway organizer/i] },
  { universe: "support-telephone-vide-poche", patterns: [/phone stand/i, /desk object/i, /office organizer/i, /smartphone/i, /\bdesk\b/i, /\boffice\b/i] },
  { universe: "support-bijoux-coiffeuse", patterns: [/jewelry organizer/i, /vanity object/i, /earring/i, /ring holder/i, /coiffeuse/i, /bathroom object/i, /wall & vanity/i, /vanity organizer/i] },
  { universe: "boite-a-bijoux", patterns: [/jewelry box/i, /keepsake box/i] },
  { universe: "support-tasbih-chapelet", patterns: [/tasbih/i, /chapelet/i, /prayer bead/i] },
  { universe: "plaques-naissance-bapteme", patterns: [/birth/i, /bapt/i, /naissance/i, /baby plaque/i] },
  { universe: "supports-qr-paiement", patterns: [/\bqr\b/i, /wave/i, /orange money/i, /payment/i] },
  { universe: "etiquettes-prix-boutiques", patterns: [/price tag/i, /etiquette/i, /\bprices\b/i] },
  { universe: "porte-cartes-flyers", patterns: [/business card/i, /flyer/i, /card holder/i, /card stand/i] },
  { universe: "supports-parfum-thiouraye", patterns: [/thiouraye/i, /incense/i, /parfum/i, /perfume/i, /perfumery/i] },
  { universe: "porte-moussor-foulards", patterns: [/moussor/i, /scarf/i, /foulard/i] },
  { universe: "cache-pot-decoratif", patterns: [/cache-pot/i, /planter/i, /plant pot/i] },
  { universe: "mini-deco-murale-senegal", patterns: [/senegal/i, /wall art/i, /murale/i, /african mask/i] },
  { universe: "muse-tech-charge-guard", patterns: [/charge guard/i, /cable/i, /charger/i, /tech/i] },
  { universe: "muse-kitchen", patterns: [/kitchen object/i, /fruit bowl/i, /napkin/i, /coffee-pod/i, /coffee corner/i, /cutlery/i, /spoon/i, /utensil/i, /serving/i, /carafe/i, /glasses organizer/i, /kitchen/i, /countertop/i, /cuisine/i, /fruit & napkin/i] },
  { universe: "vide-poche-teranga", patterns: [/teranga/i, /entryway/i, /tissue/i, /remote/i, /living-room/i, /living room/i, /living object/i, /salon/i, /lounge/i, /catch-all/i, /valet/i, /bathroom organizer/i, /bedside/i, /centerpiece/i, /organizer/i, /vide-poche/i] },
];

const DEFAULT_UNIVERSE = "vide-poche-teranga";

function normalizeText(text) {
  return text
    .replace(/[^\x00-\x7F\u00C0-\u024F]/g, " ")
    .replace(/\s+/g, " ")
    .trim()
    .toUpperCase();
}

function isDuplicate(filename) {
  return /-2\.(png|jpe?g|webp)$/i.test(filename);
}

function isUpperUuid(filename) {
  const base = path.basename(filename, path.extname(filename));
  return /^[0-9A-F]{8}-[0-9A-F]{4}-/.test(base);
}

function listImages() {
  if (!fs.existsSync(PRODUCTS_DIR)) return [];
  return fs
    .readdirSync(PRODUCTS_DIR)
    .filter((name) => {
      if (name.startsWith(".") || name === "README.md") return false;
      const full = path.join(PRODUCTS_DIR, name);
      if (fs.statSync(full).isDirectory()) return false;
      return IMAGE_EXT.has(path.extname(name).toLowerCase());
    })
    .sort();
}

function extractProductName(rawText) {
  const lines = rawText
    .split(/\n/)
    .map((l) => l.trim())
    .filter(Boolean);

  const joined = normalizeText(rawText);

  const titlePatterns = [
    /([A-Z][A-Z &/\-]{3,40})\n([A-Z][A-Z &/\-]{3,50})/,
    /(KITCHEN OBJECT|DESK OBJECT|BATHROOM OBJECT|VANITY OBJECT|ENTRY COLLECTION)/,
    /(FRUIT & NAPKIN ORGANIZER|TISSUE & REMOTE ORGANIZER|WALL & VANITY ORGANIZER|JEWELRY ORGANIZER|OFFICE ORGANIZER)/,
    /(DECORATIVE FRUIT BOWL|NAPKIN OR COFFEE-POD ORGANIZER|SCULPTURAL TISSUE BOX COVER|SALON CENTERPIECE)/,
  ];

  for (const pattern of titlePatterns) {
    const match = joined.match(pattern);
    if (match) {
      const parts = match.slice(1).filter(Boolean);
      if (parts.length >= 2) {
        return parts
          .slice(0, 2)
          .map((p) => p.replace(/\s+/g, " ").trim())
          .join(" — ")
          .replace(/\b\w/g, (c) => c.toUpperCase())
          .replace(/\bMuse\b/gi, "MUSE");
      }
      return match[1]
        .replace(/\b\w/g, (c) => c.toUpperCase())
        .replace(/\bMuse\b/gi, "MUSE");
    }
  }

  for (const line of lines) {
    const clean = line.replace(/[^a-zA-Z0-9 &\-/]/g, " ").replace(/\s+/g, " ").trim();
    if (clean.length >= 8 && clean.length <= 60 && /[A-Za-z]/.test(clean)) {
      const upper = clean.toUpperCase();
      if (
        upper.includes("ORGANIZER") ||
        upper.includes("OBJECT") ||
        upper.includes("COLLECTION") ||
        upper.includes("PLAQUE") ||
        upper.includes("SUPPORT")
      ) {
        return clean.replace(/\b\w/g, (c) => c.toUpperCase());
      }
    }
  }

  return null;
}

function classifyText(text) {
  const normalized = normalizeText(text);

  for (const pattern of EXCLUDE_PATTERNS) {
    if (pattern.test(normalized)) return { action: "exclude", reason: pattern.source };
  }

  for (const rule of UNIVERSE_RULES) {
    for (const pattern of rule.patterns) {
      if (pattern.test(normalized)) {
        return { action: "classify", universe: rule.universe };
      }
    }
  }

  if (/MUS\s*E/.test(normalized) || normalized.includes("MUSE")) {
    return { action: "classify", universe: DEFAULT_UNIVERSE, reason: "muse-default" };
  }

  return { action: "classify", universe: DEFAULT_UNIVERSE, reason: "fallback" };
}

async function ocrImage(filePath) {
  const result = await Tesseract.recognize(filePath, "eng", {
    logger: () => {},
  });
  return result.data.text ?? "";
}

async function main() {
  const files = listImages();
  const universeMap = {};
  const productMeta = {};
  const stats = { excluded: 0, classified: 0, byUniverse: {} };

  console.log(`Classification OCR de ${files.length} images...\n`);

  for (const filename of files) {
    const rel = `/products/${filename}`;

    if (HARD_EXCLUDE.has(filename) || isDuplicate(filename) || isUpperUuid(filename)) {
      universeMap[rel] = "_exclude";
      stats.excluded++;
      console.log(`✗ exclu   ${filename}`);
      continue;
    }

    const filePath = path.join(PRODUCTS_DIR, filename);
    const text = await ocrImage(filePath);
    const productName = extractProductName(text);
    const decision = classifyText(`${text}\n${productName ?? ""}`);

    if (decision.action === "exclude") {
      universeMap[rel] = "_exclude";
      stats.excluded++;
      console.log(`✗ exclu   ${filename} (${decision.reason})`);
      continue;
    }

    universeMap[rel] = decision.universe;
    stats.classified++;
    stats.byUniverse[decision.universe] = (stats.byUniverse[decision.universe] ?? 0) + 1;

    if (productName) {
      productMeta[rel] = { name: productName };
    }

    console.log(`✓ ${decision.universe.padEnd(28)} ${filename}${productName ? ` → ${productName}` : ""}`);
  }

  fs.writeFileSync(MAP_FILE, JSON.stringify(universeMap, null, 2) + "\n");
  fs.writeFileSync(META_FILE, JSON.stringify(productMeta, null, 2) + "\n");

  console.log("\n--- Résumé ---");
  console.log(`Classifiées : ${stats.classified}`);
  console.log(`Exclues     : ${stats.excluded}`);
  console.log("Par univers :", stats.byUniverse);
  console.log(`\n✓ ${MAP_FILE}`);
  console.log(`✓ ${META_FILE}`);
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
