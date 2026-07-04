import type { Metadata } from "next";
import { getSettings } from "@/lib/queries";

export const metadata: Metadata = {
  title: "À propos",
  description: "Découvrez MUSE — objets utiles, décoratifs et personnalisables en impression 3D.",
};

export default async function AboutPage() {
  const settings = await getSettings();

  const content =
    settings.about_content ||
    "MUSE est une marque d'objets utiles, décoratifs et personnalisables, pensés pour le quotidien, la maison, le bureau, les événements et les cadeaux. Les produits sont conçus pour être beaux, pratiques et facilement reproductibles en impression 3D.";

  return (
    <div className="muse-section">
      <div className="mx-auto max-w-3xl">
        <h1 className="muse-heading text-center">À propos de MUSE</h1>

        <div className="mt-10 space-y-6 text-base leading-relaxed text-muted-foreground">
          {content.split("\n\n").map((paragraph, i) => (
            <p key={i}>{paragraph}</p>
          ))}
        </div>

        <div className="mt-12 grid gap-6 sm:grid-cols-3">
          {[
            { title: "Impression 3D", desc: "Production avec Bambu Lab H2S et filaments premium." },
            { title: "Personnalisation", desc: "Chaque pièce peut être adaptée à vos envies." },
            { title: "Artisanat moderne", desc: "Design soigné, finitions premium, esprit africain contemporain." },
          ].map(({ title, desc }) => (
            <div
              key={title}
              className="rounded-xl border border-border bg-card p-5 text-center"
            >
              <h2 className="font-medium text-muse-charcoal">{title}</h2>
              <p className="mt-2 text-sm text-muted-foreground">{desc}</p>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}
