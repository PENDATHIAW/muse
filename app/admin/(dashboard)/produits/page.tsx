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
import { deleteProduct } from "@/lib/actions/admin";
import { formatPrice, PRODUCT_STATUS_LABELS } from "@/lib/utils-muse";

export const dynamic = "force-dynamic";

export default async function AdminProductsPage() {
  const products = await getAllProductsAdmin();

  return (
    <div>
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-semibold">Produits</h1>
          <p className="text-sm text-muted-foreground">{products.length} produits</p>
        </div>
        <Button asChild>
          <Link href="/admin/produits/nouveau">
            <Plus className="mr-2 h-4 w-4" />
            Ajouter
          </Link>
        </Button>
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
