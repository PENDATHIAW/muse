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
import { isSupabaseConfigured } from "@/lib/supabase/config";
import { createClient } from "@/lib/supabase/server";
import { parseJsonArray } from "@/lib/utils-muse";

function mapProduct(row: Record<string, unknown>): Product {
  return {
    ...(row as unknown as Product),
    colors: parseJsonArray(row.colors),
    finishes: parseJsonArray(row.finishes),
    personalization_options: parseJsonArray(row.personalization_options),
    tags: parseJsonArray(row.tags),
    price: Number(row.price),
    old_price: row.old_price != null ? Number(row.old_price) : null,
  };
}

/** Supabase can be connected but still empty — fall back to bundled JSON catalog. */
function withCatalogFallback<T>(
  data: T[] | null | undefined,
  fallback: () => T[]
): T[] {
  if (!data?.length) return fallback();
  return data;
}

export async function getActiveUniverses(): Promise<Universe[]> {
  if (!isSupabaseConfigured()) return catalog.getActiveUniverses();
  try {
    const supabase = await createClient();
    const { data, error } = await supabase
      .from("universes")
      .select("*")
      .eq("is_active", true)
      .order("display_order", { ascending: true });

    if (error) throw error;
    return withCatalogFallback(data, catalog.getActiveUniverses);
  } catch {
    return catalog.getActiveUniverses();
  }
}

export async function getUniverseBySlug(slug: string): Promise<Universe | null> {
  if (!isSupabaseConfigured()) return catalog.getUniverseBySlug(slug);
  try {
    const supabase = await createClient();
    const { data, error } = await supabase
      .from("universes")
      .select("*")
      .eq("slug", slug)
      .eq("is_active", true)
      .single();

    if (error) throw error;
    return data ?? catalog.getUniverseBySlug(slug);
  } catch {
    return catalog.getUniverseBySlug(slug);
  }
}

export async function getPublishedProducts(
  filters: ProductFilters = {}
): Promise<Product[]> {
  if (!isSupabaseConfigured()) return catalog.getPublishedProducts(filters);
  try {
    const supabase = await createClient();
    let query = supabase
      .from("products")
      .select("*, universe:universes(*), images:product_images(*)")
      .eq("status", "published");

    if (filters.universeSlug) {
      const universe = await getUniverseBySlug(filters.universeSlug);
      if (universe) {
        query = query.eq("universe_id", universe.id);
      }
    }

    if (filters.search) {
      query = query.or(
        `name.ilike.%${filters.search}%,short_description.ilike.%${filters.search}%`
      );
    }

    if (filters.minPrice != null) {
      query = query.gte("price", filters.minPrice);
    }

    if (filters.maxPrice != null) {
      query = query.lte("price", filters.maxPrice);
    }

    switch (filters.sort) {
      case "price_asc":
        query = query.order("price", { ascending: true });
        break;
      case "price_desc":
        query = query.order("price", { ascending: false });
        break;
      case "popular":
        query = query
          .order("is_featured", { ascending: false })
          .order("display_order", { ascending: true });
        break;
      default:
        query = query.order("created_at", { ascending: false });
    }

    const { data, error } = await query;
    if (error) throw error;

    let products = (data ?? []).map((row) =>
      mapProduct(row as Record<string, unknown>)
    );

    if (filters.color) {
      products = products.filter((p) =>
        p.colors.some(
          (c) => c.toLowerCase() === filters.color!.toLowerCase()
        )
      );
    }

    if (filters.finish) {
      products = products.filter((p) =>
        p.finishes.some(
          (f) => f.toLowerCase() === filters.finish!.toLowerCase()
        )
      );
    }

    return withCatalogFallback(products, () =>
      catalog.getPublishedProducts(filters)
    );
  } catch {
    return catalog.getPublishedProducts(filters);
  }
}

export async function getFeaturedProducts(limit = 6): Promise<Product[]> {
  if (!isSupabaseConfigured()) return catalog.getFeaturedProducts(limit);
  try {
    const supabase = await createClient();
    const { data, error } = await supabase
      .from("products")
      .select("*, universe:universes(*), images:product_images(*)")
      .eq("status", "published")
      .eq("is_featured", true)
      .order("display_order", { ascending: true })
      .limit(limit);

    if (error) throw error;
    const products = (data ?? []).map((row) =>
      mapProduct(row as Record<string, unknown>)
    );
    return withCatalogFallback(products, () =>
      catalog.getFeaturedProducts(limit)
    );
  } catch {
    return catalog.getFeaturedProducts(limit);
  }
}

export async function getProductBySlug(slug: string): Promise<Product | null> {
  if (!isSupabaseConfigured()) return catalog.getProductBySlug(slug);
  try {
    const supabase = await createClient();
    const { data, error } = await supabase
      .from("products")
      .select("*, universe:universes(*), images:product_images(*)")
      .eq("slug", slug)
      .eq("status", "published")
      .single();

    if (error) throw error;
    return (
      mapProduct(data as Record<string, unknown>) ??
      catalog.getProductBySlug(slug)
    );
  } catch {
    return catalog.getProductBySlug(slug);
  }
}

