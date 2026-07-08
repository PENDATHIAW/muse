#!/usr/bin/env node
/**
 * Classifie automatiquement les photos de public/products/ vers un univers MUSE
 * via analyse visuelle (CLIP) + heuristiques filename.
 *
 * Usage:
 *   npm run classify-photos
 */

import fs from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";
import { pipeline } from "@xenova/transformers";

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const ROOT = path.join(__dirname, "..");
const PRODUCTS_DIR = path.join(ROOT, "public/products");
const MAP_PATH = path.join(ROOT, "data/photo-universe-map.json");
const REPORT_PATH = path.join(ROOT, "data/auto-universe-report.json");
const argv = process.argv.slice(2);
const dryRun = argv.includes("--dry-run");
const limitArgIndex = argv.findIndex((arg) => arg === "--limit");
const limit =
  limitArgIndex >= 0 && argv[limitArgIndex + 1]
    ? Number(argv[limitArgIndex + 1])
    : null;

const IMAGE_EXT = new Set([".jpg", ".jpeg", ".png", ".webp", ".gif"]);

const KEYWORD_UNIVERSE = [
  ["muse-kitchen", "muse-kitchen"],
  ["kitchen", "muse-kitchen"],
  ["cuisine", "muse-kitchen"],
  ["organisateur", "muse-kitchen"],
  ["couverts", "muse-kitchen"],
  ["drain", "muse-kitchen"],
  ["charge-guard", "muse-tech-charge-guard"],
  ["charge", "muse-tech-charge-guard"],
  ["chargeur", "muse-tech-charge-guard"],
  ["tech", "muse-tech-charge-guard"],
  ["plaque", "plaques-de-porte-chez-nous"],
  ["chez", "plaques-de-porte-chez-nous"],
  ["porte", "plaques-de-porte-chez-nous"],
  ["cles", "boite-a-cles-murale"],
  ["cle", "boite-a-cles-murale"],
  ["key", "boite-a-cles-murale"],
  ["teranga", "vide-poche-teranga"],
  ["vide-poche", "vide-poche-teranga"],
  ["moussor", "porte-moussor-foulards"],
  ["foulard", "porte-moussor-foulards"],
  ["bijoux", "boite-a-bijoux"],
  ["bijou", "support-bijoux-coiffeuse"],
  ["coiffeuse", "support-bijoux-coiffeuse"],
  ["tasbih", "salaah"],
  ["chapelet", "salaah"],
  ["salaah", "salaah"],
  ["salah", "salaah"],
  ["priere", "salaah"],
  ["prière", "salaah"],
  ["natte", "salaah"],
  ["mihrab", "salaah"],
  ["naissance", "plaques-naissance-bapteme"],
  ["bapteme", "plaques-naissance-bapteme"],
  ["baptême", "plaques-naissance-bapteme"],
  ["qr", "supports-qr-paiement"],
  ["wave", "supports-qr-paiement"],
  ["orange-money", "supports-qr-paiement"],
  ["etiquette", "etiquettes-prix-boutiques"],
  ["flyer", "porte-cartes-flyers"],
  ["carte", "porte-cartes-flyers"],
  ["thiouraye", "supports-parfum-thiouraye"],
  ["parfum", "supports-parfum-thiouraye"],
  ["cache-pot", "cache-pot-decoratif"],
  ["plante", "cache-pot-decoratif"],
  ["senegal", "mini-deco-murale-senegal"],
  ["deco", "mini-deco-murale-senegal"],
  ["telephone", "support-telephone-vide-poche"],
];

