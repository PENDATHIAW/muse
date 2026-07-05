import { Lightbulb, MapPin, Sparkles } from "lucide-react";
import type { Product } from "@/types/database";

interface ProductStoryProps {
  product: Product;
}

export function ProductStory({ product }: ProductStoryProps) {
  const sections = [
    {
      icon: Sparkles,
      title: "Comment l'utiliser",
      content: product.usage,
    },
    {
      icon: Lightbulb,
      title: "Ce qui nous a inspirés",
      content: product.inspiration,
    },
    {
      icon: MapPin,
      title: "Où le poser",
      content: product.placement,
    },
  ].filter((section) => section.content?.trim());

  if (sections.length === 0) return null;

  return (
    <section className="mt-16">
      <h2 className="muse-heading text-2xl">En savoir plus sur ce modèle</h2>
      <div className="mt-6 grid gap-4 md:grid-cols-3">
        {sections.map(({ icon: Icon, title, content }) => (
          <div
            key={title}
            className="rounded-2xl border border-border bg-card p-6"
          >
            <div className="mb-3 flex h-10 w-10 items-center justify-center rounded-full bg-muse-beige">
              <Icon className="h-5 w-5 text-muse-terracotta" />
            </div>
            <h3 className="font-medium text-muse-charcoal">{title}</h3>
            <p className="mt-2 text-sm leading-relaxed text-muted-foreground">
              {content}
            </p>
          </div>
        ))}
      </div>
    </section>
  );
}
