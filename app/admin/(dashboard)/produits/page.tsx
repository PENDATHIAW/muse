import Link from "next/link";
import { ExternalLink } from "lucide-react";
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
import { GithubEditBanner } from "@/components/admin/github-edit-banner";
import { getAllProductsAdmin, githubEditUrl } from "@/lib/catalog";
import { formatPrice, PRODUCT_STATUS_LABELS } from "@/lib/utils-muse";

export default function AdminProductsPage() {
  const products = getAllProductsAdmin();

  return (
    <div>
      <GithubEditBanner filePath="data/products.json" />

      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-semibold">Produits</h1>
          <p className="text-sm text-muted-foreground">{products.length} produits</p>
        </div>
        <Button asChild>
          <Link href={githubEditUrl("data/products.json")} target="_blank">
            <ExternalLink className="mr-2 h-4 w-4" />
            Modifier sur GitHub
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
              <TableHead>Images</TableHead>
              <TableHead className="text-right">Voir</TableHead>
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
                <TableCell>{p.images?.length ?? 0}</TableCell>
                <TableCell className="text-right">
                  <Button asChild variant="outline" size="sm">
                    <Link href={`/admin/produits/${p.id}/edit`}>Fiche</Link>
                  </Button>
                </TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </div>
    </div>
  );
}
