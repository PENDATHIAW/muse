import Link from "next/link";
import Image from "next/image";
import { Sparkles, Star } from "lucide-react";
import { Badge } from "@/components/ui/badge";
import { Card, CardContent } from "@/components/ui/card";
import { formatPrice, getMainImage, hasValidProductImage } from "@/lib/utils-muse";
import type { Product } from "@/types/database";

interface ProductCardProps {
  product: Product;
  priority?: boolean;
}

export function ProductCard({ product, priority = false }: ProductCardProps) {
  const imageUrl = getMainImage(product.images);
  const showImage = hasValidProductImage(imageUrl);
  const isNew = product.tags.includes("nouveauté");
  const isBestseller = product.tags.includes("bestseller");
  const isCustomizable = product.tags.includes("personnalisable") || product.personalization_options.length > 0;

  return (
    <Card className="group overflow-hidden border-border/80 bg-card muse-card-hover">
      <Link href={`/produit/${product.slug}`}>
        <div className="relative aspect-[4/5] overflow-hidden bg-muse-beige/40">
          {showImage && imageUrl ? (
            <Image
              src={imageUrl}
              alt={product.name}
              fill
              priority={priority}
              loading={priority ? "eager" : "lazy"}
              className="object-cover transition-transform duration-500 group-hover:scale-105"
              sizes="(max-width: 768px) 100vw, (max-width: 1200px) 50vw, 33vw"
            />
          ) : (
            <div className="flex h-full items-center justify-center bg-gradient-to-br from-muse-beige to-muse-sand/50">
              <span className="font-serif text-2xl tracking-[0.3em] text-muse-moka/40">
                MUSE
              </span>
            </div>
          )}
          <div className="absolute left-3 top-3 flex flex-wrap gap-1.5">
            {isCustomizable && (
              <Badge variant="secondary" className="bg-background/90 text-xs">
                <Sparkles className="mr-1 h-3 w-3" />
                Personnalisable
              </Badge>
            )}
            {isNew && (
              <Badge className="bg-muse-sage text-xs text-white">Nouveauté</Badge>
            )}
            {isBestseller && (
              <Badge className="bg-muse-terracotta text-xs">
                <Star className="mr-1 h-3 w-3" />
                Bestseller
              </Badge>
            )}
          </div>
        </div>
        <CardContent className="p-4">
          {product.universe && (
            <p className="mb-1 text-xs uppercase tracking-wider text-muted-foreground">
              {product.universe.name}
            </p>
          )}
          <h3 className="font-medium text-muse-charcoal line-clamp-2">{product.name}</h3>
          <p className="mt-1 text-sm text-muted-foreground line-clamp-2">
            {product.short_description}
          </p>
          <div className="mt-3 flex items-baseline gap-2">
            <span className="text-lg font-semibold text-muse-terracotta">
              {formatPrice(product.price)}
            </span>
            {product.old_price && (
              <span className="text-sm text-muted-foreground line-through">
                {formatPrice(product.old_price)}
              </span>
            )}
          </div>
        </CardContent>
      </Link>
    </Card>
  );
}
