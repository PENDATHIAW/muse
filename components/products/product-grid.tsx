import type { Product } from "@/types/database";
import { ProductCard } from "./product-card";

interface ProductGridProps {
  products: Product[];
  emptyMessage?: string;
}

export function ProductGrid({
  products,
  emptyMessage = "Aucun produit trouvé pour le moment.",
}: ProductGridProps) {
  if (products.length === 0) {
    return (
      <div className="rounded-2xl border border-dashed border-border bg-card/50 px-6 py-16 text-center">
        <p className="text-muted-foreground">{emptyMessage}</p>
      </div>
    );
  }

  return (
    <div className="grid grid-cols-1 gap-6 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4">
      {products.map((product) => (
        <ProductCard key={product.id} product={product} />
      ))}
    </div>
  );
}
