import catalog from "@/data/universe-catalog.json";
import copyData from "@/data/muse-product-copy.json";

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
const TYPE_LABELS = copyData.typeLabels as Record<string, string>;
const COPY = copyData.copy as Record<
  string,
  { shorts: string[]; longs: string[] }
>;

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

function parseRefNumber(productName: string): number {
  const match = productName.match(/REF\s+M(\d+)/i);
  return match ? Number.parseInt(match[1], 10) : 1;
}

function buildCopyFromName(productName: string, universeSlug: string) {
  const templates = COPY[universeSlug] ?? COPY._default;
  const refNum = parseRefNumber(productName);
  const idx = (refNum - 1) % templates.shorts.length;

  return {
    short_description: templates.shorts[idx].replaceAll("{ref}", productName),
    long_description: templates.longs[idx]
      .replaceAll("{ref}", productName)
      .replaceAll("{num}", String(refNum)),
  };
}

export function getUniverseCatalogEntry(universeSlug: string): UniverseCatalogEntry {
  return ENTRIES[universeSlug] ?? FALLBACK;
}

export function getUniverseTypeLabel(universeSlug: string): string {
  return TYPE_LABELS[universeSlug] ?? "OBJET MUSE";
}

export function buildProductNameFromRef(universeSlug: string, refNum: number): string {
  const type = getUniverseTypeLabel(universeSlug);
  return `${type} REF M${String(refNum).padStart(2, "0")}`;
}

export function buildProductFieldsFromUniverse(
  productName: string,
  universeSlug: string,
  _universeName: string
) {
  const entry = getUniverseCatalogEntry(universeSlug);
  const copy = buildCopyFromName(productName, universeSlug);

  return {
    short_description: copy.short_description,
    long_description: copy.long_description,
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
