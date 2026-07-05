import Link from "next/link";
import Image from "next/image";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table";
import { getAllProductImagesAdmin } from "@/lib/queries";

export const dynamic = "force-dynamic";

export default async function AdminImagesPage() {
  const images = await getAllProductImagesAdmin();

  return (
    <div>
      <h1 className="text-2xl font-semibold">Images</h1>
      <p className="text-sm text-muted-foreground">
        Gérez les images depuis la fiche produit ou consultez-les ici.
      </p>

      <div className="mt-6 overflow-x-auto rounded-lg border border-border">
        <Table>
          <TableHeader>
            <TableRow>
              <TableHead>Aperçu</TableHead>
              <TableHead>Produit</TableHead>
              <TableHead>Alt text</TableHead>
              <TableHead>Principale</TableHead>
              <TableHead>Ordre</TableHead>
              <TableHead>Actions</TableHead>
            </TableRow>
          </TableHeader>
          <TableBody>
            {images.map((img) => (
              <TableRow key={img.id}>
                <TableCell>
                  <div className="relative h-12 w-12 overflow-hidden rounded">
                    <Image src={img.image_url} alt={img.alt_text} fill className="object-cover" />
                  </div>
                </TableCell>
                <TableCell>
                  {img.product ? (
                    <Link href={`/admin/produits/${img.product.id}/edit`} className="hover:text-primary">
                      {img.product.name}
                    </Link>
                  ) : "—"}
                </TableCell>
                <TableCell className="max-w-[200px] truncate text-muted-foreground">
                  {img.alt_text}
                </TableCell>
                <TableCell>
                  {img.is_main ? <Badge>Principale</Badge> : "—"}
                </TableCell>
                <TableCell>{img.display_order}</TableCell>
                <TableCell>
                  {img.product && (
                    <Button asChild variant="outline" size="sm">
                      <Link href={`/admin/produits/${img.product.id}/edit`}>Gérer</Link>
                    </Button>
                  )}
                </TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </div>
    </div>
  );
}
