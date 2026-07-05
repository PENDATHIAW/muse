import Link from "next/link";
import { Plus, Pencil, Trash2 } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table";
import { getAllProductsAdmin } from "@/lib/queries";
import { deleteProduct, syncCatalogJsonToSupabase } from "@/lib/actions/admin";
import { formatPrice, PRODUCT_STATUS_LABELS } from "@/lib/utils-muse";

export const dynamic = "force-dynamic";

export default async function AdminProductsPage() {
  const products = await getAllProductsAdmin();

  return (
    <div>
      <div className="flex flex-col gap-4 sm:flex-row sm:items-start sm:justify-between">
        <div>
          <h1 className="text-2xl font-semibold">Produits</h1>
          <p className="text-sm text-muted-foreground">
            {products.length} produit(s) dans Supabase — visible(s) sur le site après publication.
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
              Synchroniser le catalogue JSON
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
        <strong className="text-foreground">Workflow simple :</strong> Admin → Ajouter un modèle →
        choisir l&apos;univers → publier. Prix et textes remplis automatiquement. Pas de SQL, pas de Git.
      </div>

      <div className="mt-6 overflow-x-auto rounded-lg border border-border">
        <Table>
          <TableHeader>
            <TableRow>
              <TableHead>Nom</TableHead>
              <TableHead>Univers</TableHead>
              <TableHead>Prix</TableHead>
              <TableHead>Statut</TableHead>
              <TableHead>Mis en avant</TableHead>
              <TableHead className="text-right">Actions</TableHead>
            </TableRow>
          </TableHeader>
          <TableBody>
            {products.map((p) => (
              <TableRow key={p.id}>
                <TableCell className="font-medium">{p.name}</TableCell>
                <TableCell className="text-muted-foreground">
                  {p.universe?.name ?? "—"}
                </TableCell>
                <TableCell>{formatPrice(p.price)}</TableCell>
                <TableCell>
                  <Badge variant={p.status === "published" ? "default" : "secondary"}>
                    {PRODUCT_STATUS_LABELS[p.status]}
                  </Badge>
                </TableCell>
                <TableCell>{p.is_featured ? "Oui" : "Non"}</TableCell>
                <TableCell className="text-right">
                  <div className="flex justify-end gap-2">
                    <Button asChild variant="outline" size="sm">
                      <Link href={`/admin/produits/${p.id}/edit`}>
                        <Pencil className="h-3 w-3" />
                      </Link>
                    </Button>
                    <form action={async () => { "use server"; await deleteProduct(p.id); }}>
                      <Button type="submit" variant="destructive" size="sm">
                        <Trash2 className="h-3 w-3" />
                      </Button>
                    </form>
                  </div>
                </TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </div>
    </div>
  );
}
