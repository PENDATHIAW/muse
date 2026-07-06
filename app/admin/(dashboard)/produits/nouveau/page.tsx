import Link from "next/link";
import { Plus } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { ProductCreateForm } from "@/components/admin/product-create-form";
import { getAllUniversesAdmin } from "@/lib/queries";

export const dynamic = "force-dynamic";

export default async function NewProductPage() {
  const universes = await getAllUniversesAdmin();

  return (
    <div>
      <h1 className="text-2xl font-semibold">Ajouter un modèle</h1>
      <p className="mt-2 max-w-2xl text-sm text-muted-foreground">
        Uploadez vos photos, indiquez le prix, cliquez sur Ajouter. MUSE détecte
        l&apos;univers, génère les textes et publie le produit sur le site.
      </p>

      <Card className="mt-6 max-w-3xl">
        <CardHeader>
          <CardTitle>Nouveau produit</CardTitle>
        </CardHeader>
        <CardContent>
          <ProductCreateForm universes={universes} />
        </CardContent>
      </Card>

      <p className="mt-4 text-sm text-muted-foreground">
        <Link href="/admin/produits" className="text-primary hover:underline">
          ← Retour à la liste des produits
        </Link>
      </p>
    </div>
  );
}
