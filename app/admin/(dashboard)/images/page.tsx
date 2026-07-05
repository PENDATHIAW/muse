import Link from "next/link";
import Image from "next/image";
import { ExternalLink } from "lucide-react";
import { Button } from "@/components/ui/button";
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table";
import { GithubEditBanner } from "@/components/admin/github-edit-banner";
import { getAllProductImagesAdmin } from "@/lib/catalog";

export default function AdminImagesPage() {
  const images = getAllProductImagesAdmin();

  return (
    <div>
      <GithubEditBanner
        filePath="data/products.json"
        label="Les chemins d'images se modifient dans products.json."
      />

      <h1 className="text-2xl font-semibold">Images</h1>
      <p className="text-sm text-muted-foreground">
        Uploadez vos fichiers dans <code>public/products/[slug]/</code> sur GitHub.
      </p>

      <div className="mt-4">
        <Button asChild variant="outline">
          <Link href="https://github.com/PENDATHIAW/muse/upload/main/public/products" target="_blank">
            <ExternalLink className="mr-2 h-4 w-4" />
            Uploader dans public/products/
          </Link>
        </Button>
      </div>

      <div className="mt-6 overflow-x-auto rounded-lg border border-border">
        <Table>
          <TableHeader>
            <TableRow>
              <TableHead>Aperçu</TableHead>
              <TableHead>Produit</TableHead>
              <TableHead>Chemin</TableHead>
              <TableHead>Principale</TableHead>
            </TableRow>
          </TableHeader>
          <TableBody>
            {images.map((img) => (
              <TableRow key={img.id}>
                <TableCell>
                  <div className="relative h-12 w-12 overflow-hidden rounded bg-muted">
                    <Image src={img.image_url} alt={img.alt_text} fill className="object-cover" unoptimized />
                  </div>
                </TableCell>
                <TableCell>{img.product?.name ?? "—"}</TableCell>
                <TableCell className="max-w-xs truncate font-mono text-xs">{img.image_url}</TableCell>
                <TableCell>{img.is_main ? "Oui" : "—"}</TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </div>
    </div>
  );
}
