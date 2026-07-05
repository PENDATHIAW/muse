import Link from "next/link";

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
            <Link
              href="/personnalisation"
              className="mt-6 inline-flex items-center justify-center rounded-lg bg-primary px-4 py-2 text-sm font-medium text-primary-foreground hover:bg-primary/90"
            >
              En savoir plus
            </Link>
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
