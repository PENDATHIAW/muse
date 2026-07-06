import Link from "next/link";
import Image from "next/image";
import { Pencil, Trash2 } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { deleteProduct } from "@/lib/actions/admin";
import {
  formatPrice,
  getMainImage,
  hasValidProductImage,
  PRODUCT_STATUS_LABELS,
} from "@/lib/utils-muse";
import type { Product } from "@/types/database";

export function ProductAdminGrid({ products }: { products: Product[] }) {
  if (products.length === 0) {
    return (
      <div className="rounded-lg border border-dashed border-border p-12 text-center text-muted-foreground">
        Aucun produit pour le moment. Cliquez sur « Ajouter un modèle ».
      </div>
    );
  }

  return (
    <div className="grid gap-4 sm:grid-cols-2 xl:grid-cols-3">
      {products.map((product) => {
        const imageUrl = getMainImage(product.images);
        const showImage = hasValidProductImage(imageUrl);

        return (
          <article
            key={product.id}
            className="overflow-hidden rounded-2xl border border-border bg-card"
          >
            <div className="relative aspect-[4/3] bg-muted">
              {showImage && imageUrl ? (
                <Image
                  src={imageUrl}
                  alt={product.name}
                  fill
                  className="object-cover"
                  sizes="(max-width: 768px) 100vw, 33vw"
                />
              ) : (
                <div className="flex h-full items-center justify-center font-serif tracking-[0.2em] text-muse-moka/40">
                  MUSE
                </div>
              )}
              <div className="absolute left-3 top-3">
                <Badge variant={product.status === "published" ? "default" : "secondary"}>
                  {PRODUCT_STATUS_LABELS[product.status]}
                </Badge>
              </div>
            </div>

            <div className="space-y-3 p-4">
              <div>
                <p className="text-xs uppercase tracking-wider text-muted-foreground">
                  {product.universe?.name ?? "Sans univers"}
                </p>
                <h2 className="mt-1 font-medium text-muse-charcoal line-clamp-2">
                  {product.name}
                </h2>
              </div>

              <p className="text-lg font-semibold text-muse-terracotta">
                {formatPrice(product.price)}
              </p>

              <div className="flex gap-2">
                <Button asChild variant="outline" size="sm" className="flex-1">
                  <Link href={`/admin/produits/${product.id}/edit`}>
                    <Pencil className="mr-2 h-3 w-3" />
                    Modifier
                  </Link>
                </Button>
                <form
                  action={async () => {
                    "use server";
                    await deleteProduct(product.id);
                  }}
                  className="flex-1"
                >
                  <Button type="submit" variant="destructive" size="sm" className="w-full">
                    <Trash2 className="mr-2 h-3 w-3" />
                    Supprimer
                  </Button>
                </form>
              </div>
            </div>
          </article>
        );
      })}
    </div>
  );
}
