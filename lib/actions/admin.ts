"use server";

export async function createInquiry(formData: FormData) {
  const customer_name = String(formData.get("customer_name") ?? "").trim();
  const customer_phone = String(formData.get("customer_phone") ?? "").trim();
  const message = String(formData.get("message") ?? "").trim();

  if (!customer_name || !customer_phone || !message) {
    return { error: "Nom, téléphone et message sont requis." };
  }

  // Pas de base de données — la demande est traitée via WhatsApp / contact direct
  return { success: true };
}
