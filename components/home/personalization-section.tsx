import Link from "next/link";
import { Button } from "@/components/ui/button";

const options = [
  "Prénom & nom de famille",
  "Logo & initiales",
  "Date & message",
  "Couleur & finition",
  "Taille & motif",
  "Usage événementiel ou personnel",
];

interface PersonalizationSectionProps {
  intro: string;
}

export function PersonalizationSection({ intro }: PersonalizationSectionProps) {
  return (
    <section className="muse-section">
      <div className="rounded-3xl border border-border bg-gradient-to-br from-card to-muse-beige/30 p-8 sm:p-12">
        <div className="grid gap-8 lg:grid-cols-2 lg:items-center">
          <div>
            <h2 className="muse-heading">Personnalisation</h2>
            <p className="muse-subheading mt-4">{intro}</p>
            <Button asChild className="mt-6">
              <Link href="/personnalisation">En savoir plus</Link>
            </Button>
          </div>
          <div className="grid grid-cols-2 gap-3">
            {options.map((opt) => (
              <div
                key={opt}
                className="rounded-xl border border-border/60 bg-background/80 px-4 py-3 text-sm text-muse-charcoal"
              >
                {opt}
              </div>
            ))}
          </div>
        </div>
      </div>
    </section>
  );
}
