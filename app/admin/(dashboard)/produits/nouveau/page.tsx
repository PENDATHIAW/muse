import Link from "next/link";
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
        Méthode recommandée : ajoutez vos photos ici. Elles sont envoyées
        directement dans <strong>Supabase Storage</strong> et visibles sur le
        site sans nouveau déploiement.
      </p>

      <div className="mt-4 max-w-3xl rounded-lg border border-dashed border-muted-foreground/30 bg-muted/20 p-4 text-sm text-muted-foreground">
        Pour importer un ancien stock déjà présent dans{" "}
        <code>public/products</code>, utilisez le script{" "}
        <code>npm run upload-photos-supabase</code> en local.
      </div>

      <Card className="mt-6 max-w-3xl">
        <CardHeader>
          <CardTitle>Upload produit (Supabase)</CardTitle>
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
