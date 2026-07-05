import catalog from "@/data/universe-catalog.json";

export type UniverseCatalogEntry = {
  price: number;
  material: string;
  print_time: string;
  personalization: string[];
  inspiration: string;
  usage: string;
  placement: string;
};

const ENTRIES = catalog as Record<string, UniverseCatalogEntry>;

const FALLBACK: UniverseCatalogEntry = {
  price: 10000,
  material: "PLA mat ou PETG",
  print_time: "4-6 heures",
  personalization: ["couleur", "personnalisation"],
  inspiration:
    "Conçu par MUSE pour allier utilité, esthétique et personnalisation au quotidien.",
  usage:
    "Utilisez cet objet selon vos besoins. Contactez-nous pour une variante sur mesure.",
  placement: "Entrée, salon, chambre, bureau ou espace commercial selon votre projet.",
};

export function getUniverseCatalogEntry(universeSlug: string): UniverseCatalogEntry {
  return ENTRIES[universeSlug] ?? FALLBACK;
}

export function buildProductFieldsFromUniverse(
  productName: string,
  universeSlug: string,
  universeName: string
) {
  const entry = getUniverseCatalogEntry(universeSlug);

  return {
    short_description: `${productName} — objet personnalisable MUSE, univers « ${universeName} ».`,
    long_description: `${productName} est conçu et imprimé en 3D par MUSE dans l'univers « ${universeName} ». Finitions soignées, matériaux adaptés à l'usage, personnalisation possible (couleur, texte, initiales).`,
    price: entry.price,
    dimensions: "Sur mesure — indiquez vos contraintes lors de la commande",
    print_time: entry.print_time,
    material: entry.material,
    colors: ["ivoire", "sage", "terracotta", "moka", "noir mat"],
    finishes: ["mat"],
    personalization_options: entry.personalization,
    usage: entry.usage,
    inspiration: entry.inspiration,
    placement: entry.placement,
    tags: ["nouveauté", "personnalisable"],
  };
}
