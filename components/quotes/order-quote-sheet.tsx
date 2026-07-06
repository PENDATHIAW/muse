import Image from "next/image";
import Link from "next/link";
import { Badge } from "@/components/ui/badge";
import { Separator } from "@/components/ui/separator";
import {
  formatConceptionDays,
  formatPrice,
  ORDER_QUOTE_STATUS_LABELS,
} from "@/lib/utils-muse";
import type { OrderQuote } from "@/types/database";

interface OrderQuoteSheetProps {
  quote: OrderQuote;
  showActions?: boolean;
  validateAction?: () => Promise<void>;
  rejectAction?: () => Promise<void>;
}

export function OrderQuoteSheet({
  quote,
  showActions = false,
  validateAction,
  rejectAction,
}: OrderQuoteSheetProps) {
  const total = quote.unit_price * quote.quantity;
  const created = new Date(quote.created_at).toLocaleDateString("fr-FR", {
    day: "numeric",
    month: "long",
    year: "numeric",
  });

  return (
    <article className="overflow-hidden rounded-2xl border border-border bg-card shadow-sm">
      <header className="border-b border-border bg-muse-charcoal px-6 py-5 text-center text-white">
        <div className="mx-auto mb-3 flex justify-center">
          <div className="relative h-14 w-36 overflow-hidden rounded-lg">
            <Image
              src="/logo-muse.png"
              alt="MUSE"
              fill
              className="object-cover object-[center_12%]"
            />
          </div>
        </div>
        <p className="text-xs uppercase tracking-[0.25em] text-muse-beige/80">
          Fiche de commande
        </p>
        <h1 className="mt-2 font-serif text-2xl">Bonjour {quote.customer_name}</h1>
        <p className="mt-1 text-sm text-muse-beige/90">
          Réf. {quote.token.slice(0, 8).toUpperCase()} · {created}
        </p>
        <Badge variant="secondary" className="mt-3">
          {ORDER_QUOTE_STATUS_LABELS[quote.status] || quote.status}
        </Badge>
      </header>

      <div className="p-6 sm:p-8">
        {quote.product_image_url && (
          <div className="relative mx-auto mb-6 aspect-square max-w-sm overflow-hidden rounded-xl bg-muted">
            <Image
              src={quote.product_image_url}
              alt={quote.product_name}
              fill
              className="object-cover"
              sizes="(max-width: 640px) 100vw, 400px"
            />
          </div>
        )}

        <div className="text-center">
          {quote.universe_name && (
            <p className="text-xs uppercase tracking-wider text-muted-foreground">
              {quote.universe_name}
            </p>
          )}
          <h2 className="mt-1 font-serif text-2xl text-muse-charcoal">
            {quote.product_name}
          </h2>
        </div>

        <Separator className="my-6" />

        <dl className="grid gap-4 text-sm">
          <div className="flex items-start justify-between gap-4">
            <dt className="text-muted-foreground">Prix unitaire</dt>
            <dd className="font-medium">{formatPrice(quote.unit_price)}</dd>
          </div>
          <div className="flex items-start justify-between gap-4">
            <dt className="text-muted-foreground">Quantité</dt>
            <dd className="font-medium">{quote.quantity}</dd>
          </div>
          <div className="flex items-start justify-between gap-4 border-t border-border pt-4">
            <dt className="font-medium text-muse-charcoal">Total estimé</dt>
            <dd className="text-lg font-semibold text-muse-terracotta">
              {formatPrice(total)}
            </dd>
          </div>

          {quote.dimensions && (
            <div>
              <dt className="text-muted-foreground">Dimensions</dt>
              <dd className="mt-1">{quote.dimensions}</dd>
            </div>
          )}
          {quote.colors && (
            <div>
              <dt className="text-muted-foreground">Couleur(s)</dt>
              <dd className="mt-1">{quote.colors}</dd>
            </div>
          )}
          {quote.finishes && (
            <div>
              <dt className="text-muted-foreground">Finition(s)</dt>
              <dd className="mt-1">{quote.finishes}</dd>
            </div>
          )}
          {quote.personalization && (
            <div>
              <dt className="text-muted-foreground">Personnalisation</dt>
              <dd className="mt-1 whitespace-pre-line">{quote.personalization}</dd>
            </div>
          )}
          {quote.conception_days != null && quote.conception_days > 0 && (
            <div>
              <dt className="text-muted-foreground">Délai de conception</dt>
              <dd className="mt-1 font-medium">
                {formatConceptionDays(quote.conception_days)}
              </dd>
            </div>
          )}
          {quote.delivery_note && (
            <div>
              <dt className="text-muted-foreground">Livraison / retrait</dt>
              <dd className="mt-1 whitespace-pre-line">{quote.delivery_note}</dd>
            </div>
          )}
        </dl>

        {quote.admin_message && (
          <div className="mt-6 rounded-xl bg-muse-beige/40 p-4">
            <p className="text-xs uppercase tracking-wider text-muted-foreground">
              Message MUSE
            </p>
            <p className="mt-2 whitespace-pre-line text-sm text-muse-charcoal">
              {quote.admin_message}
            </p>
          </div>
        )}

        <p className="mt-6 text-xs leading-relaxed text-muted-foreground">
          Pas de paiement en ligne pour le moment. Cette fiche confirme votre accord
          sur le modèle, le prix et les options. MUSE vous recontactera pour la suite
          (acompte, production, livraison).
        </p>

        {showActions && quote.status !== "validated" && quote.status !== "rejected" && (
          <div className="mt-8 flex flex-col gap-3 sm:flex-row">
            {validateAction && (
              <form action={validateAction} className="flex-1">
                <button
                  type="submit"
                  className="inline-flex h-11 w-full items-center justify-center rounded-lg bg-primary px-6 text-sm font-medium text-primary-foreground hover:bg-primary/90"
                >
                  Je valide cette commande
                </button>
              </form>
            )}
            {rejectAction && (
              <form action={rejectAction} className="flex-1">
                <button
                  type="submit"
                  className="inline-flex h-11 w-full items-center justify-center rounded-lg border border-border px-6 text-sm font-medium hover:bg-muted"
                >
                  Je souhaite modifier
                </button>
              </form>
            )}
          </div>
        )}

        {quote.status === "validated" && (
          <div className="mt-8 rounded-xl border border-muse-sage/30 bg-muse-sage/10 p-4 text-center text-sm text-muse-charcoal">
            Merci — votre commande a été validée. L&apos;équipe MUSE vous recontacte très bientôt.
          </div>
        )}

        {quote.status === "rejected" && (
          <div className="mt-8 rounded-xl border border-border bg-muted p-4 text-center text-sm">
            Vous avez indiqué souhaiter des modifications. MUSE vous recontactera.
          </div>
        )}
      </div>
    </article>
  );
}
