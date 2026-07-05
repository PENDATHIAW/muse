"use server";

import { revalidatePath } from "next/cache";
import { redirect } from "next/navigation";
import productsJson from "@/data/products.json";
import { buildProductFieldsFromUniverse } from "@/lib/universe-catalog";
import { createClient } from "@/lib/supabase/server";
import { slugify } from "@/lib/utils-muse";
import type { Product, Universe } from "@/types/database";

type RawProduct = Omit<Product, "created_at" | "updated_at" | "universe" | "images"> & {
  images?: Array<{
    image_url: string;
    alt_text: string;
    is_main: boolean;
    display_order: number;
  }>;
};

function revalidatePublicCatalog(slug?: string) {
  revalidatePath("/");
  revalidatePath("/catalogue");
  if (slug) {
    revalidatePath(`/produit/${slug}`);
  }
}

function parseList(value: FormDataEntryValue | null): string[] {
  return String(value ?? "")
    .split(",")
    .map((s) => s.trim())
    .filter(Boolean);
}

async function getUniverseById(
  supabase: Awaited<ReturnType<typeof createClient>>,
  universeId: string
): Promise<Universe | null> {
  const { data } = await supabase
    .from("universes")
    .select("*")
    .eq("id", universeId)
    .single();
  return data;
}

function buildProductPayload(
  formData: FormData,
  universe: Universe,
  options: { autoFill?: boolean } = {}
) {
  const name = String(formData.get("name") ?? "").trim();
  const auto = options.autoFill !== false;
  const defaults = auto
    ? buildProductFieldsFromUniverse(name, universe.slug, universe.name)
    : null;

  const shortDescription = String(formData.get("short_description") ?? "").trim();
  const longDescription = String(formData.get("long_description") ?? "").trim();
  const priceRaw = formData.get("price");
  const price =
    priceRaw != null && String(priceRaw).trim() !== ""
      ? Number(priceRaw)
      : (defaults?.price ?? 0);

  return {
    universe_id: universe.id,
    name,
    slug: String(formData.get("slug") ?? "").trim() || slugify(name),
    short_description: shortDescription || defaults?.short_description || "",
    long_description: longDescription || defaults?.long_description || "",
    price,
    old_price: formData.get("old_price")
      ? Number(formData.get("old_price"))
      : null,
    dimensions:
      String(formData.get("dimensions") ?? "").trim() ||
      defaults?.dimensions ||
      "",
    print_time:
      String(formData.get("print_time") ?? "").trim() ||
      defaults?.print_time ||
      "",
    material:
      String(formData.get("material") ?? "").trim() || defaults?.material || "",
    colors: parseList(formData.get("colors")).length
      ? parseList(formData.get("colors"))
      : defaults?.colors || [],
    finishes: parseList(formData.get("finishes")).length
      ? parseList(formData.get("finishes"))
      : defaults?.finishes || [],
    personalization_options: parseList(formData.get("personalization_options"))
      .length
      ? parseList(formData.get("personalization_options"))
      : defaults?.personalization_options || [],
    usage:
      String(formData.get("usage") ?? "").trim() || defaults?.usage || "",
    inspiration:
      String(formData.get("inspiration") ?? "").trim() ||
      defaults?.inspiration ||
      "",
    placement:
      String(formData.get("placement") ?? "").trim() ||
      defaults?.placement ||
      "",
    stock_status: String(formData.get("stock_status") ?? "available"),
    status: String(formData.get("status") ?? "published"),
    is_featured: formData.get("is_featured") === "on",
    display_order: Number(formData.get("display_order") ?? 0),
    tags: parseList(formData.get("tags")).length
      ? parseList(formData.get("tags"))
      : defaults?.tags || [],
    internal_note: String(formData.get("internal_note") ?? ""),
  };
}

export async function createInquiry(formData: FormData) {
  const supabase = await createClient();

  const payload = {
    customer_name: String(formData.get("customer_name") ?? "").trim(),
    customer_phone: String(formData.get("customer_phone") ?? "").trim(),
    customer_email: String(formData.get("customer_email") ?? "").trim() || null,
    product_id: String(formData.get("product_id") ?? "") || null,
    universe_id: String(formData.get("universe_id") ?? "") || null,
    message: String(formData.get("message") ?? "").trim(),
    status: "new" as const,
  };

  if (!payload.customer_name || !payload.customer_phone) {
    return { error: "Nom et téléphone sont requis." };
  }

  const { error } = await supabase.from("inquiries").insert(payload);

  if (error) {
    return { error: error.message };
  }

  revalidatePath("/admin/demandes");
  return { success: true };
}

