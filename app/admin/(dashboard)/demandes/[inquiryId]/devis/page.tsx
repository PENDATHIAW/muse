import Link from "next/link";
import { notFound } from "next/navigation";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Textarea } from "@/components/ui/textarea";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import {
  buildQuotePrefillFromInquiry,
} from "@/lib/quotes";
import { createOrderQuote } from "@/lib/actions/quotes";

export const dynamic = "force-dynamic";

interface NewQuotePageProps {
  params: Promise<{ inquiryId: string }>;
}

export default async function NewQuotePage({ params }: NewQuotePageProps) {
  const { inquiryId } = await params;
  const prefill = await buildQuotePrefillFromInquiry(inquiryId);

  if (!prefill) notFound();

  return (
    <div>
      <Link
        href="/admin/demandes"
        className="text-sm text-muted-foreground hover:text-primary"
      >
        ← Retour aux demandes
      </Link>
      <h1 className="mt-4 text-2xl font-semibold">Créer une fiche de commande</h1>
      <p className="text-sm text-muted-foreground">
        Pour {prefill.customer_name} — vérifiez les informations avant envoi.
      </p>

      <Card className="mt-6 max-w-3xl">
        <CardHeader>
          <CardTitle>Contenu de la fiche</CardTitle>
        </CardHeader>
        <CardContent>
          <form action={createOrderQuote} className="space-y-4">
            <input type="hidden" name="inquiry_id" value={prefill.inquiry_id ?? ""} />
            <input type="hidden" name="product_id" value={prefill.product_id ?? ""} />
            <input type="hidden" name="product_image_url" value={prefill.product_image_url} />

            <div className="grid gap-4 sm:grid-cols-2">
              <div>
                <Label htmlFor="customer_name">Client *</Label>
                <Input id="customer_name" name="customer_name" defaultValue={prefill.customer_name} required />
              </div>
              <div>
                <Label htmlFor="customer_phone">Téléphone *</Label>
                <Input id="customer_phone" name="customer_phone" defaultValue={prefill.customer_phone} required />
              </div>
            </div>
            <div>
              <Label htmlFor="customer_email">E-mail</Label>
              <Input id="customer_email" name="customer_email" type="email" defaultValue={prefill.customer_email ?? ""} />
            </div>

            <div>
              <Label htmlFor="product_name">Produit *</Label>
              <Input id="product_name" name="product_name" defaultValue={prefill.product_name} required />
            </div>
            <div>
              <Label htmlFor="universe_name">Univers</Label>
              <Input id="universe_name" name="universe_name" defaultValue={prefill.universe_name} />
            </div>

            <div className="grid gap-4 sm:grid-cols-2">
              <div>
                <Label htmlFor="unit_price">Prix unitaire (FCFA) *</Label>
                <Input id="unit_price" name="unit_price" type="number" defaultValue={prefill.unit_price || ""} required />
              </div>
              <div>
                <Label htmlFor="quantity">Quantité</Label>
                <Input id="quantity" name="quantity" type="number" min={1} defaultValue={1} />
              </div>
            </div>

            <div>
              <Label htmlFor="dimensions">Dimensions</Label>
              <Input id="dimensions" name="dimensions" defaultValue={prefill.dimensions} />
            </div>
            <div>
              <Label htmlFor="colors">Couleur(s)</Label>
              <Input id="colors" name="colors" defaultValue={prefill.colors} placeholder="Ex. terracotta, ivoire" />
            </div>
            <div>
              <Label htmlFor="finishes">Finition(s)</Label>
              <Input id="finishes" name="finishes" defaultValue={prefill.finishes} />
            </div>
            <div>
              <Label htmlFor="personalization">Personnalisation demandée</Label>
              <Textarea id="personalization" name="personalization" rows={3} defaultValue={prefill.personalization} />
            </div>
            <div>
              <Label htmlFor="conception_days">Délai de conception (jours)</Label>
              <Input
                id="conception_days"
                name="conception_days"
                type="number"
                min={1}
                defaultValue={prefill.conception_days ?? ""}
                placeholder="Ex. 5"
              />
            </div>
            <div>
              <Label htmlFor="delivery_note">Livraison / retrait</Label>
              <Textarea id="delivery_note" name="delivery_note" rows={2} placeholder="Ex. Retrait à Dakar, livraison sous 48h..." />
            </div>
            <div>
              <Label htmlFor="admin_message">Message au client</Label>
              <Textarea id="admin_message" name="admin_message" rows={4} defaultValue={prefill.admin_message} />
            </div>

            <button
              type="submit"
              className="inline-flex h-10 items-center justify-center rounded-md bg-primary px-6 text-sm text-primary-foreground"
            >
              Créer la fiche et préparer l&apos;envoi
            </button>
          </form>
        </CardContent>
      </Card>
    </div>
  );
}
