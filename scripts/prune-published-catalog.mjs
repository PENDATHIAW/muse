#!/usr/bin/env node
/**
 * Garde dans data/products.json uniquement les produits déjà publiés
 * dont la photo existe encore dans public/products/.
 * Les nouvelles photos restent visibles dans l'admin (non publiées).
 *
 * Usage: npm run prune-catalog
 */

import fs from "fs";
import path from "path";
import { fileURLToPath } from "url";

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const ROOT = path.join(__dirname, "..");
const PRODUCTS_DIR = path.join(ROOT, "public/products");
const PRODUCTS_JSON = path.join(ROOT, "data/products.json");

const IMAGE_EXT = new Set([".jpg", ".jpeg", ".png", ".webp", ".gif"]);

function listProductImages() {
  if (!fs.existsSync(PRODUCTS_DIR)) return new Set();
  const paths = new Set();
  for (const entry of fs.readdirSync(PRODUCTS_DIR, { withFileTypes: true })) {
    if (!entry.isFile()) continue;
    if (!IMAGE_EXT.has(path.extname(entry.name).toLowerCase())) continue;
    paths.add(`/products/${entry.name}`);
  }
  return paths;
}

const existing = listProductImages();
const products = JSON.parse(fs.readFileSync(PRODUCTS_JSON, "utf8"));
const before = products.length;

const kept = products.filter((product) => {
  const url = product.images?.[0]?.image_url;
  return url && existing.has(url);
});

fs.writeFileSync(PRODUCTS_JSON, JSON.stringify(kept, null, 2) + "\n");

const removed = before - kept.length;
const unpublished = existing.size - kept.length;

console.log(`✓ ${kept.length} produit(s) publié(s) conservé(s)`);
console.log(`✓ ${removed} entrée(s) retirée(s) du catalogue (photo absente)`);
console.log(`✓ ${Math.max(0, unpublished)} photo(s) non publiée(s) — visibles dans l'admin`);
