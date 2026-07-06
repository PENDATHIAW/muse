import fs from "fs";
import path from "path";
import { fileURLToPath } from "url";

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const COPY_FILE = path.join(__dirname, "../data/muse-product-copy.json");

const DATA = JSON.parse(fs.readFileSync(COPY_FILE, "utf8"));

export const TYPE_LABELS = DATA.typeLabels;

export function formatRef(num) {
  return `M${String(num).padStart(2, "0")}`;
}

export function buildProductName(universeSlug, refNum, typeLabel = null) {
  const type = typeLabel ?? TYPE_LABELS[universeSlug] ?? "OBJET MUSE";
  return `${type} REF ${formatRef(refNum)}`;
}

export function buildProductCopy(universeSlug, refNum, productName) {
  const templates = DATA.copy[universeSlug] ?? DATA.copy._default;
  const idx = (refNum - 1) % templates.shorts.length;

  const short_description = templates.shorts[idx].replaceAll("{ref}", productName);
  const long_description = templates.longs[idx]
    .replaceAll("{ref}", productName)
    .replaceAll("{num}", String(refNum));

  return { short_description, long_description };
}