export async function createUniverse(formData: FormData) {
  const supabase = await createClient();
  const name = String(formData.get("name") ?? "").trim();

  const payload = {
    name,
    slug: slugify(name),
    description: String(formData.get("description") ?? ""),
    cover_image_url: String(formData.get("cover_image_url") ?? "") || null,
    display_order: Number(formData.get("display_order") ?? 0),
    is_active: formData.get("is_active") === "on",
  };

  const { error } = await supabase.from("universes").insert(payload);
  if (error) throw new Error(error.message);

  revalidatePath("/admin/univers");
  revalidatePublicCatalog();
  redirect("/admin/univers");
}

export async function updateUniverse(id: string, formData: FormData) {
  const supabase = await createClient();
  const name = String(formData.get("name") ?? "").trim();

  const payload = {
    name,
    slug: String(formData.get("slug") ?? slugify(name)),
    description: String(formData.get("description") ?? ""),
    cover_image_url: String(formData.get("cover_image_url") ?? "") || null,
    display_order: Number(formData.get("display_order") ?? 0),
    is_active: formData.get("is_active") === "on",
  };

  const { error } = await supabase.from("universes").update(payload).eq("id", id);
  if (error) throw new Error(error.message);

  revalidatePath("/admin/univers");
  revalidatePublicCatalog();
  redirect("/admin/univers");
}

export async function deleteUniverse(id: string) {
  const supabase = await createClient();
  const { error } = await supabase.from("universes").delete().eq("id", id);
  if (error) return { error: error.message };

  revalidatePath("/admin/univers");
  revalidatePublicCatalog();
  return { success: true };
}

export async function createProduct(formData: FormData) {
  const supabase = await createClient();
  const universeId = String(formData.get("universe_id") ?? "");
  const universe = await getUniverseById(supabase, universeId);

  if (!universe) {
    throw new Error("Univers introuvable.");
  }

  const payload = buildProductPayload(formData, universe, { autoFill: true });
  const imageUrl = String(formData.get("image_url") ?? "").trim();

  const { data, error } = await supabase
    .from("products")
    .insert(payload)
    .select("id, slug")
    .single();

  if (error) throw new Error(error.message);

  if (imageUrl) {
    await supabase.from("product_images").insert({
      product_id: data.id,
      image_url: imageUrl,
      alt_text: payload.name,
      is_main: true,
      display_order: 0,
    });
  }

  revalidatePath("/admin/produits");
  revalidatePublicCatalog(payload.slug);
  redirect(`/admin/produits/${data.id}/edit`);
}

export async function updateProduct(id: string, formData: FormData) {
  const supabase = await createClient();
  const universeId = String(formData.get("universe_id") ?? "");
  const universe = await getUniverseById(supabase, universeId);

  if (!universe) {
    throw new Error("Univers introuvable.");
  }

  const payload = buildProductPayload(formData, universe, { autoFill: false });

  const { error } = await supabase.from("products").update(payload).eq("id", id);
  if (error) throw new Error(error.message);

  revalidatePath("/admin/produits");
  revalidatePublicCatalog(payload.slug);
  redirect("/admin/produits");
}

export async function deleteProduct(id: string) {
  const supabase = await createClient();
  const { error } = await supabase.from("products").delete().eq("id", id);
  if (error) return { error: error.message };

  revalidatePath("/admin/produits");
  revalidatePublicCatalog();
  return { success: true };
}

export async function syncCatalogJsonToSupabase() {
  const supabase = await createClient();
  const products = productsJson as RawProduct[];
  let synced = 0;

  const { data: universes } = await supabase.from("universes").select("id, slug, name");
  const universeBySlug = new Map(
    (universes ?? []).map((u) => [u.slug, u as Universe])
  );

  for (const product of products) {
    const universe =
      universeBySlug.get(product.universe_id) ??
      [...universeBySlug.values()].find((u) => u.id === product.universe_id);

    if (!universe) continue;

    const defaults = buildProductFieldsFromUniverse(
      product.name,
      universe.slug,
      universe.name
    );

    const payload = {
      universe_id: universe.id,
      name: product.name,
      slug: product.slug,
      short_description: product.short_description || defaults.short_description,
      long_description: product.long_description || defaults.long_description,
      price: product.price ?? defaults.price,
      old_price: product.old_price,
      dimensions: product.dimensions || defaults.dimensions,
      print_time: product.print_time || defaults.print_time,
      material: product.material || defaults.material,
      colors: product.colors?.length ? product.colors : defaults.colors,
      finishes: product.finishes?.length ? product.finishes : defaults.finishes,
      personalization_options: product.personalization_options?.length
        ? product.personalization_options
        : defaults.personalization_options,
      usage: product.usage || defaults.usage,
      inspiration: product.inspiration || defaults.inspiration,
      placement: product.placement || defaults.placement,
      stock_status: product.stock_status || "available",
      status: product.status || "published",
      is_featured: product.is_featured ?? false,
      display_order: product.display_order ?? 0,
      tags: product.tags?.length ? product.tags : defaults.tags,
      internal_note: product.internal_note || "",
    };

    const { data: saved, error } = await supabase
      .from("products")
      .upsert(payload, { onConflict: "slug" })
      .select("id")
      .single();

    if (error || !saved) continue;

    const imageUrl = product.images?.[0]?.image_url;
    if (imageUrl) {
      await supabase.from("product_images").delete().eq("product_id", saved.id);
      await supabase.from("product_images").insert({
        product_id: saved.id,
        image_url: imageUrl,
        alt_text: product.images?.[0]?.alt_text || product.name,
        is_main: true,
        display_order: 0,
      });
    }

    synced += 1;
  }

  revalidatePath("/admin/produits");
  revalidatePublicCatalog();
  return { synced, total: products.length };
}

