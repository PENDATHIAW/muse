import { notFound } from "next/navigation";
import type { Metadata } from "next";
import { OrderQuoteSheet } from "@/components/quotes/order-quote-sheet";
import { validateOrderQuote, rejectOrderQuote } from "@/lib/actions/quotes";
import { getOrderQuoteByToken } from "@/lib/quotes";
import { getSettings } from "@/lib/queries";
import { buildWhatsAppUrl } from "@/lib/utils-muse";
import { WhatsAppButton } from "@/components/ui/whatsapp-button";

export const dynamic = "force-dynamic";

interface QuotePageProps {
  params: Promise<{ token: string }>;
}

export async function generateMetadata({ params }: QuotePageProps): Promise<Metadata> {
  const { token } = await params;
  const quote = await getOrderQuoteByToken(token);
  return {
    title: quote ? `Fiche commande — ${quote.product_name}` : "Fiche introuvable",
    robots: { index: false, follow: false },
  };
}

export default async function QuotePage({ params }: QuotePageProps) {
  const { token } = await params;
  const [quote, settings] = await Promise.all([
    getOrderQuoteByToken(token),
    getSettings(),
  ]);

  if (!quote) notFound();

  const questionMessage = `Bonjour MUSE, j'ai consulté ma fiche de commande (${quote.product_name}, réf. ${quote.token.slice(0, 8).toUpperCase()}) et j'ai une question.`;

  return (
    <div className="muse-section py-10">
      <div className="mx-auto max-w-2xl">
        <OrderQuoteSheet
          quote={quote}
          showActions
          validateAction={async () => {
            "use server";
            await validateOrderQuote(token);
          }}
          rejectAction={async () => {
            "use server";
            await rejectOrderQuote(token);
          }}
        />

        <div className="mt-6 text-center">
          <WhatsAppButton
            phone={settings.whatsapp_number || "221771234567"}
            message={questionMessage}
            variant="outline"
          />
        </div>
      </div>
    </div>
  );
}
