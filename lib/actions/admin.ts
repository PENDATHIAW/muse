"use server";

import { revalidatePath } from "next/cache";
import { redirect } from "next/navigation";
import productsJson from "@/data/products.json";
import universesJson from "@/data/universes.json";
import { analyzeProductPhoto } from "@/lib/photo-analysis";
import {
  buildProductsFromImages,
  persistNewCatalogProducts,
} from "@/lib/catalog-persist";
import { getUndiscoveredImages } from "@/lib/scan-public-products";
import type { CatalogProduct } from "@/lib/scan-public-products";
import { buildProductFieldsFromUniverse } from "@/lib/universe-catalog";
import { createClient } from "@/lib/supabase/server";
import { createServiceClient } from "@/lib/supabase/service";
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

async function ensureUniverseInSupabase(
  supabase: Awaited<ReturnType<typeof createClient>>,
  slug: string
): Promise<Universe | null> {
  const { data: existing } = await supabase
    .from("universes")
    .select("*")
    .eq("slug", slug)
    .maybeSingle();

  if (existing) return existing;

  const fromJson = (universesJson as Universe[]).find((u) => u.slug === slug);
  if (!fromJson) return null;

  const { data: inserted, error } = await supabase
    .from("universes")
    .upsert(
      {
        name: fromJson.name,
        slug: fromJson.slug,
        description: fromJson.description,
        cover_image_url: fromJson.cover_image_url,
        display_order: fromJson.display_order,
        is_active: fromJson.is_active,
      },
      { onConflict: "slug" }
    )
    .select("*")
    .single();

  if (error) return null;
  return inserted;
}

