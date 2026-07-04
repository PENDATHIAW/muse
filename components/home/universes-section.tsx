import Link from "next/link";
import Image from "next/image";
import { ArrowRight } from "lucide-react";
import type { Universe } from "@/types/database";

interface UniversesSectionProps {
  universes: Universe[];
}

export function UniversesSection({ universes }: UniversesSectionProps) {
  return (
    <section className="muse-section bg-muse-beige/20">
      <div className="mb-10 text-center">
        <h2 className="muse-heading">Nos univers</h2>
        <p className="muse-subheading mx-auto mt-3 max-w-2xl">
          Explorez nos collections d&apos;objets personnalisables, du quotidien à
          l&apos;événementiel.
        </p>
      </div>

      <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4">
        {universes.map((universe) => (
          <Link
            key={universe.id}
            href={`/univers/${universe.slug}`}
            className="group overflow-hidden rounded-2xl border border-border bg-card muse-card-hover"
          >
            <div className="relative aspect-[3/2] bg-gradient-to-br from-muse-sand/40 to-muse-beige">
              {universe.cover_image_url ? (
                <Image
                  src={universe.cover_image_url}
                  alt={universe.name}
                  fill
                  className="object-cover transition-transform duration-500 group-hover:scale-105"
                  sizes="(max-width: 768px) 100vw, 25vw"
                />
              ) : (
                <div className="flex h-full items-center justify-center">
                  <span className="font-serif text-lg tracking-[0.2em] text-muse-moka/30">
                    MUSE
                  </span>
                </div>
              )}
            </div>
            <div className="p-4">
              <h3 className="font-medium text-muse-charcoal group-hover:text-primary">
                {universe.name}
              </h3>
              <p className="mt-1 text-sm text-muted-foreground line-clamp-2">
                {universe.description}
              </p>
            </div>
          </Link>
        ))}
      </div>

      <div className="mt-8 text-center">
        <Link
          href="/catalogue"
          className="inline-flex items-center text-sm font-medium text-primary hover:underline"
        >
          Voir tout le catalogue
          <ArrowRight className="ml-1 h-4 w-4" />
        </Link>
      </div>
    </section>
  );
}
