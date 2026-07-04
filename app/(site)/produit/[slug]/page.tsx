import Link from "next/link";
import { notFound } from "next/navigation";
import type { Metadata } from "next";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Separator } from "@/components/ui/separator";
import { ProductGallery } from "@/components/products/product-gallery";
import { ProductGrid } from "@/components/products/product-grid";
import { InquiryForm } from "@/components/forms/inquiry-form";
import { AddToSelectionButton } from "@/components/products/add-to-selection-button";
import { WhatsAppButton } from "@/components/ui/whatsapp-button";
import {
  formatPrice,
  STOCK_STATUS_LABELS,
} from "@/lib/utils-muse";
import {
  getProductBySlug,
  getSimilarProducts,
  getSettings,
} from "@/lib/queries";

export const dynamic = "force-dynamic";

interface ProductPageProps {
  params: Promise<{ slug: string }>;
}

export async function generateMetadata({
  params,
}: ProductPageProps): Promise<Metadata> {
  const { slug } = await params;
  const product = await getProductBySlug(slug);
  if (!product) return { title: "Produit introuvable" };

  return {
    title: product.name,
    description: product.short_description,
    openGraph: {
      title: product.name,
      description: product.short_description,
    },
  };
}

export default async function ProductPage({ params }: ProductPageProps) {
  const { slug } = await params;
  const product = await getProductBySlug(slug);
  if (!product) notFound();

  const [similar, settings] = await Promise.all([
    getSimilarProducts(product),
    getSettings(),
  ]);

  const whatsappMessage = `Bonjour MUSE, je suis intéressé(e) par ce modèle : ${product.name}. Je souhaite avoir plus d'informations sur le prix, les couleurs et la personnalisation.`;

  return (
    <div className="muse-section">
      <div className="grid gap-10 lg:grid-cols-2">
        <ProductGallery images={product.images ?? []} productName={product.name} />

        <div>
          {product.universe && (
            <Link
              href={`/univers/${product.universe.slug}`}
              className="text-xs uppercase tracking-wider text-muted-foreground hover:text-primary"
            >
              {product.universe.name}
            </Link>
          )}
          <h1 className="mt-2 font-serif text-3xl text-muse-charcoal sm:text-4xl">
            {product.name}
          </h1>
          <p className="mt-3 text-muted-foreground">{product.short_description}</p>

          <div className="mt-4 flex items-baseline gap-3">
            <span className="text-2xl font-semibold text-muse-terracotta">
              {formatPrice(product.price)}
            </span>
            {product.old_price && (
              <span className="text-lg text-muted-foreground line-through">
                {formatPrice(product.old_price)}
              </span>
            )}
          </div>

          <Badge variant="secondary" className="mt-3">
            {STOCK_STATUS_LABELS[product.stock_status] || product.stock_status}
          </Badge>

          <Separator className="my-6" />

          <dl className="grid gap-3 text-sm sm:grid-cols-2">
            {product.dimensions && (
              <>
                <dt className="text-muted-foreground">Dimensions</dt>
                <dd>{product.dimensions}</dd>
              </>
            )}
            {product.print_time && (
              <>
                <dt className="text-muted-foreground">Temps d&apos;impression</dt>
                <dd>{product.print_time}</dd>
              </>
            )}
            {product.material && (
              <>
                <dt className="text-muted-foreground">Matière</dt>
                <dd>{product.material}</dd>
              </>
            )}
          </dl>

          {product.colors.length > 0 && (
            <div className="mt-4">
              <p className="mb-2 text-sm text-muted-foreground">Couleurs disponibles</p>
              <div className="flex flex-wrap gap-2">
                {product.colors.map((c) => (
                  <Badge key={c} variant="outline">{c}</Badge>
                ))}
              </div>
            </div>
          )}

          {product.finishes.length > 0 && (
            <div className="mt-4">
              <p className="mb-2 text-sm text-muted-foreground">Finitions</p>
              <div className="flex flex-wrap gap-2">
                {product.finishes.map((f) => (
                  <Badge key={f} variant="outline">{f}</Badge>
                ))}
              </div>
            </div>
          )}

          {product.personalization_options.length > 0 && (
            <div className="mt-4">
              <p className="mb-2 text-sm text-muted-foreground">Personnalisation</p>
              <div className="flex flex-wrap gap-2">
                {product.personalization_options.map((o) => (
                  <Badge key={o} className="bg-muse-sage text-white">{o}</Badge>
                ))}
              </div>
            </div>
          )}

          <div className="mt-8 flex flex-col gap-3 sm:flex-row sm:flex-wrap">
            <Button asChild>
              <a href="#demande">Demander ce modèle</a>
            </Button>
            <WhatsAppButton
              phone={settings.whatsapp_number || "221771234567"}
              message={whatsappMessage}
            />
            <AddToSelectionButton product={product} />
          </div>
        </div>
      </div>

      {product.long_description && (
        <section className="mt-16">
          <h2 className="muse-heading text-2xl">Description</h2>
          <div className="prose prose-neutral mt-4 max-w-3xl whitespace-pre-line text-muted-foreground">
            {product.long_description}
          </div>
        </section>
      )}

      <section id="demande" className="mt-16 rounded-2xl border border-border bg-card p-6 sm:p-8">
        <h2 className="font-serif text-2xl text-muse-charcoal">Demander ce modèle</h2>
        <p className="mt-2 text-sm text-muted-foreground">
          Remplissez le formulaire ci-dessous ou contactez-nous directement sur WhatsApp.
        </p>
        <div className="mt-6">
          <InquiryForm
            defaultProductId={product.id}
            defaultUniverseId={product.universe_id}
            defaultMessage={whatsappMessage}
          />
        </div>
      </section>

      {similar.length > 0 && (
        <section className="mt-16">
          <h2 className="muse-heading text-2xl">Produits similaires</h2>
          <div className="mt-6">
            <ProductGrid products={similar} />
          </div>
        </section>
      )}
    </div>
  );
}