async function getAdminUniverses(
  supabase: Awaited<ReturnType<typeof createClient>>
): Promise<Universe[]> {
  const { data } = await supabase.from("universes").select("*");
  if (data?.length) return data;

  return (universesJson as Universe[]).map((u) => ({
    ...u,
    created_at: new Date().toISOString(),
    updated_at: new Date().toISOString(),
  }));
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
    conception_days: (() => {
      const raw = String(formData.get("conception_days") ?? "").trim();
      if (!raw) return null;
      const n = Number(raw);
      return Number.isFinite(n) && n > 0 ? Math.round(n) : null;
    })(),
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

export async function analyzePhotoPreview(filename: string) {
  const supabase = await createClient();
  const universes = await getAdminUniverses(supabase);
  const universeNames = Object.fromEntries(universes.map((u) => [u.slug, u.name]));
  return analyzeProductPhoto(filename, universeNames);
}

async function uploadProductImages(
  supabase: Awaited<ReturnType<typeof createClient>>,
  productId: string,
  productName: string,
  files: File[]
) {
  const service = createServiceClient();
  const storage = service?.storage ?? supabase.storage;

  if (!service) {
    console.warn(
      "SUPABASE_SERVICE_ROLE_KEY manquant — l'upload utilise la session admin (peut échouer si le bucket n'est pas configuré)."
    );
  }

  for (let i = 0; i < files.length; i++) {
    const file = files[i];
    const ext = file.name.split(".").pop()?.toLowerCase() ?? "jpg";
    const safeExt = ["jpg", "jpeg", "png", "webp", "gif"].includes(ext) ? ext : "jpg";
    const path = `${productId}/${Date.now()}-${i}.${safeExt}`;
    const buffer = await file.arrayBuffer();

    const { error: uploadError } = await storage
      .from("product-images")
      .upload(path, buffer, {
        contentType: file.type || `image/${safeExt === "jpg" ? "jpeg" : safeExt}`,
        upsert: true,
      });

    if (uploadError) {
      throw new Error(
        `Upload impossible : ${uploadError.message}. Vérifiez que le bucket « product-images » existe dans Supabase (Storage) et que SUPABASE_SERVICE_ROLE_KEY est configuré sur Vercel.`
      );
    }

    const { data: urlData } = storage.from("product-images").getPublicUrl(path);

    await supabase.from("product_images").insert({
      product_id: productId,
      image_url: urlData.publicUrl,
      alt_text: productName,
      is_main: i === 0,
      display_order: i,
    });
  }
}

export async function createProductWithPhotos(formData: FormData) {
  const supabase = await createClient();
  const price = Number(formData.get("price"));

  if (!price || price <= 0) {
    return { error: "Le prix est obligatoire." };
  }

  const files = formData
    .getAll("photos")
    .filter((entry): entry is File => entry instanceof File && entry.size > 0);

  if (files.length === 0) {
    return { error: "Ajoutez au moins une photo." };
  }

  const { data: allUniverses } = await supabase.from("universes").select("*");
  const catalogUniverses = await getAdminUniverses(supabase);
  const universeNames = Object.fromEntries(
    catalogUniverses.map((u) => [u.slug, u.name])
  );

  const analysis = analyzeProductPhoto(files[0].name, universeNames);
  const universeIdInput = String(formData.get("universe_id") ?? "").trim();

  let universe: Universe | null = null;
  if (universeIdInput) {
    universe = await getUniverseById(supabase, universeIdInput);
    if (!universe) {
      const fromCatalog = catalogUniverses.find((u) => u.id === universeIdInput);
      if (fromCatalog) {
        universe = await ensureUniverseInSupabase(supabase, fromCatalog.slug);
      }
    }
  } else if (analysis.universeSlug) {
    universe =
      (allUniverses ?? []).find((u) => u.slug === analysis.universeSlug) ??
      (await ensureUniverseInSupabase(supabase, analysis.universeSlug));
  }

  if (!universe) {
    return {
      error:
        "Univers introuvable. Choisissez l'univers manuellement ou utilisez une photo déjà classée.",
    };
  }

  const syntheticForm = new FormData();
  const nameInput = String(formData.get("name") ?? "").trim();
  syntheticForm.set("name", nameInput || analysis.suggestedName);
  syntheticForm.set("price", String(price));
  syntheticForm.set("universe_id", universe.id);
  syntheticForm.set("status", "published");
  syntheticForm.set("stock_status", "available");
  if (formData.get("is_featured") === "on") {
    syntheticForm.set("is_featured", "on");
  }

  const payload = buildProductPayload(syntheticForm, universe, { autoFill: true });
  payload.price = price;

  const { data: product, error } = await supabase
    .from("products")
    .insert(payload)
    .select("id, slug")
    .single();

  if (error || !product) {
    return { error: error?.message ?? "Création impossible." };
  }

  try {
    await uploadProductImages(supabase, product.id, payload.name, files);
  } catch (uploadError) {
    await supabase.from("products").delete().eq("id", product.id);
    return {
      error:
        uploadError instanceof Error ? uploadError.message : "Erreur upload photo.",
    };
  }

  revalidatePath("/admin/produits");
  revalidatePublicCatalog(payload.slug);
  redirect(`/admin/produits/${product.id}/edit`);
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
      conception_days: product.conception_days ?? null,
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

export async function getNewProductImages() {
  try {
    const images = getUndiscoveredImages();
    return { images, count: images.length };
  } catch (error) {
    return {
      images: [],
      count: 0,
      error: error instanceof Error ? error.message : "Scan impossible",
    };
  }
}

async function syncProductsToSupabase(products: CatalogProduct[]) {
  const service = createServiceClient();
  const supabase = service ?? (await createClient());
  let synced = 0;
  const errors: string[] = [];

  const { data: universes } = await supabase.from("universes").select("id, slug, name");
  const universeBySlug = new Map(
    (universes ?? []).map((u) => [u.slug, u as Universe])
  );

  for (const product of products) {
    let universe =
      universeBySlug.get(product.universe_id) ??
      (await ensureUniverseInSupabase(supabase, product.universe_id));

    if (!universe) {
      errors.push(`Univers introuvable : ${product.universe_id}`);
      continue;
    }

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
      conception_days: null,
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

    if (error || !saved) {
      errors.push(`${product.name} : ${error?.message ?? "échec insertion"}`);
      continue;
    }

    const imageUrl = product.images?.[0]?.image_url;
    if (imageUrl) {
      await supabase.from("product_images").delete().eq("product_id", saved.id);
      const { error: imgError } = await supabase.from("product_images").insert({
        product_id: saved.id,
        image_url: imageUrl,
        alt_text: product.images?.[0]?.alt_text || product.name,
        is_main: true,
        display_order: 0,
      });
      if (imgError) errors.push(`${product.name} (image) : ${imgError.message}`);
    }

    synced += 1;
  }

  return { synced, errors };
}

export async function addNewImagesToCatalog(imagePaths?: string[]) {
  try {
    const allNew = getUndiscoveredImages();
    if (allNew.length === 0) {
      return { error: "Aucune nouvelle image à ajouter." };
    }

    const MAX_BATCH = 25;
    const selected = imagePaths?.length
      ? allNew.filter((img) => imagePaths.includes(img.imagePath))
      : allNew.slice(0, MAX_BATCH);

    if (selected.length === 0) {
      return { error: "Images sélectionnées introuvables ou déjà cataloguées." };
    }

    const remaining = imagePaths?.length ? 0 : Math.max(0, allNew.length - MAX_BATCH);

    const startOrder = (productsJson as RawProduct[]).length;
    const { products, photoMapUpdates } = buildProductsFromImages(
      selected,
      startOrder
    );

    const result = await persistNewCatalogProducts(products, photoMapUpdates);

    let supabaseSynced = 0;
    let syncErrors: string[] = [];
    try {
      if (result.method === "supabase-only" || result.method === "github") {
        const syncResult = await syncProductsToSupabase(products);
        supabaseSynced = syncResult.synced;
        syncErrors = syncResult.errors;
      }
    } catch (syncError) {
      if (result.method === "supabase-only") {
        return {
          error:
            syncError instanceof Error
              ? `Enregistrement impossible : ${syncError.message}`
              : "Impossible d'enregistrer le catalogue via Supabase.",
        };
      }
    }

    if (result.method === "supabase-only" && supabaseSynced === 0) {
      const detail = syncErrors[0] ?? "vérifiez SUPABASE_SERVICE_ROLE_KEY sur Vercel";
      return {
        error: `Aucun produit enregistré (${detail}).`,
      };
    }

    revalidatePath("/admin/produits");
    revalidatePublicCatalog();

    const message =
      result.method === "github" && result.committed
        ? `${result.added} produit(s) ajouté(s). Le catalogue Git se met à jour en 1–2 minutes.`
        : result.method === "supabase-only"
          ? `${supabaseSynced} produit(s) ajouté(s) au catalogue — visibles immédiatement sur le site.${
              remaining > 0
                ? ` Il en reste ${remaining} : recliquez sur « Tout ajouter ».`
                : ""
            }`
          : result.added > 0
            ? `${result.added} produit(s) ajouté(s) localement.`
            : "Aucun produit ajouté.";

    return {
      success: true,
      added: result.method === "supabase-only" ? supabaseSynced : result.added,
      committed: result.committed,
      supabaseSynced,
      message,
    };
  } catch (error) {
    return {
      error: error instanceof Error ? error.message : "Ajout au catalogue impossible",
    };
  }
}
