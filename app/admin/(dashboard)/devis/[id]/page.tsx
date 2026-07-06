import Link from "next/link";
import { notFound } from "next/navigation";
import { CopyLinkButton } from "@/components/admin/copy-link-button";
import { SendQuoteButtons } from "@/components/admin/send-quote-buttons";
import { OrderQuoteSheet } from "@/components/quotes/order-quote-sheet";
import { getSettings } from "@/lib/queries";
import {
  getOrderQuoteByIdAdmin,
  getQuotePublicUrl,
} from "@/lib/quotes";
import {
  buildQuoteEmailBody,
  buildQuoteEmailSubject,
  buildQuoteWhatsAppMessage,
  buildWhatsAppUrl,
  ORDER_QUOTE_STATUS_LABELS,
} from "@/lib/utils-muse";

export const dynamic = "force-dynamic";

interface AdminQuotePageProps {
  params: Promise<{ id: string }>;
}

export default async function AdminQuotePage({ params }: AdminQuotePageProps) {
  const { id } = await params;
  const [quote, settings] = await Promise.all([
    getOrderQuoteByIdAdmin(id),
    getSettings(),
  ]);

  if (!quote) notFound();

  const quoteUrl = getQuotePublicUrl(quote.token);
  const whatsappMessage = buildQuoteWhatsAppMessage(
    quote.customer_name,
    quoteUrl,
    quote.product_name
  );
  const whatsappUrl = buildWhatsAppUrl(
    quote.customer_phone || settings.whatsapp_number || "221771234567",
    whatsappMessage
  );
  const emailSubject = encodeURIComponent(buildQuoteEmailSubject(quote.product_name));
  const emailBody = encodeURIComponent(
    buildQuoteEmailBody(quote.customer_name, quoteUrl, quote.product_name)
  );
  const mailto = quote.customer_email
    ? `mailto:${quote.customer_email}?subject=${emailSubject}&body=${emailBody}`
    : `mailto:?subject=${emailSubject}&body=${emailBody}`;

  return (
    <div>
      <Link
        href="/admin/demandes"
        className="text-sm text-muted-foreground hover:text-primary"
      >
        ← Retour aux demandes
      </Link>
      <h1 className="mt-4 text-2xl font-semibold">Fiche de commande</h1>
      <p className="text-sm text-muted-foreground">
        {quote.customer_name} · {ORDER_QUOTE_STATUS_LABELS[quote.status]}
      </p>

      <div className="mt-6 grid gap-8 lg:grid-cols-2">
        <div className="space-y-4">
          <div className="rounded-lg border border-border bg-card p-4">
            <p className="text-sm font-medium">Lien client</p>
            <p className="mt-2 break-all text-sm text-muted-foreground">{quoteUrl}</p>
            <div className="mt-3">
              <CopyLinkButton url={quoteUrl} />
            </div>
          </div>

          <div className="rounded-lg border border-border bg-card p-4">
            <p className="text-sm font-medium">Envoyer au client</p>
            <SendQuoteButtons
              quoteId={id}
              whatsappUrl={whatsappUrl}
              mailto={mailto}
              hasEmail={Boolean(quote.customer_email)}
            />
          </div>
        </div>

        <OrderQuoteSheet quote={quote} />
      </div>
    </div>
  );
}
