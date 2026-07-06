"use server";

import { revalidatePath } from "next/cache";
import { redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";

function parseQuoteForm(formData: FormData) {
  return {
    inquiry_id: String(formData.get("inquiry_id") ?? "") || null,
    customer_name: String(formData.get("customer_name") ?? "").trim(),
    customer_phone: String(formData.get("customer_phone") ?? "").trim(),
    customer_email: String(formData.get("customer_email") ?? "").trim() || null,
    product_id: String(formData.get("product_id") ?? "") || null,
    product_name: String(formData.get("product_name") ?? "").trim(),
    product_image_url: String(formData.get("product_image_url") ?? "").trim(),
    universe_name: String(formData.get("universe_name") ?? "").trim(),
    unit_price: Number(formData.get("unit_price") ?? 0),
    quantity: Math.max(1, Number(formData.get("quantity") ?? 1)),
    dimensions: String(formData.get("dimensions") ?? "").trim(),
    colors: String(formData.get("colors") ?? "").trim(),
    finishes: String(formData.get("finishes") ?? "").trim(),
    personalization: String(formData.get("personalization") ?? "").trim(),
    conception_days: (() => {
      const raw = String(formData.get("conception_days") ?? "").trim();
      if (!raw) return null;
      const n = Number(raw);
      return Number.isFinite(n) && n > 0 ? Math.round(n) : null;
    })(),
    delivery_note: String(formData.get("delivery_note") ?? "").trim(),
    admin_message: String(formData.get("admin_message") ?? "").trim(),
  };
}

export async function createOrderQuote(formData: FormData) {
  const supabase = await createClient();
  const data = parseQuoteForm(formData);

  if (!data.customer_name || !data.customer_phone || !data.product_name) {
    throw new Error("Nom client, téléphone et produit sont requis.");
  }

  if (!data.unit_price || data.unit_price <= 0) {
    throw new Error("Le prix est requis.");
  }

  const { data: quote, error } = await supabase
    .from("order_quotes")
    .insert({
      ...data,
      status: "draft",
    })
    .select("id, token")
    .single();

  if (error || !quote) {
    throw new Error(error?.message ?? "Impossible de créer la fiche.");
  }

  revalidatePath("/admin/demandes");
  redirect(`/admin/devis/${quote.id}`);
}

export async function updateOrderQuote(id: string, formData: FormData) {
  const supabase = await createClient();
  const data = parseQuoteForm(formData);

  const { error } = await supabase
    .from("order_quotes")
    .update(data)
    .eq("id", id);

  if (error) return { error: error.message };

  revalidatePath(`/admin/devis/${id}`);
  revalidatePath("/admin/demandes");
  return { success: true };
}

export async function markOrderQuoteSent(
  id: string,
  channel: "whatsapp" | "email"
) {
  const supabase = await createClient();
  const { error } = await supabase
    .from("order_quotes")
    .update({ status: "sent", send_channel: channel })
    .eq("id", id);

  if (error) return { error: error.message };

  revalidatePath(`/admin/devis/${id}`);
  revalidatePath("/admin/demandes");
  return { success: true };
}

export async function validateOrderQuote(token: string) {
  const supabase = await createClient();

  const { data: quote, error: fetchError } = await supabase
    .from("order_quotes")
    .select("id, inquiry_id, status")
    .eq("token", token)
    .single();

  if (fetchError || !quote) {
    return { error: "Fiche introuvable." };
  }

  if (quote.status === "validated") {
    return { success: true, already: true };
  }

  if (quote.status !== "sent" && quote.status !== "draft") {
    return { error: "Cette fiche n'est plus modifiable." };
  }

  const { error } = await supabase
    .from("order_quotes")
    .update({
      status: "validated",
      client_validated_at: new Date().toISOString(),
    })
    .eq("token", token);

  if (error) return { error: error.message };

  if (quote.inquiry_id) {
    await supabase
      .from("inquiries")
      .update({ status: "confirmed" })
      .eq("id", quote.inquiry_id);
  }

  revalidatePath(`/devis/${token}`);
  revalidatePath("/admin/demandes");
  return { success: true };
}

export async function rejectOrderQuote(token: string) {
  const supabase = await createClient();

  const { error } = await supabase
    .from("order_quotes")
    .update({ status: "rejected" })
    .eq("token", token);

  if (error) return { error: error.message };

  revalidatePath(`/devis/${token}`);
  return { success: true };
}
