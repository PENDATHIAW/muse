"use server";

import { revalidatePath } from "next/cache";
import { redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import { slugify } from "@/lib/utils-muse";

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
  revalidatePath("/");
  revalidatePath("/catalogue");
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
  revalidatePath("/");
  revalidatePath("/catalogue");
  redirect("/admin/univers");
}

export async function deleteUniverse(id: string) {
  const supabase = await createClient();
  const { error } = await supabase.from("universes").delete().eq("id", id);
  if (error) return { error: error.message };

  revalidatePath("/admin/univers");
  revalidatePath("/");
  return { success: true };
}

function parseList(value: FormDataEntryValue | null): string[] {
  return String(value ?? "")
    .split(",")
    .map((s) => s.trim())
    .filter(Boolean);
}

export async function createProduct(formData: FormData) {
  const supabase = await createClient();
  const name = String(formData.get("name") ?? "").trim();

  const payload = {
    universe_id: String(formData.get("universe_id") ?? ""),
    name,
    slug: slugify(name),
    short_description: String(formData.get("short_description") ?? ""),
    long_description: String(formData.get("long_description") ?? ""),
    price: Number(formData.get("price") ?? 0),
    old_price: formData.get("old_price")
      ? Number(formData.get("old_price"))
      : null,
    dimensions: String(formData.get("dimensions") ?? ""),
    print_time: String(formData.get("print_time") ?? ""),
    material: String(formData.get("material") ?? ""),
    colors: parseList(formData.get("colors")),
    finishes: parseList(formData.get("finishes")),
    personalization_options: parseList(formData.get("personalization_options")),
    stock_status: String(formData.get("stock_status") ?? "available"),
    status: String(formData.get("status") ?? "draft"),
    is_featured: formData.get("is_featured") === "on",
    display_order: Number(formData.get("display_order") ?? 0),
    tags: parseList(formData.get("tags")),
    internal_note: String(formData.get("internal_note") ?? ""),
  };

  const { data, error } = await supabase
    .from("products")
    .insert(payload)
    .select("id")
    .single();

  if (error) throw new Error(error.message);

  revalidatePath("/admin/produits");
  redirect(`/admin/produits/${data.id}/edit`);
}

export async function updateProduct(id: string, formData: FormData) {
  const supabase = await createClient();
  const name = String(formData.get("name") ?? "").trim();

  const payload = {
    universe_id: String(formData.get("universe_id") ?? ""),
    name,
    slug: String(formData.get("slug") ?? slugify(name)),
    short_description: String(formData.get("short_description") ?? ""),
    long_description: String(formData.get("long_description") ?? ""),
    price: Number(formData.get("price") ?? 0),
    old_price: formData.get("old_price")
      ? Number(formData.get("old_price"))
      : null,
    dimensions: String(formData.get("dimensions") ?? ""),
    print_time: String(formData.get("print_time") ?? ""),
    material: String(formData.get("material") ?? ""),
    colors: parseList(formData.get("colors")),
    finishes: parseList(formData.get("finishes")),
    personalization_options: parseList(formData.get("personalization_options")),
    stock_status: String(formData.get("stock_status") ?? "available"),
    status: String(formData.get("status") ?? "draft"),
    is_featured: formData.get("is_featured") === "on",
    display_order: Number(formData.get("display_order") ?? 0),
    tags: parseList(formData.get("tags")),
    internal_note: String(formData.get("internal_note") ?? ""),
  };

  const { error } = await supabase.from("products").update(payload).eq("id", id);
  if (error) throw new Error(error.message);

  revalidatePath("/admin/produits");
  revalidatePath("/catalogue");
  revalidatePath(`/produit/${payload.slug}`);
  redirect("/admin/produits");
}

export async function deleteProduct(id: string) {
  const supabase = await createClient();
  const { error } = await supabase.from("products").delete().eq("id", id);
  if (error) return { error: error.message };

  revalidatePath("/admin/produits");
  revalidatePath("/catalogue");
  return { success: true };
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
  return { success: true };
}

export async function deleteProductImage(id: string, productId: string) {
  const supabase = await createClient();
  const { error } = await supabase.from("product_images").delete().eq("id", id);
  if (error) return { error: error.message };

  revalidatePath("/admin/images");
  revalidatePath(`/admin/produits/${productId}/edit`);
  return { success: true };
}

export async function setMainProductImage(id: string, productId: string) {
  const supabase = await createClient();

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
