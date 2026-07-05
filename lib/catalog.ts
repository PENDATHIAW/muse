import universesJson from "@/data/universes.json";
import productsJson from "@/data/products.json";
import settingsJson from "@/data/settings.json";
import type {
  DashboardStats,
  Product,
  ProductFilters,
  ProductImage,
  SettingsMap,
  Universe,
} from "@/types/database";

const NOW = "2026-01-01T00:00:00.000Z";

type RawUniverse = Omit<Universe, "created_at" | "updated_at">;
type RawProductImage = Omit<ProductImage, "product_id" | "created_at">;
type RawProduct = Omit<
  Product,
  "created_at" | "updated_at" | "universe" | "images"
> & {
  images?: RawProductImage[];
};

function mapUniverse(raw: RawUniverse): Universe {
  return { ...raw, created_at: NOW, updated_at: NOW };
}

function mapProduct(raw: RawProduct, universes: Universe[]): Product {
  const universe = universes.find((u) => u.id === raw.universe_id);
  const images: ProductImage[] = (raw.images ?? []).map((img) => ({
    ...img,
    product_id: raw.id,
    created_at: NOW,
  }));

  return {
    ...raw,
    created_at: NOW,
    updated_at: NOW,
    universe,
    images,
  };
}

function getUniversesRaw(): Universe[] {
  return (universesJson as RawUniverse[]).map(mapUniverse);
}

function getProductsRaw(): Product[] {
  const universes = getUniversesRaw();
  return (productsJson as RawProduct[]).map((p) => mapProduct(p, universes));
}

export function getActiveUniverses(): Universe[] {
  return getUniversesRaw()
    .filter((u) => u.is_active)
    .sort((a, b) => a.display_order - b.display_order);
}

export function getUniverseBySlug(slug: string): Universe | null {
  return getActiveUniverses().find((u) => u.slug === slug) ?? null;
}

export function getAllUniversesAdmin(): Universe[] {
  return getUniversesRaw().sort((a, b) => a.display_order - b.display_order);
}

export function getUniverseByIdAdmin(id: string): Universe | null {
  return getUniversesRaw().find((u) => u.id === id) ?? null;
}

export function getPublishedProducts(filters: ProductFilters = {}): Product[] {
  let products = getProductsRaw().filter((p) => p.status === "published");

  if (filters.universeSlug) {
    products = products.filter(
      (p) => p.universe?.slug === filters.universeSlug
    );
  }

  if (filters.search) {
    const q = filters.search.toLowerCase();
    products = products.filter(
      (p) =>
        p.name.toLowerCase().includes(q) ||
        p.short_description.toLowerCase().includes(q)
    );
  }

  if (filters.minPrice != null) {
    products = products.filter((p) => p.price >= filters.minPrice!);
  }

  if (filters.maxPrice != null) {
    products = products.filter((p) => p.price <= filters.maxPrice!);
  }

  if (filters.color) {
    products = products.filter((p) =>
      p.colors.some((c) => c.toLowerCase() === filters.color!.toLowerCase())
    );
  }

  if (filters.finish) {
    products = products.filter((p) =>
      p.finishes.some((f) => f.toLowerCase() === filters.finish!.toLowerCase())
    );
  }

  switch (filters.sort) {
    case "price_asc":
      products.sort((a, b) => a.price - b.price);
      break;
    case "price_desc":
      products.sort((a, b) => b.price - a.price);
      break;
    case "popular":
      products.sort((a, b) => {
        if (a.is_featured !== b.is_featured) return a.is_featured ? -1 : 1;
        return a.display_order - b.display_order;
      });
      break;
    default:
      products.sort((a, b) => b.display_order - a.display_order);
  }

  return products;
}

export function getFeaturedProducts(limit = 6): Product[] {
  return getPublishedProducts({ sort: "popular" })
    .filter((p) => p.is_featured)
    .slice(0, limit);
}

export function getProductBySlug(slug: string): Product | null {
  return (
    getProductsRaw().find((p) => p.slug === slug && p.status === "published") ??
    null
  );
}

export function getSimilarProducts(product: Product, limit = 4): Product[] {
  return getPublishedProducts({ universeSlug: product.universe?.slug })
    .filter((p) => p.id !== product.id)
    .slice(0, limit);
}

export function getAllProductsAdmin(): Product[] {
  return getProductsRaw().sort((a, b) => a.display_order - b.display_order);
}

export function getProductByIdAdmin(id: string): Product | null {
  return getProductsRaw().find((p) => p.id === id) ?? null;
}

export function getAllProductImagesAdmin(): ProductImage[] {
  return getProductsRaw().flatMap((p) =>
    (p.images ?? []).map((img) => ({
      ...img,
      product: { id: p.id, name: p.name, slug: p.slug },
    }))
  );
}

export function getSettings(): SettingsMap {
  return settingsJson as SettingsMap;
}

export function getDashboardStats(): DashboardStats {
  const products = getProductsRaw();
  const universes = getUniversesRaw();
  return {
    productsCount: products.length,
    universesCount: universes.length,
    inquiriesCount: 0,
    newInquiriesCount: 0,
  };
}

export function getRecentProductsAdmin(limit = 5): Product[] {
  return [...getProductsRaw()]
    .sort((a, b) => b.display_order - a.display_order)
    .slice(0, limit);
}

export function getAllColorsAndFinishes(): {
  colors: string[];
  finishes: string[];
} {
  const colors = new Set<string>();
  const finishes = new Set<string>();
  getPublishedProducts().forEach((p) => {
    p.colors.forEach((c) => colors.add(c));
    p.finishes.forEach((f) => finishes.add(f));
  });
  return {
    colors: Array.from(colors).sort(),
    finishes: Array.from(finishes).sort(),
  };
}

export const GITHUB_REPO = "PENDATHIAW/muse";
export const GITHUB_BRANCH = "main";

export function githubEditUrl(path: string) {
  return `https://github.com/${GITHUB_REPO}/edit/${GITHUB_BRANCH}/${path}`;
}
