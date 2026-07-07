import path from "path";
import productsJson from "@/data/products.json";
import photoUniverseMap from "@/data/photo-universe-map.json";
import productTypeMap from "@/data/product-type-map.json";
import universesJson from "@/data/universes.json";
import universeCatalog from "@/data/universe-catalog.json";
import copyData from "@/data/muse-product-copy.json";
import { buildProductNameFromRef } from "@/lib/universe-catalog";
import { slugify } from "@/lib/utils-muse";
import type { Universe } from "@/types/database";

const IMAGE_EXT = new Set([".jpg", ".jpeg", ".png", ".webp", ".gif"]);

const KEYWORD_UNIVERSE: Array<[string, string]> = [
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

const MAP = photoUniverseMap as Record<string, string>;
const TYPE_MAP = productTypeMap as Record<string, string>;
const UNIVERSE_CONTENT = universeCatalog as Record<
  string,
  { inspiration: string; usage: string; placement: string; price: number; material: string; print_time: string; personalization: string[] }
>;
const COPY = copyData.copy as Record<string, { shorts: string[]; longs: string[] }>;

function formatRef(num: number) {
  return `M${String(num).padStart(2, "0")}`;
}

function buildProductName(
  universeSlug: string,
  refNum: number,
  typeLabel: string | null
) {
  if (typeLabel) return `${typeLabel} REF ${formatRef(refNum)}`;
  return buildProductNameFromRef(universeSlug, refNum);
}

function buildProductCopy(universeSlug: string, refNum: number, productName: string) {
  const templates = COPY[universeSlug] ?? COPY._default;
  const idx = (refNum - 1) % templates.shorts.length;
  return {
    short_description: templates.shorts[idx].replaceAll("{ref}", productName),
    long_description: templates.longs[idx]
      .replaceAll("{ref}", productName)
      .replaceAll("{num}", String(refNum)),
  };
}

export type ScannedFile = {
  imagePath: string;
  filename: string;
  relativePath: string;
};

export type UndiscoveredImage = ScannedFile & {
  universeSlug: string;
  universeName: string;
  typeLabel: string | null;
  suggestedName: string;
  suggestedPrice: number;
  refNum: number;
};

type RawProduct = {
  images?: Array<{ image_url: string }>;
  universe_id: string;
  name: string;
};

function resolveUniverseFromMap(relativePath: string, filename: string): string | null {
  const key = relativePath.replace(/\\/g, "/");
  const candidates = [
    key,
    filename,
    `/products/${key}`,
    `/products/${filename}`,
  ];
  for (const candidate of candidates) {
    if (MAP[candidate]) return MAP[candidate];
  }
  return null;
}

function guessUniverse(relativePath: string, filename: string): string {
  const mapped = resolveUniverseFromMap(relativePath, filename);
  if (mapped && mapped !== "_exclude") return mapped;

  const haystack = `${relativePath} ${filename}`.toLowerCase();
  for (const [keyword, universe] of KEYWORD_UNIVERSE) {
    if (haystack.includes(keyword)) return universe;
  }

  return "vide-poche-teranga";
}

export function scanPublicProductFiles(): ScannedFile[] {
  // On production builds/deployments this scan is intentionally disabled:
  // Vercel traces local fs reads and can pull all product images into serverless bundles.
  if (process.env.NODE_ENV === "production") return [];

  const fs = require("node:fs") as typeof import("node:fs");
  const productsDir = path.join(process.cwd(), "public/products");

  if (!fs.existsSync(productsDir)) return [];

  const results: ScannedFile[] = [];

  for (const entry of fs.readdirSync(productsDir, { withFileTypes: true })) {
    if (entry.name.startsWith(".") || entry.name === "README.md") continue;
    if (entry.isDirectory()) continue;

    const ext = path.extname(entry.name).toLowerCase();
    if (!IMAGE_EXT.has(ext)) continue;

    results.push({
      imagePath: `/products/${entry.name}`,
      filename: entry.name,
      relativePath: entry.name,
    });
  }

  return results.sort((a, b) => a.filename.localeCompare(b.filename));
}

export function getKnownCatalogImagePaths(): Set<string> {
  const known = new Set<string>();
  for (const product of productsJson as RawProduct[]) {
    for (const img of product.images ?? []) {
      if (img.image_url) known.add(img.image_url);
    }
  }
  return known;
}

function getUniversesBySlug(): Record<string, Universe> {
  return Object.fromEntries(
    (universesJson as Universe[]).map((u) => [u.slug, u])
  );
}

function countRefsByUniverse(products: RawProduct[]): Record<string, number> {
  const counts: Record<string, number> = {};
  for (const product of products) {
    counts[product.universe_id] = (counts[product.universe_id] ?? 0) + 1;
  }
  return counts;
}

export function getUndiscoveredImages(): UndiscoveredImage[] {
  const known = getKnownCatalogImagePaths();
  const universesBySlug = getUniversesBySlug();
  const refCounts = countRefsByUniverse(productsJson as RawProduct[]);
  const pending: UndiscoveredImage[] = [];

  for (const file of scanPublicProductFiles()) {
    if (known.has(file.imagePath)) continue;

    const mapped = resolveUniverseFromMap(file.relativePath, file.filename);
    if (mapped === "_exclude") continue;

    let universeSlug = guessUniverse(file.relativePath, file.filename);
    const typeLabel = TYPE_MAP[file.imagePath] ?? null;
    if (typeLabel) universeSlug = "salaah";

    const universe = universesBySlug[universeSlug];
    if (!universe) continue;

    const refNum = (refCounts[universeSlug] ?? 0) + 1;
    refCounts[universeSlug] = refNum;

    const suggestedName = buildProductName(universeSlug, refNum, typeLabel);
    const catalogEntry = UNIVERSE_CONTENT[universeSlug];

    pending.push({
      ...file,
      universeSlug,
      universeName: universe.name,
      typeLabel,
      suggestedName,
      suggestedPrice: catalogEntry?.price ?? 10000,
      refNum,
    });
  }

  return pending;
}

export type CatalogProduct = {
  id: string;
  universe_id: string;
  name: string;
  slug: string;
  short_description: string;
  long_description: string;
  usage: string;
  inspiration: string;
  placement: string;
  price: number;
  old_price: null;
  dimensions: string;
  print_time: string;
  material: string;
  colors: string[];
  finishes: string[];
  personalization_options: string[];
  stock_status: string;
  status: string;
  is_featured: boolean;
  display_order: number;
  tags: string[];
  internal_note: string;
  images: Array<{
    id: string;
    image_url: string;
    alt_text: string;
    is_main: boolean;
    display_order: number;
  }>;
};

export function buildCatalogProductFromImage(
  image: UndiscoveredImage,
  refNum: number,
  displayOrder: number
): CatalogProduct {
  const content = UNIVERSE_CONTENT[image.universeSlug] ?? {
    price: 10000,
    material: "PLA mat ou PETG",
    print_time: "4-6 heures",
    personalization: ["couleur", "personnalisation"],
    inspiration:
      "Conçu par MUSE pour allier utilité, esthétique et personnalisation au quotidien.",
    usage:
      "Utilisez cet objet selon vos besoins. Contactez-nous pour une variante sur mesure.",
    placement: "Entrée, salon, chambre, bureau ou espace commercial selon votre projet.",
  };

  const name = buildProductName(image.universeSlug, refNum, image.typeLabel);
  const slug = slugify(path.basename(image.filename, path.extname(image.filename)));
  const copy = buildProductCopy(image.universeSlug, refNum, name);

  return {
    id: slug,
    universe_id: image.universeSlug,
    name,
    slug,
    short_description: copy.short_description,
    long_description: copy.long_description,
    usage: content.usage,
    inspiration: content.inspiration,
    placement: content.placement,
    price: content.price,
    old_price: null,
    dimensions: "Sur mesure — indiquez vos contraintes lors de la commande",
    print_time: content.print_time,
    material: content.material,
    colors: ["ivoire", "sage", "terracotta", "moka", "noir mat"],
    finishes: ["mat"],
    personalization_options: content.personalization,
    stock_status: "available",
    status: "published",
    is_featured: displayOrder <= 2,
    display_order: displayOrder,
    tags: ["nouveauté", "personnalisable", image.universeSlug.replace(/-/g, " ")],
    internal_note: `Ajout admin depuis ${image.imagePath} — ${name}`,
    images: [
      {
        id: `${slug}-main`,
        image_url: image.imagePath,
        alt_text: `${name} MUSE`,
        is_main: true,
        display_order: 0,
      },
    ],
  };
}
