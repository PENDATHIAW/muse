import { createClient } from "@/lib/supabase/server";
import { getMainImage } from "@/lib/utils-muse";
import type { OrderQuote } from "@/types/database";

export function getQuotePublicUrl(token: string) {
  const base =
    process.env.NEXT_PUBLIC_SITE_URL?.replace(/\/$/, "") ||
    "https://muse-pendathiaws-projects.vercel.app";
  return `${base}/devis/${token}`;
}

export async function getOrderQuoteByIdAdmin(id: string): Promise<OrderQuote | null> {
  const supabase = await createClient();
  const { data, error } = await supabase
    .from("order_quotes")
    .select("*")
    .eq("id", id)
    .single();

  if (error || !data) return null;
  return mapQuote(data);
}

export async function getOrderQuoteByToken(token: string): Promise<OrderQuote | null> {
  const supabase = await createClient();
  const { data, error } = await supabase
    .from("order_quotes")
    .select("*")
    .eq("token", token)
    .single();

  if (error || !data) return null;
  return mapQuote(data);
}

function mapQuote(data: Record<string, unknown>): OrderQuote {
  return {
    ...(data as unknown as OrderQuote),
    unit_price: Number(data.unit_price),
    quantity: Number(data.quantity),
    conception_days:
      data.conception_days != null ? Number(data.conception_days) : null,
  };
}

export async function buildQuotePrefillFromInquiry(inquiryId: string) {
  const supabase = await createClient();

  const { data: inquiry } = await supabase
    .from("inquiries")
    .select(
      "*, product:products(*, images:product_images(*), universe:universes(name)), universe:universes(name)"
    )
    .eq("id", inquiryId)
    .single();

  if (!inquiry) return null;

  const product = inquiry.product as Record<string, unknown> | null;
  const imageUrl = product
    ? getMainImage(
        (product.images as { image_url: string; is_main: boolean; display_order: number }[]) ??
          []
      )
    : null;

  const universeName =
    (product?.universe as { name?: string } | undefined)?.name ??
    (inquiry.universe as { name?: string } | null)?.name ??
    "";

  return {
    inquiry_id: inquiry.id,
    customer_name: inquiry.customer_name,
    customer_phone: inquiry.customer_phone,
    customer_email: inquiry.customer_email,
    product_id: inquiry.product_id,
    product_name: (product?.name as string) ?? "",
    product_image_url: imageUrl ?? "",
    universe_name: universeName,
    unit_price: product ? Number(product.price) : 0,
    dimensions: (product?.dimensions as string) ?? "",
    colors: Array.isArray(product?.colors)
      ? (product.colors as string[]).join(", ")
      : "",
    finishes: Array.isArray(product?.finishes)
      ? (product.finishes as string[]).join(", ")
      : "",
    personalization: Array.isArray(product?.personalization_options)
      ? (product.personalization_options as string[]).join(", ")
      : "",
    conception_days:
      product?.conception_days != null ? Number(product.conception_days) : null,
    admin_message: inquiry.message ?? "",
  };
}
