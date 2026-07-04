import { Suspense } from "react";
import type { Metadata } from "next";
import { ProductFiltersBar } from "@/components/products/product-filters";
import { ProductGrid } from "@/components/products/product-grid";
import {
  getActiveUniverses,
  getAllColorsAndFinishes,
  getPublishedProducts,
} from "@/lib/queries";

export const metadata: Metadata = {
  title: "Catalogue",
  description: "Découvrez tous les objets MUSE — filtres par univers, prix, couleur et finition.",
};

export const dynamic = "force-dynamic";

interface CataloguePageProps {
  searchParams: Promise<{
    search?: string;
    universe?: string;
    minPrice?: string;
    maxPrice?: string;
    color?: string;
    finish?: string;
    sort?: string;
  }>;
}

export default async function CataloguePage({ searchParams }: CataloguePageProps) {
  const params = await searchParams;
  const [universes, { colors, finishes }] = await Promise.all([
    getActiveUniverses(),
    getAllColorsAndFinishes(),
  ]);

  const products = await getPublishedProducts({
    search: params.search,
    universeSlug: params.universe,
    minPrice: params.minPrice ? Number(params.minPrice) : undefined,
    maxPrice: params.maxPrice ? Number(params.maxPrice) : undefined,
    color: params.color,
    finish: params.finish,
    sort: (params.sort as "newest" | "price_asc" | "price_desc" | "popular") || "newest",
  });

  return (
    <div className="muse-section">
      <div className="mb-10">
        <h1 className="muse-heading">Catalogue</h1>
        <p className="muse-subheading mt-3">
          {products.length} objet{products.length !== 1 ? "s" : ""} disponible
          {products.length !== 1 ? "s" : ""}
        </p>
      </div>

      <Suspense fallback={<div className="mb-8 h-40 animate-pulse rounded-2xl bg-muted" />}>
        <ProductFiltersBar universes={universes} colors={colors} finishes={finishes} />
      </Suspense>

      <div className="mt-8">
        <ProductGrid products={products} />
      </div>
    </div>
  );
}
