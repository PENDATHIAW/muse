import fs from "fs";
import path from "path";
import productsJson from "@/data/products.json";
import photoUniverseMap from "@/data/photo-universe-map.json";
import { commitCatalogUpdates } from "@/lib/github-catalog";
import {
  buildCatalogProductFromImage,
  type CatalogProduct,
  type UndiscoveredImage,
} from "@/lib/scan-public-products";

const ROOT = process.cwd();

function writeJson(relativePath: string, data: unknown) {
  const fullPath = path.join(ROOT, relativePath);
  fs.writeFileSync(fullPath, JSON.stringify(data, null, 2) + "\n");
}

function appendLocally(
  newProducts: CatalogProduct[],
  photoMapUpdates: Record<string, string>
) {
  const existing = productsJson as CatalogProduct[];
  const existingPaths = new Set(
    existing.flatMap((p) => p.images?.map((i) => i.image_url) ?? [])
  );

  const toAdd = newProducts.filter(
    (p) => !existingPaths.has(p.images[0]?.image_url)
  );
  if (toAdd.length === 0) return { added: 0, committed: false };

  writeJson("data/products.json", [...existing, ...toAdd]);
  writeJson("data/photo-universe-map.json", {
    ...(photoUniverseMap as Record<string, string>),
    ...photoMapUpdates,
  });

  return { added: toAdd.length, committed: true };
}

export function buildProductsFromImages(
  images: UndiscoveredImage[],
  startDisplayOrder: number
): { products: CatalogProduct[]; photoMapUpdates: Record<string, string> } {
  const products: CatalogProduct[] = [];
  const photoMapUpdates: Record<string, string> = {};

  images.forEach((image, index) => {
    products.push(
      buildCatalogProductFromImage(image, image.refNum, startDisplayOrder + index + 1)
    );
    photoMapUpdates[image.imagePath] = image.universeSlug;
  });

  return { products, photoMapUpdates };
}

export async function persistNewCatalogProducts(
  newProducts: CatalogProduct[],
  photoMapUpdates: Record<string, string>
) {
  const token = process.env.GITHUB_TOKEN ?? process.env.GH_TOKEN;

  if (token) {
    return commitCatalogUpdates({ newProducts, photoMapUpdates });
  }

  if (process.env.NODE_ENV === "development") {
    return appendLocally(newProducts, photoMapUpdates);
  }

  throw new Error(
    "Impossible d'enregistrer le catalogue : configurez GITHUB_TOKEN sur Vercel (scope repo) pour valider depuis l'admin."
  );
}
