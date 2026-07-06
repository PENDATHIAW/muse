import Link from "next/link";
import { Button } from "@/components/ui/button";
import { NewPhotosPanel } from "@/components/admin/new-photos-panel";
import { ProductAdminGrid } from "@/components/admin/product-admin-grid";
import { getNewProductImages } from "@/lib/actions/admin";
import { getAllProductsAdmin } from "@/lib/queries";

export const dynamic = "force-dynamic";

export default async function AdminProductsPage() {
  const [products, newImagesResult] = await Promise.all([
    getAllProductsAdmin(),
    getNewProductImages(),
  ]);

  return (
    <div>
      <div className="flex flex-col gap-4 sm:flex-row sm:items-start sm:justify-between">
        <div>
          <h1 className="text-2xl font-semibold">Produits</h1>
          <p className="text-sm text-muted-foreground">
            {products.length} modèle(s) — chaque carte montre la photo réelle du produit.
          </p>
        </div>
        <div className="flex flex-wrap gap-2">
          <Button asChild variant="outline">
            <Link href="/admin/produits/nouveau">Ajouter manuellement</Link>
          </Button>
        </div>
      </div>

      <NewPhotosPanel images={newImagesResult.images} />

      <div className="mt-4 rounded-lg border border-border bg-muted/30 p-4 text-sm text-muted-foreground">
        <strong className="text-foreground">Workflow :</strong> déposez vos photos dans{" "}
        <code>public/products/</code> → poussez sur GitHub → revenez ici →{" "}
        <strong className="text-foreground">Ajouter au catalogue</strong>. Univers, référence
        REF Mxx, prix et textes sont automatiques. Modifiez ensuite via{" "}
        <strong className="text-foreground">Modifier</strong>.
      </div>

      <div className="mt-6">
        <ProductAdminGrid products={products} />
      </div>
    </div>
  );
}