export async function updateInquiryStatus(
  id: string,
  status: string,
  adminNote?: string
) {
  const supabase = await createClient();
  const { error } = await supabase
    .from("inquiries")
    .update({
      status,
      ...(adminNote !== undefined ? { admin_note: adminNote } : {}),
    })
    .eq("id", id);

  if (error) return { error: error.message };

  revalidatePath("/admin/demandes");
  return { success: true };
}

export async function updateSettings(formData: FormData) {
  const supabase = await createClient();
  const keys = [
    "hero_title",
    "hero_subtitle",
    "hero_tagline",
    "why_muse",
    "personalization_intro",
    "order_intro",
    "about_content",
    "whatsapp_number",
    "whatsapp_default_message",
    "contact_email",
    "instagram_url",
    "tiktok_url",
    "whatsapp_url",
  ];

  for (const key of keys) {
    const value = String(formData.get(key) ?? "");
    const { error } = await supabase
      .from("settings")
      .upsert({ key, value }, { onConflict: "key" });

    if (error) throw new Error(error.message);
  }

  revalidatePath("/");
  revalidatePath("/admin/reglages");
  revalidatePath("/a-propos");
  revalidatePath("/contact");
}

export async function addProductImage(formData: FormData) {
  const supabase = await createClient();
  const productId = String(formData.get("product_id") ?? "");
  const imageUrl = String(formData.get("image_url") ?? "");
  const altText = String(formData.get("alt_text") ?? "");
  const isMain = formData.get("is_main") === "on";

  const { data: product } = await supabase
    .from("products")
    .select("slug")
    .eq("id", productId)
    .single();

  if (isMain) {
    await supabase
      .from("product_images")
      .update({ is_main: false })
      .eq("product_id", productId);
  }

  const { error } = await supabase.from("product_images").insert({
    product_id: productId,
    image_url: imageUrl,
    alt_text: altText,
    is_main: isMain,
    display_order: Number(formData.get("display_order") ?? 0),
  });

  if (error) return { error: error.message };

  revalidatePath("/admin/images");
  revalidatePath(`/admin/produits/${productId}/edit`);
  if (product?.slug) revalidatePublicCatalog(product.slug);
  return { success: true };
}

export async function deleteProductImage(id: string, productId: string) {
  const supabase = await createClient();
  const { data: product } = await supabase
    .from("products")
    .select("slug")
    .eq("id", productId)
    .single();

  const { error } = await supabase.from("product_images").delete().eq("id", id);
  if (error) return { error: error.message };

  revalidatePath("/admin/images");
  revalidatePath(`/admin/produits/${productId}/edit`);
  if (product?.slug) revalidatePublicCatalog(product.slug);
  return { success: true };
}

export async function setMainProductImage(id: string, productId: string) {
  const supabase = await createClient();
  const { data: product } = await supabase
    .from("products")
    .select("slug")
    .eq("id", productId)
    .single();

  await supabase
    .from("product_images")
    .update({ is_main: false })
    .eq("product_id", productId);

  const { error } = await supabase
    .from("product_images")
    .update({ is_main: true })
    .eq("id", id);

  if (error) return { error: error.message };

  revalidatePath("/admin/images");
  revalidatePath(`/admin/produits/${productId}/edit`);
  if (product?.slug) revalidatePublicCatalog(product.slug);
  return { success: true };
}

export async function reorderProductImages(
  items: { id: string; display_order: number }[]
) {
  const supabase = await createClient();

  for (const item of items) {
    await supabase
      .from("product_images")
      .update({ display_order: item.display_order })
      .eq("id", item.id);
  }

  revalidatePath("/admin/images");
  return { success: true };
}
