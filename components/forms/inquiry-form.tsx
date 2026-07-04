"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { toast } from "sonner";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Textarea } from "@/components/ui/textarea";
import { createInquiry } from "@/lib/actions/admin";
import type { Product, Universe } from "@/types/database";

interface InquiryFormProps {
  products?: Pick<Product, "id" | "name">[];
  universes?: Universe[];
  defaultProductId?: string;
  defaultUniverseId?: string;
  defaultMessage?: string;
}

export function InquiryForm({
  products = [],
  universes = [],
  defaultProductId,
  defaultUniverseId,
  defaultMessage = "",
}: InquiryFormProps) {
  const router = useRouter();
  const [loading, setLoading] = useState(false);

  async function handleSubmit(e: React.FormEvent<HTMLFormElement>) {
    e.preventDefault();
    setLoading(true);
    const formData = new FormData(e.currentTarget);
    const result = await createInquiry(formData);
    setLoading(false);

    if (result?.error) {
      toast.error(result.error);
      return;
    }

    toast.success("Votre demande a été envoyée. Nous vous recontacterons bientôt.");
    router.refresh();
    e.currentTarget.reset();
  }

  const selectClass =
    "mt-1 flex h-9 w-full rounded-md border border-input bg-transparent px-3 py-1 text-sm";

  return (
    <form onSubmit={handleSubmit} className="space-y-4">
      <div className="grid gap-4 sm:grid-cols-2">
        <div>
          <Label htmlFor="customer_name">Nom *</Label>
          <Input id="customer_name" name="customer_name" required />
        </div>
        <div>
          <Label htmlFor="customer_phone">Téléphone *</Label>
          <Input id="customer_phone" name="customer_phone" type="tel" required />
        </div>
      </div>

      <div>
        <Label htmlFor="customer_email">Email</Label>
        <Input id="customer_email" name="customer_email" type="email" />
      </div>

      {products.length > 0 && (
        <div>
          <Label htmlFor="product_id">Objet souhaité</Label>
          <select
            id="product_id"
            name="product_id"
            defaultValue={defaultProductId ?? ""}
            className={selectClass}
          >
            <option value="">Choisir un produit (optionnel)</option>
            {products.map((p) => (
              <option key={p.id} value={p.id}>{p.name}</option>
            ))}
          </select>
        </div>
      )}

      {universes.length > 0 && (
        <div>
          <Label htmlFor="universe_id">Univers</Label>
          <select
            id="universe_id"
            name="universe_id"
            defaultValue={defaultUniverseId ?? ""}
            className={selectClass}
          >
            <option value="">Choisir un univers (optionnel)</option>
            {universes.map((u) => (
              <option key={u.id} value={u.id}>{u.name}</option>
            ))}
          </select>
        </div>
      )}

      <div>
        <Label htmlFor="message">Message *</Label>
        <Textarea
          id="message"
          name="message"
          rows={5}
          required
          defaultValue={defaultMessage}
          placeholder="Décrivez votre projet, vos couleurs, votre personnalisation..."
        />
      </div>

      <Button type="submit" disabled={loading} className="w-full sm:w-auto">
        {loading ? "Envoi..." : "Envoyer ma demande"}
      </Button>
    </form>
  );
}