const UNIVERSE_LABELS = {
  "muse-kitchen": [
    "3d printed kitchen organizer",
    "kitchen utensil holder",
    "draining cutlery organizer",
  ],
  "muse-tech-charge-guard": [
    "3d printed phone charger cable organizer",
    "tech cable holder",
    "desk charging station",
  ],
  "plaques-de-porte-chez-nous": [
    "personalized door name plate",
    "home name sign",
    "wall mounted name plaque",
  ],
  "boite-a-cles-murale": [
    "wall mounted key holder box",
    "key organizer for entryway",
    "house key rack",
  ],
  "vide-poche-teranga": [
    "entryway catchall tray",
    "small decorative tray for keys",
    "pocket emptying tray",
  ],
  "support-telephone-vide-poche": [
    "phone stand with tray",
    "desk phone holder",
    "bedside phone organizer",
  ],
  "porte-moussor-foulards": [
    "scarf organizer",
    "headscarf holder",
    "wall scarf rack",
  ],
  "support-bijoux-coiffeuse": [
    "jewelry stand",
    "earring necklace organizer",
    "vanity jewelry holder",
  ],
  "boite-a-bijoux": [
    "jewelry box",
    "small decorative jewelry storage",
    "custom jewelry container",
  ],
  salaah: [
    "islamic prayer accessory holder",
    "tasbih holder",
    "prayer corner organizer",
  ],
  "plaques-naissance-bapteme": [
    "baby name plaque",
    "birth announcement sign",
    "christening commemorative plaque",
  ],
  "supports-qr-paiement": [
    "payment qr code stand",
    "countertop qr holder",
    "store payment display stand",
  ],
  "etiquettes-prix-boutiques": [
    "price tag holder for boutique",
    "shop shelf label holder",
    "retail price display",
  ],
  "porte-cartes-flyers": [
    "business card holder",
    "flyer display stand",
    "counter brochure holder",
  ],
  "supports-parfum-thiouraye": [
    "incense holder decorative stand",
    "perfume display stand",
    "decorative fragrance stand",
  ],
  "cache-pot-decoratif": [
    "decorative plant pot cover",
    "small planter cover",
    "indoor plant decorative pot",
  ],
  "mini-deco-murale-senegal": [
    "senegal wall decor",
    "african decorative wall art",
    "small cultural wall decoration",
  ],
};

function loadMap() {
  if (!fs.existsSync(MAP_PATH)) return {};
  try {
    return JSON.parse(fs.readFileSync(MAP_PATH, "utf8"));
  } catch {
    return {};
  }
}

function saveJson(filePath, data) {
  fs.writeFileSync(filePath, JSON.stringify(data, null, 2) + "\n");
}

function getImages() {
  if (!fs.existsSync(PRODUCTS_DIR)) return [];
  return fs
    .readdirSync(PRODUCTS_DIR, { withFileTypes: true })
    .filter((entry) => entry.isFile())
    .map((entry) => entry.name)
    .filter((filename) => IMAGE_EXT.has(path.extname(filename).toLowerCase()))
    .sort((a, b) => a.localeCompare(b));
}

function guessUniverseByKeyword(filename) {
  const haystack = filename.toLowerCase();
  for (const [keyword, universe] of KEYWORD_UNIVERSE) {
    if (haystack.includes(keyword)) return universe;
  }
  return null;
}

function buildPromptIndex() {
  const index = [];
  const promptToUniverse = {};
  for (const [universe, prompts] of Object.entries(UNIVERSE_LABELS)) {
    for (const prompt of prompts) {
      index.push({ universe, prompt });
      promptToUniverse[prompt] = universe;
    }
  }
  return { index, promptToUniverse };
}

