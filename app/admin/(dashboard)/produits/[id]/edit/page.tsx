import Link from "next/link";
import { notFound } from "next/navigation";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Textarea } from "@/components/ui/textarea";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Separator } from "@/components/ui/separator";
import { ImageManager } from "@/components/admin/image-manager";
import { getAllUniversesAdmin, getProductByIdAdmin } from "@/lib/queries";
import { updateProduct } from "@/lib/actions/admin";

export const dynamic = "force-dynamic";

interface EditProductPageProps {
  params: Promise<{ id: string }>;
}

export default async function EditProductPage({ params }: EditProductPageProps) {
  const { id } = await params;
  const [product, universes] = await Promise.all([
    getProductByIdAdmin(id),
    getAllUniversesAdmin(),
  ]);

  if (!product) notFound();

  const updateAction = updateProduct.bind(null, id);

  return (
    <div>
      <h1 className="text-2xl font-semibold">Modifier le produit</h1>
      <p className="text-sm text-muted-foreground">{product.name}</p>

      <Card className="mt-6 max-w-3xl">
        <CardHeader>
          <CardTitle>Informations</CardTitle>
        </CardHeader>
        <CardContent>
          <form action={updateAction} className="space-y-4">
            <div>
              <Label htmlFor="name">Nom *</Label>
              <Input id="name" name="name" defaultValue={product.name} required />
            </div>
            <div>
              <Label htmlFor="slug">Slug</Label>
              <Input id="slug" name="slug" defaultValue={product.slug} />
            </div>
            <div>
              <Label htmlFor="universe_id">Univers *</Label>
              <select
                id="universe_id"
                name="universe_id"
                required
                defaultValue={product.universe_id}
                className="flex h-9 w-full rounded-md border border-input bg-transparent px-3 py-1 text-sm"
              >
                {universes.map((u) => (
                  <option key={u.id} value={u.id}>{u.name}</option>
                ))}
              </select>
            </div>
            <div>
              <Label htmlFor="short_description">Description courte</Label>
              <Textarea id="short_description" name="short_description" rows={2} defaultValue={product.short_description} />
            </div>
            <div>
              <Label htmlFor="long_description">Description détaillée</Label>
              <Textarea id="long_description" name="long_description" rows={5} defaultValue={product.long_description} />
            </div>
            <div>
              <Label htmlFor="usage">Comment l&apos;utiliser</Label>
              <Textarea id="usage" name="usage" rows={3} defaultValue={product.usage ?? ""} />
            </div>
            <div>
              <Label htmlFor="inspiration">Ce qui nous a inspirés</Label>
              <Textarea id="inspiration" name="inspiration" rows={3} defaultValue={product.inspiration ?? ""} />
            </div>
            <div>
              <Label htmlFor="placement">Où le poser</Label>
              <Textarea id="placement" name="placement" rows={3} defaultValue={product.placement ?? ""} />
            </div>
            <div className="grid gap-4 sm:grid-cols-2">
              <div>
                <Label htmlFor="price">Prix (FCFA)</Label>
                <Input id="price" name="price" type="number" defaultValue={product.price} />
              </div>
              <div>
                <Label htmlFor="old_price">Ancien prix</Label>
                <Input id="old_price" name="old_price" type="number" defaultValue={product.old_price ?? ""} />
              </div>
            </div>
            <div className="grid gap-4 sm:grid-cols-2">
              <div>
                <Label htmlFor="dimensions">Dimensions</Label>
                <Input id="dimensions" name="dimensions" defaultValue={product.dimensions} />
              </div>
              <div>
                <Label htmlFor="print_time">Temps d&apos;impression</Label>
                <Input id="print_time" name="print_time" defaultValue={product.print_time} />
              </div>
            </div>
            <div>
              <Label htmlFor="material">Matière</Label>
              <Input id="material" name="material" defaultValue={product.material} />
            </div>
            <div>
              <Label htmlFor="colors">Couleurs</Label>
              <Input id="colors" name="colors" defaultValue={product.colors.join(", ")} />
            </div>
            <div>
              <Label htmlFor="finishes">Finitions</Label>
              <Input id="finishes" name="finishes" defaultValue={product.finishes.join(", ")} />
            </div>
            <div>
              <Label htmlFor="personalization_options">Personnalisation</Label>
              <Input id="personalization_options" name="personalization_options" defaultValue={product.personalization_options.join(", ")} />
            </div>
            <div className="grid gap-4 sm:grid-cols-2">
              <div>
                <Label htmlFor="stock_status">Disponibilité</Label>
                <select id="stock_status" name="stock_status" defaultValue={product.stock_status} className="flex h-9 w-full rounded-md border border-input bg-transparent px-3 py-1 text-sm">
                  <option value="available">Disponible</option>
                  <option value="limited">Stock limité</option>
                  <option value="out_of_stock">Rupture</option>
                  <option value="made_to_order">Sur commande</option>
                </select>
              </div>
              <div>
                <Label htmlFor="status">Statut</Label>
                <select id="status" name="status" defaultValue={product.status} className="flex h-9 w-full rounded-md border border-input bg-transparent px-3 py-1 text-sm">
                  <option value="draft">Brouillon</option>
                  <option value="published">Publié</option>
                </select>
              </div>
            </div>
            <div>
              <Label htmlFor="tags">Tags</Label>
              <Input id="tags" name="tags" defaultValue={product.tags.join(", ")} />
            </div>
            <div>
              <Label htmlFor="display_order">Ordre</Label>
              <Input id="display_order" name="display_order" type="number" defaultValue={product.display_order} />
            </div>
            <div>
              <Label htmlFor="internal_note">Note interne</Label>
              <Textarea id="internal_note" name="internal_note" rows={2} defaultValue={product.internal_note} />
            </div>
            <div className="flex items-center gap-2">
              <input
                type="checkbox"
                id="is_featured"
                name="is_featured"
                defaultChecked={product.is_featured}
                className="h-4 w-4 rounded border-input"
              />
              <Label htmlFor="is_featured">Mis en avant</Label>
            </div>
            <div className="flex gap-3">
              <Button type="submit">Enregistrer</Button>
              <Button asChild variant="outline">
                <Link href={`/produit/${product.slug}`} target="_blank">Voir sur le site</Link>
              </Button>
            </div>
          </form>
        </CardContent>
      </Card>

      <Card className="mt-8 max-w-3xl">
        <CardHeader>
          <CardTitle>Images du produit</CardTitle>
        </CardHeader>
        <CardContent>
          <ImageManager productId={product.id} images={product.images ?? []} />
        </CardContent>
      </Card>
    </div>
  );
}
