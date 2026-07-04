import { HeroSection } from "@/components/home/hero-section";
import { UniversesSection } from "@/components/home/universes-section";
import { FeaturedProductsSection } from "@/components/home/featured-products";
import { WhyMuseSection } from "@/components/home/why-muse-section";
import { PersonalizationSection } from "@/components/home/personalization-section";
import { OrderSection } from "@/components/home/order-section";
import {
  getActiveUniverses,
  getFeaturedProducts,
  getSettings,
} from "@/lib/queries";

export const dynamic = "force-dynamic";

export default async function HomePage() {
  const [settings, universes, featuredProducts] = await Promise.all([
    getSettings(),
    getActiveUniverses(),
    getFeaturedProducts(8),
  ]);

  return (
    <>
      <HeroSection
        title={settings.hero_title || "Des objets utiles, beaux et personnalisables"}
        subtitle={
          settings.hero_subtitle ||
          "MUSE conçoit des objets premium en impression 3D pour votre quotidien."
        }
        tagline={
          settings.hero_tagline ||
          "Impression 3D · Personnalisation · Artisanat moderne"
        }
      />
      <UniversesSection universes={universes} />
      <FeaturedProductsSection products={featuredProducts} />
      <WhyMuseSection
        content={
          settings.why_muse ||
          "Chaque objet MUSE est conçu avec soin et personnalisable selon vos envies."
        }
      />
      <PersonalizationSection
        intro={
          settings.personalization_intro ||
          "Prénom, couleur, logo, date ou motif — nous adaptons chaque pièce."
        }
      />
      <OrderSection
        intro={
          settings.order_intro ||
          "Contactez-nous par formulaire ou WhatsApp pour commander."
        }
        whatsappPhone={settings.whatsapp_number || "221771234567"}
        whatsappMessage={
          settings.whatsapp_default_message ||
          "Bonjour MUSE, je souhaite en savoir plus sur vos objets."
        }
      />
    </>
  );
}