async function main() {
  const allFiles = getImages();
  const files =
    Number.isFinite(limit) && limit && limit > 0 ? allFiles.slice(0, limit) : allFiles;
  if (files.length === 0) {
    console.error("Aucune image trouvée dans public/products");
    process.exit(1);
  }

  const map = loadMap();
  const { index: promptIndex, promptToUniverse } = buildPromptIndex();
  const labels = promptIndex.map((item) => item.prompt);
  const report = [];
  const universeCount = {};
  const errorFiles = [];

  console.log(`→ Chargement du classifieur visuel (CLIP)...`);
  const classifier = await pipeline(
    "zero-shot-image-classification",
    "Xenova/clip-vit-base-patch32"
  );
  console.log(`→ Classification de ${files.length} image(s)...`);

  for (let i = 0; i < files.length; i++) {
    const filename = files[i];
    const imagePath = path.join(PRODUCTS_DIR, filename);
    const mapKey = `/products/${filename}`;
    const current = map[mapKey] ?? null;

    if (current === "_exclude") {
      report.push({
        filename,
        universe: "_exclude",
        source: "map",
        confidence: 1,
      });
      continue;
    }

    const keywordUniverse = guessUniverseByKeyword(filename);
    if (keywordUniverse) {
      map[mapKey] = keywordUniverse;
      universeCount[keywordUniverse] = (universeCount[keywordUniverse] ?? 0) + 1;
      report.push({
        filename,
        universe: keywordUniverse,
        source: "keyword",
        confidence: 1,
      });
      continue;
    }

    // On conserve les affectations explicites déjà différentes du fallback historique.
    if (current && current !== "vide-poche-teranga") {
      universeCount[current] = (universeCount[current] ?? 0) + 1;
      report.push({
        filename,
        universe: current,
        source: "map",
        confidence: 1,
      });
      continue;
    }

    let predictions;
    try {
      predictions = await classifier(imagePath, labels);
    } catch (error) {
      // Certaines images locales peuvent être corrompues/illisibles.
      // On ne bloque pas tout le lot : on les marque "a-classer" et on continue.
      map[mapKey] = "a-classer";
      errorFiles.push({
        filename,
        reason: error instanceof Error ? error.message : String(error),
      });
      report.push({
        filename,
        universe: "a-classer",
        source: "error",
        confidence: 0,
      });
      continue;
    }

    const bestByUniverse = new Map();
    for (const prediction of predictions) {
      const universe = promptToUniverse[prediction.label];
      if (!universe) continue;
      const prev = bestByUniverse.get(universe) ?? 0;
      if (prediction.score > prev) {
        bestByUniverse.set(universe, prediction.score);
      }
    }

    const ranked = Array.from(bestByUniverse.entries()).sort((a, b) => b[1] - a[1]);
    const [bestUniverse, confidence] = ranked[0] ?? ["a-classer", 0];

    map[mapKey] = bestUniverse;
    universeCount[bestUniverse] = (universeCount[bestUniverse] ?? 0) + 1;
    report.push({
      filename,
      universe: bestUniverse,
      source: "vision",
      confidence: Number(confidence.toFixed(6)),
      top3: ranked.slice(0, 3).map(([universe, score]) => ({
        universe,
        score: Number(score.toFixed(6)),
      })),
    });

    if ((i + 1) % 20 === 0 || i + 1 === files.length) {
      console.log(`… ${i + 1}/${files.length}`);
    }
  }

  if (!dryRun) {
    saveJson(MAP_PATH, map);
    saveJson(REPORT_PATH, report);
    if (errorFiles.length > 0) {
      saveJson(path.join(ROOT, "data/auto-universe-errors.json"), errorFiles);
    }
  }

  console.log("\n✅ Classification terminée");
  console.log("Répartition univers :");
  Object.entries(universeCount)
    .sort((a, b) => b[1] - a[1])
    .forEach(([universe, count]) => {
      console.log(`- ${universe}: ${count}`);
    });
  if (dryRun) {
    console.log("\nMode dry-run : aucun fichier modifié.");
  } else {
    console.log(`\nFichiers générés :`);
    console.log(`- data/photo-universe-map.json`);
    console.log(`- data/auto-universe-report.json`);
    if (errorFiles.length > 0) {
      console.log(`- data/auto-universe-errors.json (${errorFiles.length} image(s) à classer)`);
    }
  }
}

main().catch((error) => {
  console.error("Erreur classification:", error instanceof Error ? error.message : error);
  process.exit(1);
});
