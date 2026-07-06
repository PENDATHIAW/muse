import Link from "next/link";
import { Plus } from "lucide-react";
import { Button } from "@/components/ui/button";
import { ProductAdminGrid } from "@/components/admin/product-admin-grid";
import { getAllProductsAdmin } from "@/lib/queries";
import { syncCatalogJsonToSupabase } from "@/lib/actions/admin";

export const dynamic = "force-dynamic";

export default async function AdminProductsPage() {
  const products = await getAllProductsAdmin();

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
          <form
            action={async () => {
              "use server";
              await syncCatalogJsonToSupabase();
            }}
          >
            <Button type="submit" variant="outline">
              Importer le catalogue existant
            </Button>
          </form>
          <Button asChild>
            <Link href="/admin/produits/nouveau">
              <Plus className="mr-2 h-4 w-4" />
              Ajouter un modèle
            </Link>
          </Button>
        </div>
      </div>

      <div className="mt-4 rounded-lg border border-border bg-muted/30 p-4 text-sm text-muted-foreground">
        <strong className="text-foreground">Workflow :</strong> photos + prix →
        détection automatique de l&apos;univers → descriptions générées → visible
        sur le site. Utilisez <strong className="text-foreground">Modifier</strong> pour
        ajuster le prix ou les textes.
      </div>

      <div className="mt-6">
        <ProductAdminGrid products={products} />
      </div>
    </div>
  );
}
