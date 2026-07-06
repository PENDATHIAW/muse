#!/usr/bin/env node
/**
 * Source officielle locale : public/assets/products/
 * Cible déployée sur GitHub/Vercel : public/products/
 *
 * Usage: npm run sync-product-photos
 */

import fs from "fs";
import path from "path";
import { fileURLToPath } from "url";

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const ROOT = path.join(__dirname, "..");
const SOURCE = path.join(ROOT, "public/assets/products");
const TARGET = path.join(ROOT, "public/products");

const IMAGE_EXT = new Set([".jpg", ".jpeg", ".png", ".webp", ".gif"]);

const SKIP_PATTERNS = [
  /chatgpt/i,
  /gemini/i,
  /logo/i,
  /cncr/i,
  /brand/i,
  /readme/i,
  /\.md$/i,
];

function shouldSkip(filename) {
  return SKIP_PATTERNS.some((re) => re.test(filename));
}

function isImage(filename) {
  return IMAGE_EXT.has(path.extname(filename).toLowerCase());
}

function clearTargetImages() {
  if (!fs.existsSync(TARGET)) {
    fs.mkdirSync(TARGET, { recursive: true });
    return 0;
  }

  let removed = 0;
  for (const entry of fs.readdirSync(TARGET, { withFileTypes: true })) {
    if (entry.name === "README.md") continue;
    const full = path.join(TARGET, entry.name);
    if (entry.isDirectory()) {
      fs.rmSync(full, { recursive: true, force: true });
      removed++;
      continue;
    }
    if (isImage(entry.name)) {
      fs.unlinkSync(full);
      removed++;
    }
  }
  return removed;
}

function copyFromSource() {
  if (!fs.existsSync(SOURCE)) {
    console.error("Dossier introuvable : public/assets/products/");
    console.error("Créez-le et mettez vos visuels dedans, puis relancez.");
    process.exit(1);
  }

  let copied = 0;
  let skipped = 0;

  for (const entry of fs.readdirSync(SOURCE, { withFileTypes: true })) {
    if (entry.name.startsWith(".") || entry.name === "README.md") continue;
    if (!entry.isFile() || !isImage(entry.name)) continue;
    if (shouldSkip(entry.name)) {
      skipped++;
      continue;
    }

    fs.copyFileSync(path.join(SOURCE, entry.name), path.join(TARGET, entry.name));
    copied++;
  }

  return { copied, skipped };
}

const removed = clearTargetImages();
const { copied, skipped } = copyFromSource();

console.log(`✓ ${removed} ancien(s) fichier(s) supprimé(s) dans public/products/`);
console.log(`✓ ${copied} photo(s) copiée(s) depuis public/assets/products/`);
if (skipped) console.log(`⚠ ${skipped} fichier(s) ignoré(s) (logo / IA / readme)`);
console.log("");
console.log("Étapes suivantes :");
console.log("  npm run prune-catalog");
console.log("  git add public/products/ data/products.json");
console.log("  git commit -m \"Photos officielles depuis assets/products\"");
console.log("  git push origin main");
