import { CheckCircle2 } from "lucide-react";

interface WhyMuseSectionProps {
  content: string;
}

const highlights = [
  "Conception soignée et finitions premium",
  "Impression 3D avec filaments de qualité",
  "Personnalisation complète (nom, couleur, logo...)",
  "Objets utiles pour maison, bureau et événements",
  "Artisanat moderne, production locale",
];

export function WhyMuseSection({ content }: WhyMuseSectionProps) {
  return (
    <section className="muse-section bg-muse-charcoal text-muse-ivory">
      <div className="grid gap-10 lg:grid-cols-2 lg:items-center">
        <div>
          <h2 className="font-serif text-3xl tracking-tight sm:text-4xl">
            Pourquoi MUSE ?
          </h2>
          <p className="mt-4 leading-relaxed text-muse-beige/90">{content}</p>
        </div>
        <ul className="space-y-4">
          {highlights.map((item) => (
            <li key={item} className="flex items-start gap-3">
              <CheckCircle2 className="mt-0.5 h-5 w-5 shrink-0 text-muse-terracotta" />
              <span className="text-muse-beige/90">{item}</span>
            </li>
          ))}
        </ul>
      </div>
    </section>
  );
}
