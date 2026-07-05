import type {
  DashboardStats,
  Inquiry,
  Product,
  ProductFilters,
  ProductImage,
  SettingsMap,
  Universe,
} from "@/types/database";
import * as catalog from "@/lib/catalog";

export async function getActiveUniverses(): Promise<Universe[]> {
  return catalog.getActiveUniverses();
}

export async function getUniverseBySlug(slug: string): Promise<Universe | null> {
  return catalog.getUniverseBySlug(slug);
}

export async function getPublishedProducts(
  filters: ProductFilters = {}
): Promise<Product[]> {
  return catalog.getPublishedProducts(filters);
}

export async function getFeaturedProducts(limit = 6): Promise<Product[]> {
  return catalog.getFeaturedProducts(limit);
}

export async function getProductBySlug(slug: string): Promise<Product | null> {
  return catalog.getProductBySlug(slug);
}

export async function getSimilarProducts(
  product: Product,
  limit = 4
): Promise<Product[]> {
  return catalog.getSimilarProducts(product, limit);
}

export async function getAllUniversesAdmin(): Promise<Universe[]> {
  return catalog.getAllUniversesAdmin();
}

export async function getUniverseByIdAdmin(id: string): Promise<Universe | null> {
  return catalog.getUniverseByIdAdmin(id);
}

export async function getAllProductsAdmin(): Promise<Product[]> {
  return catalog.getAllProductsAdmin();
}

export async function getProductByIdAdmin(id: string): Promise<Product | null> {
  return catalog.getProductByIdAdmin(id);
}

export async function getAllInquiriesAdmin(): Promise<Inquiry[]> {
  return [];
}

export async function getAllProductImagesAdmin(): Promise<ProductImage[]> {
  return catalog.getAllProductImagesAdmin();
}

export async function getSettings(): Promise<SettingsMap> {
  return catalog.getSettings();
}

export async function getDashboardStats(): Promise<DashboardStats> {
  return catalog.getDashboardStats();
}

export async function getRecentProductsAdmin(limit = 5): Promise<Product[]> {
  return catalog.getRecentProductsAdmin(limit);
}

export async function getRecentInquiriesAdmin(): Promise<Inquiry[]> {
  return [];
}

export async function getAllColorsAndFinishes(): Promise<{
  colors: string[];
  finishes: string[];
}> {
  return catalog.getAllColorsAndFinishes();
}
