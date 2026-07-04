import type { Metadata } from "next";
import { Palette, Type, Calendar, ImageIcon, Ruler, Sparkles } from "lucide-react";
import Link from "next/link";
import { Button } from "@/components/ui/button";
import { getSettings } from "@/lib/queries";

export const metadata: Metadata = {
  title: "Personnalisation",
  description: "Découvrez toutes les options de personnalisation MUSE pour vos objets.",
};

const options = [
  { icon: Type, title: "Prénom & nom", desc: "Gravez un prénom, un nom de famille ou un message." },
  { icon: ImageIcon, title: "Logo", desc: "Intégrez votre logo ou celui de MUSE en discret." },
  { icon: Calendar, title: "Date", desc: "Commémorez une naissance, un baptême ou un événement." },
  { icon: Palette, title: "Couleur & finition", desc: "Ivoire, sage, terracotta, moka, effet bois ou pierre." },
  { icon: Ruler, title: "Taille", desc: "Adaptez les dimensions à votre espace." },
  { icon: Sparkles, title: "Motif", desc: "Motifs décoratifs et touches personnelles." },
];

export default async function PersonalizationPage() {
  const settings = await getSettings();

  return (
    <div className="muse-section">
      <div className="mx-auto max-w-3xl text-center">
        <h1 className="muse-heading">Personnalisation</h1>
        <p className="muse-subheading mt-4">
          {settings.personalization_intro ||
            "Chaque objet MUSE peut être adapté à votre histoire, votre style et votre usage."}
        </p>
      </div>

      <div className="mx-auto mt-12 grid max-w-5xl gap-6 sm:grid-cols-2 lg:grid-cols-3">
        {options.map(({ icon: Icon, title, desc }) => (
          <div
            key={title}
            className="rounded-2xl border border-border bg-card p-6 muse-card-hover"
          >
            <div className="mb-4 flex h-12 w-12 items-center justify-center rounded-full bg-muse-beige">
              <Icon className="h-5 w-5 text-muse-terracotta" />
            </div>
            <h2 className="font-medium text-muse-charcoal">{title}</h2>
            <p className="mt-2 text-sm text-muted-foreground">{desc}</p>
          </div>
        ))}
      </div>

      <div className="mx-auto mt-12 max-w-2xl rounded-2xl border border-border bg-muse-beige/30 p-8 text-center">
        <h2 className="font-serif text-xl text-muse-charcoal">Usage événementiel ou personnel</h2>
        <p className="mt-3 text-sm text-muted-foreground">
          Mariages, baptêmes, cadeaux d&apos;entreprise, décoration intérieure ou
          accessoires du quotidien — nous adaptons chaque création à votre projet.
        </p>
        <Button asChild className="mt-6">
          <Link href="/contact">Demander une personnalisation</Link>
        </Button>
      </div>
    </div>
  );
}
