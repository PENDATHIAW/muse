import Link from "next/link";
import { ArrowRight } from "lucide-react";
import { ProductGrid } from "@/components/products/product-grid";
import type { Product } from "@/types/database";

interface FeaturedProductsProps {
  products: Product[];
}

export function FeaturedProductsSection({ products }: FeaturedProductsProps) {
  return (
    <section className="muse-section">
      <div className="mb-10 flex flex-col items-start justify-between gap-4 sm:flex-row sm:items-end">
        <div>
          <h2 className="muse-heading">Objets populaires</h2>
          <p className="muse-subheading mt-3">
            Nos créations les plus appréciées, prêtes à être personnalisées.
          </p>
        </div>
        <Link
          href="/catalogue"
          className="inline-flex items-center text-sm font-medium text-primary hover:underline"
        >
          Tout voir
          <ArrowRight className="ml-1 h-4 w-4" />
        </Link>
      </div>
      <ProductGrid products={products} />
    </section>
  );
}
