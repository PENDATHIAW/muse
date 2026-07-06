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

/** True when the image URL can be rendered in product cards. */
export function hasValidProductImage(url: string | null | undefined): boolean {
  if (!url) return false;
  if (/^https?:\/\//i.test(url)) return true;
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

export const ORDER_QUOTE_STATUS_LABELS: Record<string, string> = {
  draft: "Brouillon",
  sent: "Envoyée",
  validated: "Validée par le client",
  rejected: "Refusée",
  cancelled: "Annulée",
};

export function formatConceptionDays(days: number | null | undefined): string | null {
  if (days == null || days <= 0) return null;
  return days === 1 ? "1 jour ouvré" : `${days} jours ouvrés`;
}

export function buildQuoteWhatsAppMessage(
  customerName: string,
  quoteUrl: string,
  productName: string
): string {
  return `Bonjour ${customerName}, voici votre fiche de commande MUSE pour « ${productName} ». Merci de la consulter et de valider : ${quoteUrl}`;
}

export function buildQuoteEmailSubject(productName: string): string {
  return `MUSE — Votre fiche de commande : ${productName}`;
}

export function buildQuoteEmailBody(
  customerName: string,
  quoteUrl: string,
  productName: string
): string {
  return `Bonjour ${customerName},\n\nVoici votre fiche de commande MUSE pour « ${productName} ».\n\nConsultez-la et validez-la ici :\n${quoteUrl}\n\nMerci de votre confiance,\nL'équipe MUSE`;
}
