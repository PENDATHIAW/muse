import type { Metadata } from "next";
import Link from "next/link";
import { MessageCircle } from "lucide-react";
import {
  InquiryForm,
  InquiryFormError,
  InquiryFormSuccess,
} from "@/components/forms/inquiry-form";
import { buildWhatsAppUrl } from "@/lib/utils-muse";
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

export default async function ContactPage({
  searchParams,
}: {
  searchParams: Promise<{ sent?: string; error?: string }>;
}) {
  const [settings, universes, products, params] = await Promise.all([
    getSettings(),
    getActiveUniverses(),
    getPublishedProducts(),
    searchParams,
  ]);

  const productOptions = products.map((p) => ({
    id: p.id,
    name: p.name,
  }));

  const whatsappUrl = buildWhatsAppUrl(
    settings.whatsapp_number || "221771234567",
    settings.whatsapp_default_message ||
      "Bonjour MUSE, je souhaite passer une commande."
  );

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
          <Link
            href={whatsappUrl}
            target="_blank"
            rel="noopener noreferrer"
            className="inline-flex items-center justify-center rounded-lg border border-border bg-background px-4 py-2 text-sm font-medium hover:bg-muted"
          >
            <MessageCircle className="mr-2 h-4 w-4" />
            Contacter via WhatsApp
          </Link>
        </div>

        <div className="rounded-2xl border border-border bg-card p-6 sm:p-8">
          {params.sent === "1" ? (
            <InquiryFormSuccess />
          ) : params.error ? (
            <>
              <InquiryFormError message={params.error} />
              <div className="mt-6">
                <InquiryForm
                  products={productOptions}
                  universes={universes}
                  defaultMessage=""
                  returnTo="/contact"
                />
              </div>
            </>
          ) : (
            <InquiryForm
              products={productOptions}
              universes={universes}
              defaultMessage=""
              returnTo="/contact"
            />
          )}
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
