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
        Méthode recommandée : déposez vos photos dans{" "}
        <code>public/products/</code>, poussez sur GitHub, puis sur la page{" "}
        <Link href="/admin/produits" className="text-primary hover:underline">
          Produits
        </Link>{" "}
        cliquez sur <strong>Ajouter au catalogue</strong>.
      </p>

      <div className="mt-4 max-w-3xl rounded-lg border border-dashed border-muted-foreground/30 bg-muted/20 p-4 text-sm text-muted-foreground">
        L&apos;upload direct ci-dessous est réservé aux cas exceptionnels. Pour
        ajouter plusieurs visuels, utilisez le workflow Git (plus simple, sans
        Supabase Storage).
      </div>

      <Card className="mt-6 max-w-3xl">
        <CardHeader>
          <CardTitle>Upload manuel (exceptionnel)</CardTitle>
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
