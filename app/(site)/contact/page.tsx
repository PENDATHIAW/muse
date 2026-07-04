import type { Metadata } from "next";
import { InquiryForm } from "@/components/forms/inquiry-form";
import { WhatsAppButton } from "@/components/ui/whatsapp-button";
import {
  getActiveUniverses,
  getPublishedProducts,
  getSettings,
} from "@/lib/queries";

export const metadata: Metadata = {
  title: "Contact & Commande",
  description: "Contactez MUSE pour commander ou personnaliser vos objets.",
};

export const dynamic = "force-dynamic";

export default async function ContactPage() {
  const [settings, universes, products] = await Promise.all([
    getSettings(),
    getActiveUniverses(),
    getPublishedProducts(),
  ]);

  const productOptions = products.map((p) => ({
    id: p.id,
    name: p.name,
  }));

  return (
    <div className="muse-section">
      <div className="mx-auto max-w-2xl text-center">
        <h1 className="muse-heading">Contact & Commande</h1>
        <p className="muse-subheading mt-4">
          Décrivez votre projet ou l&apos;objet souhaité. Nous vous répondrons
          rapidement par téléphone, email ou WhatsApp.
        </p>
      </div>

      <div className="mx-auto mt-10 max-w-xl">
        <div className="mb-6 flex justify-center">
          <WhatsAppButton
            phone={settings.whatsapp_number || "221771234567"}
            message={
              settings.whatsapp_default_message ||
              "Bonjour MUSE, je souhaite passer une commande."
            }
            label="Contacter via WhatsApp"
          />
        </div>

        <div className="rounded-2xl border border-border bg-card p-6 sm:p-8">
          <InquiryForm
            products={productOptions}
            universes={universes}
            defaultMessage=""
          />
        </div>

        {settings.contact_email && (
          <p className="mt-6 text-center text-sm text-muted-foreground">
            Ou écrivez-nous à{" "}
            <a
              href={`mailto:${settings.contact_email}`}
              className="text-primary hover:underline"
            >
              {settings.contact_email}
            </a>
          </p>
        )}
      </div>
    </div>
  );
}
