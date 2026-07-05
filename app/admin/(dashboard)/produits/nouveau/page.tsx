import Link from "next/link";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { getAllUniversesAdmin } from "@/lib/queries";
import { createProduct } from "@/lib/actions/admin";

export const dynamic = "force-dynamic";

export default async function NewProductPage() {
  const universes = await getAllUniversesAdmin();

  return (
    <div>
      <h1 className="text-2xl font-semibold">Ajouter un modèle</h1>
      <p className="mt-2 max-w-2xl text-sm text-muted-foreground">
        Choisissez l&apos;univers et le nom. Le prix, les descriptions, l&apos;usage,
        l&apos;inspiration et l&apos;emplacement sont remplis automatiquement. Le produit
        est publié sur le site dès l&apos;enregistrement.
      </p>

      <Card className="mt-6 max-w-2xl">
        <CardHeader>
          <CardTitle>Nouveau produit</CardTitle>
        </CardHeader>
        <CardContent>
          <form action={createProduct} className="space-y-4">
            <div>
              <Label htmlFor="name">Nom du modèle *</Label>
              <Input
                id="name"
                name="name"
                required
                placeholder="Ex. Vide-poche Teranga — modèle 12"
              />
            </div>

            <div>
              <Label htmlFor="universe_id">Univers *</Label>
              <select
                id="universe_id"
                name="universe_id"
                required
                className="flex h-9 w-full rounded-md border border-input bg-transparent px-3 py-1 text-sm"
              >
                <option value="">Choisir un univers...</option>
                {universes.map((u) => (
                  <option key={u.id} value={u.id}>
                    {u.name}
                  </option>
                ))}
              </select>
              <p className="mt-1 text-xs text-muted-foreground">
                Le prix et les textes (usage, inspiration, emplacement) viennent de
                cet univers.
              </p>
            </div>

            <div>
              <Label htmlFor="image_url">Photo (chemin sur le site)</Label>
              <Input
                id="image_url"
                name="image_url"
                placeholder="/products/mon-fichier.png"
              />
              <p className="mt-1 text-xs text-muted-foreground">
                Si la photo est déjà dans le projet (dossier public/products/), indiquez
                son chemin. Sinon, ajoutez-la à l&apos;étape suivante.
              </p>
            </div>

            <input type="hidden" name="status" value="published" />
            <input type="hidden" name="stock_status" value="available" />

            <div className="flex items-center gap-2">
              <input
                type="checkbox"
                id="is_featured"
                name="is_featured"
                className="h-4 w-4 rounded border-input"
              />
              <Label htmlFor="is_featured">Afficher sur la page d&apos;accueil</Label>
            </div>

            <details className="rounded-lg border border-border p-4">
              <summary className="cursor-pointer text-sm font-medium">
                Options avancées (optionnel)
              </summary>
              <div className="mt-4 space-y-4">
                <div>
                  <Label htmlFor="price">Prix personnalisé (FCFA)</Label>
                  <Input id="price" name="price" type="number" placeholder="Laisser vide = prix de l'univers" />
                </div>
                <div>
                  <Label htmlFor="short_description">Description courte</Label>
                  <Input id="short_description" name="short_description" />
                </div>
              </div>
            </details>

            <div className="flex gap-3">
              <Button type="submit">Publier sur le site</Button>
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
