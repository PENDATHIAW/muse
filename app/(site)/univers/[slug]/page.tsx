import Image from "next/image";
import { notFound } from "next/navigation";
import type { Metadata } from "next";
import { ProductGrid } from "@/components/products/product-grid";
import { getPublishedProducts, getUniverseBySlug } from "@/lib/queries";

export const dynamic = "force-dynamic";

interface UniversePageProps {
  params: Promise<{ slug: string }>;
}

export async function generateMetadata({
  params,
}: UniversePageProps): Promise<Metadata> {
  const { slug } = await params;
  const universe = await getUniverseBySlug(slug);
  if (!universe) return { title: "Univers introuvable" };

  return {
    title: universe.name,
    description: universe.description,
    openGraph: {
      title: universe.name,
      description: universe.description,
      images: universe.cover_image_url ? [universe.cover_image_url] : [],
    },
  };
}

export default async function UniversePage({ params }: UniversePageProps) {
  const { slug } = await params;
  const universe = await getUniverseBySlug(slug);
  if (!universe) notFound();

  const products = await getPublishedProducts({ universeSlug: slug });

  return (
    <div>
      <div className="relative h-64 overflow-hidden bg-muse-beige sm:h-80">
        {universe.cover_image_url ? (
          <Image
            src={universe.cover_image_url}
            alt={universe.name}
            fill
            className="object-cover"
            priority
          />
        ) : (
          <div className="flex h-full items-center justify-center bg-gradient-to-br from-muse-sand/50 to-muse-beige">
            <span className="font-serif text-3xl tracking-[0.3em] text-muse-moka/30">
              MUSE
            </span>
          </div>
        )}
        <div className="absolute inset-0 bg-gradient-to-t from-muse-charcoal/60 to-transparent" />
        <div className="absolute bottom-0 left-0 right-0 p-6 sm:p-10">
          <div className="mx-auto max-w-7xl">
            <h1 className="font-serif text-3xl text-white sm:text-4xl">{universe.name}</h1>
            <p className="mt-2 max-w-2xl text-white/90">{universe.description}</p>
          </div>
        </div>
      </div>

      <div className="muse-section">
        <ProductGrid
          products={products}
          emptyMessage="Aucun produit publié dans cet univers pour le moment."
        />
      </div>
    </div>
  );
}
