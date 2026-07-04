import Link from "next/link";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Textarea } from "@/components/ui/textarea";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { getAllUniversesAdmin } from "@/lib/queries";
import { createProduct } from "@/lib/actions/admin";

export const dynamic = "force-dynamic";

export default async function NewProductPage() {
  const universes = await getAllUniversesAdmin();

  return (
    <div>
      <h1 className="text-2xl font-semibold">Nouveau produit</h1>
      <Card className="mt-6 max-w-3xl">
        <CardHeader>
          <CardTitle>Informations produit</CardTitle>
        </CardHeader>
        <CardContent>
          <form action={createProduct} className="space-y-4">
            <div>
              <Label htmlFor="name">Nom *</Label>
              <Input id="name" name="name" required />
            </div>
            <div>
              <Label htmlFor="universe_id">Univers *</Label>
              <select
                id="universe_id"
                name="universe_id"
                required
                className="flex h-9 w-full rounded-md border border-input bg-transparent px-3 py-1 text-sm"
              >
                <option value="">Choisir...</option>
                {universes.map((u) => (
                  <option key={u.id} value={u.id}>{u.name}</option>
                ))}
              </select>
            </div>
            <div>
              <Label htmlFor="short_description">Description courte</Label>
              <Textarea id="short_description" name="short_description" rows={2} />
            </div>
            <div>
              <Label htmlFor="long_description">Description détaillée</Label>
              <Textarea id="long_description" name="long_description" rows={5} />
            </div>
            <div className="grid gap-4 sm:grid-cols-2">
              <div>
                <Label htmlFor="price">Prix (FCFA) *</Label>
                <Input id="price" name="price" type="number" required defaultValue={0} />
              </div>
              <div>
                <Label htmlFor="old_price">Ancien prix (optionnel)</Label>
                <Input id="old_price" name="old_price" type="number" />
              </div>
            </div>
            <div className="grid gap-4 sm:grid-cols-2">
              <div>
                <Label htmlFor="dimensions">Dimensions</Label>
                <Input id="dimensions" name="dimensions" placeholder="30 × 20 × 8 cm" />
              </div>
              <div>
                <Label htmlFor="print_time">Temps d&apos;impression</Label>
                <Input id="print_time" name="print_time" placeholder="4-5 heures" />
              </div>
            </div>
            <div>
              <Label htmlFor="material">Matière / filament</Label>
              <Input id="material" name="material" />
            </div>
            <div>
              <Label htmlFor="colors">Couleurs (séparées par des virgules)</Label>
              <Input id="colors" name="colors" placeholder="ivoire, sage, terracotta" />
            </div>
            <div>
              <Label htmlFor="finishes">Finitions (séparées par des virgules)</Label>
              <Input id="finishes" name="finishes" placeholder="mat, effet bois" />
            </div>
            <div>
              <Label htmlFor="personalization_options">Options de personnalisation</Label>
              <Input id="personalization_options" name="personalization_options" placeholder="nom, logo, couleur" />
            </div>
            <div className="grid gap-4 sm:grid-cols-2">
              <div>
                <Label htmlFor="stock_status">Disponibilité</Label>
                <select id="stock_status" name="stock_status" className="flex h-9 w-full rounded-md border border-input bg-transparent px-3 py-1 text-sm">
                  <option value="available">Disponible</option>
                  <option value="limited">Stock limité</option>
                  <option value="out_of_stock">Rupture</option>
                  <option value="made_to_order">Sur commande</option>
                </select>
              </div>
              <div>
                <Label htmlFor="status">Statut</Label>
                <select id="status" name="status" className="flex h-9 w-full rounded-md border border-input bg-transparent px-3 py-1 text-sm">
                  <option value="draft">Brouillon</option>
                  <option value="published">Publié</option>
                </select>
              </div>
            </div>
            <div>
              <Label htmlFor="tags">Tags (séparés par des virgules)</Label>
              <Input id="tags" name="tags" placeholder="personnalisable, bestseller, nouveauté" />
            </div>
            <div>
              <Label htmlFor="display_order">Ordre d&apos;affichage</Label>
              <Input id="display_order" name="display_order" type="number" defaultValue={0} />
            </div>
            <div>
              <Label htmlFor="internal_note">Note interne admin</Label>
              <Textarea id="internal_note" name="internal_note" rows={2} />
            </div>
            <div className="flex items-center gap-2">
              <input
                type="checkbox"
                id="is_featured"
                name="is_featured"
                className="h-4 w-4 rounded border-input"
              />
              <Label htmlFor="is_featured">Produit mis en avant</Label>
            </div>
            <div className="flex gap-3">
              <Button type="submit">Créer et gérer les images</Button>
              <Button asChild variant="outline">
                <Link href="/admin/produits">Annuler</Link>
              </Button>
            </div>
          </form>
        </CardContent>
      </Card>
    </div>
  );
}
