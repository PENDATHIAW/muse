"use client";

import { markOrderQuoteSent } from "@/lib/actions/quotes";

interface SendQuoteButtonsProps {
  quoteId: string;
  whatsappUrl: string;
  mailto: string;
  hasEmail: boolean;
}

export function SendQuoteButtons({
  quoteId,
  whatsappUrl,
  mailto,
  hasEmail,
}: SendQuoteButtonsProps) {
  async function handleWhatsApp() {
    await markOrderQuoteSent(quoteId, "whatsapp");
    window.open(whatsappUrl, "_blank", "noopener,noreferrer");
  }

  async function handleEmail() {
    await markOrderQuoteSent(quoteId, "email");
    window.location.href = mailto;
  }

  return (
    <div className="mt-4 flex flex-col gap-3">
      <button
        type="button"
        onClick={handleWhatsApp}
        className="inline-flex h-10 w-full items-center justify-center rounded-md bg-[#25D366] px-4 text-sm font-medium text-white hover:bg-[#20bd5a]"
      >
        Envoyer via WhatsApp
      </button>
      <button
        type="button"
        onClick={handleEmail}
        className="inline-flex h-10 w-full items-center justify-center rounded-md bg-primary px-4 text-sm text-primary-foreground hover:bg-primary/90"
      >
        Envoyer par e-mail
      </button>
      {!hasEmail && (
        <p className="text-xs text-muted-foreground">
          Aucun e-mail client enregistré — renseignez l&apos;adresse dans votre application mail.
        </p>
      )}
    </div>
  );
}
