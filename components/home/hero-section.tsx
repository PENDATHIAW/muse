import Link from "next/link";
import { ArrowRight, Printer, Palette, Home } from "lucide-react";
import { MuseLogo } from "@/components/logo";
import { Button } from "@/components/ui/button";

interface HeroSectionProps {
  title: string;
  subtitle: string;
  tagline: string;
}

export function HeroSection({ title, subtitle, tagline }: HeroSectionProps) {
  return (
    <section className="relative overflow-hidden">
      <div className="muse-section pb-8 pt-12 sm:pt-20">
        <div className="mx-auto max-w-3xl text-center">
          <MuseLogo size="lg" className="justify-center" />
          <p className="mt-6 text-sm uppercase tracking-[0.25em] text-muse-sage">
            {tagline}
          </p>
          <h1 className="mt-4 font-serif text-4xl leading-tight text-muse-charcoal sm:text-5xl lg:text-6xl">
            {title}
          </h1>
          <p className="muse-subheading mx-auto mt-6 max-w-2xl">{subtitle}</p>

          <div className="mt-10 flex flex-col items-center justify-center gap-4 sm:flex-row">
            <Button asChild size="lg">
              <Link href="/catalogue">
                Découvrir le catalogue
                <ArrowRight className="ml-2 h-4 w-4" />
              </Link>
            </Button>
            <Button asChild variant="outline" size="lg">
              <Link href="/personnalisation">Demander une personnalisation</Link>
            </Button>
          </div>
        </div>

        <div className="mx-auto mt-16 grid max-w-4xl gap-6 sm:grid-cols-3">
          {[
            { icon: Printer, label: "Impression 3D", desc: "Bambu Lab H2S" },
            { icon: Palette, label: "Personnalisation", desc: "Couleurs & motifs" },
            { icon: Home, label: "Objets du quotidien", desc: "Maison, bureau, événements" },
          ].map(({ icon: Icon, label, desc }) => (
            <div
              key={label}
              className="rounded-2xl border border-border/80 bg-card/80 p-6 text-center backdrop-blur-sm"
            >
              <div className="mx-auto mb-3 flex h-12 w-12 items-center justify-center rounded-full bg-muse-beige">
                <Icon className="h-5 w-5 text-muse-terracotta" />
              </div>
              <h3 className="font-medium text-muse-charcoal">{label}</h3>
              <p className="mt-1 text-sm text-muted-foreground">{desc}</p>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
