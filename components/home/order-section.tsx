import Link from "next/link";
import { FileText, MessageCircle } from "lucide-react";
import { buildWhatsAppUrl } from "@/lib/utils-muse";

interface OrderSectionProps {
  intro: string;
  whatsappPhone: string;
  whatsappMessage: string;
}

export function OrderSection({
  intro,
  whatsappPhone,
  whatsappMessage,
}: OrderSectionProps) {
  const whatsappUrl = buildWhatsAppUrl(whatsappPhone, whatsappMessage);

  return (
    <section className="muse-section pb-20">
      <div className="rounded-3xl border border-border bg-card p-8 text-center sm:p-12">
        <h2 className="muse-heading">Commander facilement</h2>
        <p className="muse-subheading mx-auto mt-4 max-w-2xl">{intro}</p>
        <div className="mt-8 flex flex-col items-center justify-center gap-4 sm:flex-row">
          <Link
            href="/contact"
            className="inline-flex items-center justify-center rounded-lg bg-primary px-6 py-3 text-base font-medium text-primary-foreground hover:bg-primary/90"
          >
            <FileText className="mr-2 h-4 w-4" />
            Formulaire de commande
          </Link>
          <Link
            href={whatsappUrl}
            target="_blank"
            rel="noopener noreferrer"
            className="inline-flex items-center justify-center rounded-lg border border-border bg-background px-6 py-3 text-base font-medium hover:bg-muted"
          >
            <MessageCircle className="mr-2 h-4 w-4" />
            Écrire sur WhatsApp
          </Link>
        </div>
        <p className="mt-6 text-xs text-muted-foreground">
          Pas de paiement en ligne — nous échangeons avec vous pour finaliser votre commande.
        </p>
      </div>
    </section>
  );
}
