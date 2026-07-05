import Link from "next/link";
import { notFound } from "next/navigation";
import Image from "next/image";
import { ExternalLink } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { GithubEditBanner } from "@/components/admin/github-edit-banner";
import { getProductByIdAdmin, githubEditUrl } from "@/lib/catalog";
import { formatPrice, PRODUCT_STATUS_LABELS } from "@/lib/utils-muse";

interface EditProductPageProps {
  params: Promise<{ id: string }>;
}

export default async function AdminProductDetailPage({ params }: EditProductPageProps) {
  const { id } = await params;
  const product = getProductByIdAdmin(id);
  if (!product) notFound();

  return (
    <div>
      <GithubEditBanner filePath="data/products.json" />

      <div className="flex flex-wrap items-start justify-between gap-4">
        <div>
          <h1 className="text-2xl font-semibold">{product.name}</h1>
          <p className="text-sm text-muted-foreground">Slug : {product.slug}</p>
        </div>
        <div className="flex gap-2">
          <Button asChild variant="outline">
            <Link href={`/produit/${product.slug}`} target="_blank">
              Voir sur le site
            </Link>
          </Button>
          <Button asChild>
            <Link href={githubEditUrl("data/products.json")} target="_blank">
              <ExternalLink className="mr-2 h-4 w-4" />
              Éditer JSON
            </Link>
          </Button>
        </div>
      </div>

      <div className="mt-8 grid gap-6 lg:grid-cols-2">
        <Card>
          <CardHeader>
            <CardTitle>Informations</CardTitle>
          </CardHeader>
          <CardContent className="space-y-2 text-sm">
            <p><strong>Prix :</strong> {formatPrice(product.price)}</p>
            <p><strong>Univers :</strong> {product.universe?.name}</p>
            <p><strong>Statut :</strong> {PRODUCT_STATUS_LABELS[product.status]}</p>
            <p><strong>Matière :</strong> {product.material}</p>
            <p><strong>Dimensions :</strong> {product.dimensions}</p>
            <div className="flex flex-wrap gap-1 pt-2">
              {product.tags.map((t) => (
                <Badge key={t} variant="outline">{t}</Badge>
              ))}
            </div>
          </CardContent>
        </Card>

        <Card>
          <CardHeader>
            <CardTitle>Images ({product.images?.length ?? 0})</CardTitle>
          </CardHeader>
          <CardContent className="space-y-4">
            <p className="text-sm text-muted-foreground">
              Uploadez vos photos dans{" "}
              <code>public/products/{product.slug}/</code> puis vérifiez les chemins
              dans <code>data/products.json</code>.
            </p>
            <Button asChild variant="outline" size="sm">
              <Link
                href={`https://github.com/PENDATHIAW/muse/upload/main/public/products/${product.slug}`}
                target="_blank"
              >
                <ExternalLink className="mr-2 h-4 w-4" />
                Uploader une image
              </Link>
            </Button>
            <div className="grid gap-3 sm:grid-cols-2">
              {product.images?.map((img) => (
                <div key={img.id} className="rounded-lg border border-border p-2">
                  <div className="relative aspect-square overflow-hidden rounded bg-muted">
                    <Image
                      src={img.image_url}
                      alt={img.alt_text}
                      fill
                      className="object-cover"
                      unoptimized
                    />
                  </div>
                  <p className="mt-1 truncate font-mono text-xs">{img.image_url}</p>
                </div>
              ))}
            </div>
          </CardContent>
        </Card>
      </div>
    </div>
  );
}
