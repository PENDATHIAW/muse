import photoUniverseMap from "@/data/photo-universe-map.json";

const KEYWORD_UNIVERSE: Array<[string, string]> = [
  ["muse-kitchen", "muse-kitchen"],
  ["kitchen", "muse-kitchen"],
  ["cuisine", "muse-kitchen"],
  ["organisateur", "muse-kitchen"],
  ["couverts", "muse-kitchen"],
  ["drain", "muse-kitchen"],
  ["charge-guard", "muse-tech-charge-guard"],
  ["charge", "muse-tech-charge-guard"],
  ["chargeur", "muse-tech-charge-guard"],
  ["tech", "muse-tech-charge-guard"],
  ["plaque", "plaques-de-porte-chez-nous"],
  ["chez", "plaques-de-porte-chez-nous"],
  ["porte", "plaques-de-porte-chez-nous"],
  ["cles", "boite-a-cles-murale"],
  ["cle", "boite-a-cles-murale"],
  ["key", "boite-a-cles-murale"],
  ["teranga", "vide-poche-teranga"],
  ["vide-poche", "vide-poche-teranga"],
  ["moussor", "porte-moussor-foulards"],
  ["foulard", "porte-moussor-foulards"],
  ["bijoux", "boite-a-bijoux"],
  ["bijou", "support-bijoux-coiffeuse"],
  ["coiffeuse", "support-bijoux-coiffeuse"],
  ["tasbih", "salaah"],
  ["chapelet", "salaah"],
  ["salaah", "salaah"],
  ["salah", "salaah"],
  ["natte", "salaah"],
  ["priere", "salaah"],
  ["naissance", "plaques-naissance-bapteme"],
  ["bapteme", "plaques-naissance-bapteme"],
  ["baptême", "plaques-naissance-bapteme"],
  ["qr", "supports-qr-paiement"],
  ["wave", "supports-qr-paiement"],
  ["orange-money", "supports-qr-paiement"],
  ["etiquette", "etiquettes-prix-boutiques"],
  ["flyer", "porte-cartes-flyers"],
  ["carte", "porte-cartes-flyers"],
  ["thiouraye", "supports-parfum-thiouraye"],
  ["parfum", "supports-parfum-thiouraye"],
  ["cache-pot", "cache-pot-decoratif"],
  ["plante", "cache-pot-decoratif"],
  ["senegal", "mini-deco-murale-senegal"],
  ["deco", "mini-deco-murale-senegal"],
  ["telephone", "support-telephone-vide-poche"],
];

const MAP = photoUniverseMap as Record<string, string>;

export type PhotoAnalysis = {
  universeSlug: string | null;
  suggestedName: string;
  source: "map" | "keyword" | "filename" | "unknown";
};

function humanNameFromBase(base: string, universeLabel?: string): string {
  if (/^[0-9a-f-]{36}$/i.test(base)) {
    const short = base.slice(0, 8);
    return universeLabel
      ? `${universeLabel} — modèle ${short}`
      : `Modèle MUSE ${short}`;
  }

  return base
    .replace(/[-_]+/g, " ")
    .replace(/\b\w/g, (c) => c.toUpperCase())
    .trim();
}

export function guessUniverseSlugFromFilename(filename: string): {
  slug: string | null;
  source: PhotoAnalysis["source"];
} {
  const base = filename.replace(/\\/g, "/");
  const candidates = [
    `/products/${base}`,
    base,
    `/products/${base.split("/").pop() ?? base}`,
  ];

  for (const key of candidates) {
    const slug = MAP[key];
    if (slug && slug !== "_exclude") {
      return { slug, source: "map" };
    }
  }

  const haystack = base.toLowerCase();
  for (const [keyword, universe] of KEYWORD_UNIVERSE) {
    if (haystack.includes(keyword)) {
      return { slug: universe, source: "keyword" };
    }
  }

  return { slug: null, source: "unknown" };
}

export function analyzeProductPhoto(
  filename: string,
  universeNames: Record<string, string> = {}
): PhotoAnalysis {
  const base = filename.split("/").pop() ?? filename;
  const stem = base.replace(/\.[^.]+$/, "");
  const { slug, source } = guessUniverseSlugFromFilename(base);
  const universeLabel = slug ? universeNames[slug] : undefined;

  return {
    universeSlug: slug,
    suggestedName: humanNameFromBase(stem, universeLabel),
    source: slug ? source : "filename",
  };
}