export async function getSimilarProducts(
  product: Product,
  limit = 4
): Promise<Product[]> {
  if (!isSupabaseConfigured()) return catalog.getSimilarProducts(product, limit);
  try {
    const supabase = await createClient();
    const { data, error } = await supabase
      .from("products")
      .select("*, universe:universes(*), images:product_images(*)")
      .eq("status", "published")
      .eq("universe_id", product.universe_id)
      .neq("id", product.id)
      .order("is_featured", { ascending: false })
      .limit(limit);

    if (error) throw error;
    const products = (data ?? []).map((row) =>
      mapProduct(row as Record<string, unknown>)
    );
    return withCatalogFallback(products, () =>
      catalog.getSimilarProducts(product, limit)
    );
  } catch {
    return catalog.getSimilarProducts(product, limit);
  }
}

export async function getAllUniversesAdmin(): Promise<Universe[]> {
  if (!isSupabaseConfigured()) return catalog.getAllUniversesAdmin();
  const supabase = await createClient();
  const { data, error } = await supabase
    .from("universes")
    .select("*")
    .order("display_order", { ascending: true });

  if (error) throw error;
  return data ?? [];
}

export async function getUniverseByIdAdmin(id: string): Promise<Universe | null> {
  if (!isSupabaseConfigured()) return catalog.getUniverseByIdAdmin(id);
  const supabase = await createClient();
  const { data, error } = await supabase
    .from("universes")
    .select("*")
    .eq("id", id)
    .single();

  if (error) return null;
  return data;
}

export async function getAllProductsAdmin(): Promise<Product[]> {
  if (!isSupabaseConfigured()) return catalog.getAllProductsAdmin();
  const supabase = await createClient();
  const { data, error } = await supabase
    .from("products")
    .select("*, universe:universes(*), images:product_images(*)")
    .order("display_order", { ascending: true });

  if (error) throw error;
  return (data ?? []).map((row) => mapProduct(row as Record<string, unknown>));
}

export async function getProductByIdAdmin(id: string): Promise<Product | null> {
  if (!isSupabaseConfigured()) return catalog.getProductByIdAdmin(id);
  const supabase = await createClient();
  const { data, error } = await supabase
    .from("products")
    .select("*, universe:universes(*), images:product_images(*)")
    .eq("id", id)
    .single();

  if (error) return null;
  return mapProduct(data as Record<string, unknown>);
}

export async function getAllInquiriesAdmin(): Promise<Inquiry[]> {
  const supabase = await createClient();
  const { data, error } = await supabase
    .from("inquiries")
    .select("*, product:products(id, name, slug), universe:universes(id, name, slug)")
    .order("created_at", { ascending: false });

  if (error) throw error;
  return (data ?? []) as Inquiry[];
}

export async function getAllProductImagesAdmin(): Promise<ProductImage[]> {
  if (!isSupabaseConfigured()) return catalog.getAllProductImagesAdmin();
  const supabase = await createClient();
  const { data, error } = await supabase
    .from("product_images")
    .select("*, product:products(id, name, slug)")
    .order("display_order", { ascending: true });

  if (error) throw error;
  return (data ?? []) as ProductImage[];
}

export async function getSettings(): Promise<SettingsMap> {
  if (!isSupabaseConfigured()) return catalog.getSettings();
  try {
    const supabase = await createClient();
    const { data, error } = await supabase.from("settings").select("key, value");

    if (error) throw error;

    const settings = (data ?? []).reduce<SettingsMap>((acc, item) => {
      acc[item.key] = item.value;
      return acc;
    }, {});

    return Object.keys(settings).length
      ? settings
      : catalog.getSettings();
  } catch {
    return catalog.getSettings();
  }
}

export async function getDashboardStats(): Promise<DashboardStats> {
  if (!isSupabaseConfigured()) return catalog.getDashboardStats();
  const supabase = await createClient();

  const [products, universes, inquiries, newInquiries] = await Promise.all([
    supabase.from("products").select("id", { count: "exact", head: true }),
    supabase.from("universes").select("id", { count: "exact", head: true }),
    supabase.from("inquiries").select("id", { count: "exact", head: true }),
    supabase
      .from("inquiries")
      .select("id", { count: "exact", head: true })
      .eq("status", "new"),
  ]);

  return {
    productsCount: products.count ?? 0,
    universesCount: universes.count ?? 0,
    inquiriesCount: inquiries.count ?? 0,
    newInquiriesCount: newInquiries.count ?? 0,
  };
}

export async function getRecentProductsAdmin(limit = 5): Promise<Product[]> {
  if (!isSupabaseConfigured()) return catalog.getRecentProductsAdmin(limit);
  const supabase = await createClient();
  const { data, error } = await supabase
    .from("products")
    .select("*, universe:universes(*)")
    .order("created_at", { ascending: false })
    .limit(limit);

  if (error) throw error;
  return (data ?? []).map((row) => mapProduct(row as Record<string, unknown>));
}

export async function getRecentInquiriesAdmin(limit = 5): Promise<Inquiry[]> {
  const supabase = await createClient();
  const { data, error } = await supabase
    .from("inquiries")
    .select("*, product:products(id, name, slug)")
    .order("created_at", { ascending: false })
    .limit(limit);

  if (error) throw error;
  return (data ?? []) as Inquiry[];
}

export async function getAllColorsAndFinishes(): Promise<{
  colors: string[];
  finishes: string[];
}> {
  const products = await getPublishedProducts();
  const colors = new Set<string>();
  const finishes = new Set<string>();

  products.forEach((p) => {
    p.colors.forEach((c) => colors.add(c));
    p.finishes.forEach((f) => finishes.add(f));
  });

  return {
    colors: Array.from(colors).sort(),
    finishes: Array.from(finishes).sort(),
  };
}
