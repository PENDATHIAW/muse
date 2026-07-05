export function slugify(text: string): string {
  return text
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "")
    .toLowerCase()
    .trim()
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/^-+|-+$/g, "");
}

export function formatPrice(price: number): string {
  return new Intl.NumberFormat("fr-FR", {
    style: "currency",
    currency: "XOF",
    maximumFractionDigits: 0,
  }).format(price);
}

export function parseJsonArray(value: unknown): string[] {
  if (Array.isArray(value)) {
    return value.filter((item): item is string => typeof item === "string");
  }
  return [];
}

export function getMainImage(
  images?: { image_url: string; is_main: boolean; display_order: number }[]
): string | null {
  if (!images?.length) return null;
  const main = images.find((img) => img.is_main);
  const sorted = [...images].sort((a, b) => a.display_order - b.display_order);
  return main?.image_url ?? sorted[0]?.image_url ?? null;
}

/** True when the image path points to a flat file under /products/ (not a missing demo folder). */
export function hasValidProductImage(url: string | null | undefined): boolean {
  if (!url) return false;
  return /\/products\/[^/]+\.(png|jpe?g|webp|gif)$/i.test(url);
}

export function buildWhatsAppUrl(
  phone: string,
  message: string
): string {
  const cleaned = phone.replace(/\D/g, "");
  return `https://wa.me/${cleaned}?text=${encodeURIComponent(message)}`;
}

export const INQUIRY_STATUS_LABELS: Record<string, string> = {
  new: "Nouveau",
  discussing: "En discussion",
  confirmed: "Confirmé",
  delivered: "Livré",
  cancelled: "Annulé",
};

export const PRODUCT_STATUS_LABELS: Record<string, string> = {
  draft: "Brouillon",
  published: "Publié",
};

export const STOCK_STATUS_LABELS: Record<string, string> = {
  available: "Disponible",
  limited: "Stock limité",
  out_of_stock: "Rupture",
  made_to_order: "Sur commande",
};
