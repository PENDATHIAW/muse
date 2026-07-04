import Link from "next/link";
import { MessageCircle, FileText } from "lucide-react";
import { Button } from "@/components/ui/button";
import { WhatsAppButton } from "@/components/ui/whatsapp-button";

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
  return (
    <section className="muse-section pb-20">
      <div className="rounded-3xl border border-border bg-card p-8 text-center sm:p-12">
        <h2 className="muse-heading">Commander facilement</h2>
        <p className="muse-subheading mx-auto mt-4 max-w-2xl">{intro}</p>
        <div className="mt-8 flex flex-col items-center justify-center gap-4 sm:flex-row">
          <Button asChild size="lg">
            <Link href="/contact">
              <FileText className="mr-2 h-4 w-4" />
              Formulaire de commande
            </Link>
          </Button>
          <WhatsAppButton
            phone={whatsappPhone}
            message={whatsappMessage}
            label="Écrire sur WhatsApp"
            variant="outline"
          />
        </div>
        <p className="mt-6 text-xs text-muted-foreground">
          Pas de paiement en ligne — nous échangeons avec vous pour finaliser votre commande.
        </p>
      </div>
    </section>
  );
}
