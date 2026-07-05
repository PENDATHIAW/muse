import { submitInquiry } from "@/app/(site)/contact/actions";
import { Input } from "@/components/ui/input";
import { Textarea } from "@/components/ui/textarea";
import type { Product, Universe } from "@/types/database";

interface InquiryFormProps {
  products?: Pick<Product, "id" | "name">[];
  universes?: Universe[];
  defaultProductId?: string;
  defaultUniverseId?: string;
  defaultMessage?: string;
  returnTo?: string;
}

export function InquiryForm({
  products = [],
  universes = [],
  defaultProductId,
  defaultUniverseId,
  defaultMessage = "",
  returnTo = "/contact",
}: InquiryFormProps) {
  const selectClass =
    "mt-1 flex h-9 w-full rounded-md border border-input bg-transparent px-3 py-1 text-sm";

  return (
    <form action={submitInquiry} className="space-y-4">
      <input type="hidden" name="returnTo" value={returnTo} />

      <div className="grid gap-4 sm:grid-cols-2">
        <div>
          <label htmlFor="customer_name" className="text-sm font-medium">
            Nom *
          </label>
          <Input id="customer_name" name="customer_name" required />
        </div>
        <div>
          <label htmlFor="customer_phone" className="text-sm font-medium">
            Téléphone *
          </label>
          <Input id="customer_phone" name="customer_phone" type="tel" required />
        </div>
      </div>

      <div>
        <label htmlFor="customer_email" className="text-sm font-medium">
          Email
        </label>
        <Input id="customer_email" name="customer_email" type="email" />
      </div>

      {products.length > 0 && (
        <div>
          <label htmlFor="product_id" className="text-sm font-medium">
            Objet souhaité
          </label>
          <select
            id="product_id"
            name="product_id"
            defaultValue={defaultProductId ?? ""}
            className={selectClass}
          >
            <option value="">Choisir un produit (optionnel)</option>
            {products.map((p) => (
              <option key={p.id} value={p.id}>
                {p.name}
              </option>
            ))}
          </select>
        </div>
      )}

      {universes.length > 0 && (
        <div>
          <label htmlFor="universe_id" className="text-sm font-medium">
            Univers
          </label>
          <select
            id="universe_id"
            name="universe_id"
            defaultValue={defaultUniverseId ?? ""}
            className={selectClass}
          >
            <option value="">Choisir un univers (optionnel)</option>
            {universes.map((u) => (
              <option key={u.id} value={u.id}>
                {u.name}
              </option>
            ))}
          </select>
        </div>
      )}

      <div>
        <label htmlFor="message" className="text-sm font-medium">
          Message *
        </label>
        <Textarea
          id="message"
          name="message"
          rows={5}
          required
          defaultValue={defaultMessage}
          placeholder="Décrivez votre projet, vos couleurs, votre personnalisation..."
        />
      </div>

      <button
        type="submit"
        className="inline-flex h-9 w-full items-center justify-center rounded-lg bg-primary px-4 text-sm font-medium text-primary-foreground hover:bg-primary/90 sm:w-auto"
      >
        Envoyer ma demande
      </button>
    </form>
  );
}

export function InquiryFormSuccess() {
  return (
    <div className="rounded-2xl border border-emerald-200 bg-emerald-50 p-6 text-center">
      <p className="font-serif text-xl text-emerald-900">Message envoyé</p>
      <p className="mt-2 text-sm text-emerald-800">
        Nous vous répondrons très vite par email ou WhatsApp.
      </p>
    </div>
  );
}

export function InquiryFormError({ message }: { message?: string }) {
  return (
    <div className="rounded-2xl border border-red-200 bg-red-50 p-6 text-center">
      <p className="font-serif text-xl text-red-900">Envoi impossible</p>
      <p className="mt-2 text-sm text-red-800">
        {message ?? "Une erreur est survenue. Réessayez ou contactez-nous sur WhatsApp."}
      </p>
    </div>
  );
}
