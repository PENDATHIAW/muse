import fs from "node:fs";
import path from "node:path";

export type MuseProduct = {
  id: string;
  title: string;
  universe: string;
  universeLabel: string;
  image: string;
  fileName: string;
  color: string;
  finish: string;
  material: string;
  size: string;
  price: string;
  description: string;
};

export type MuseUniverse = {
  id: string;
  label: string;
  count: number;
  intro: string;
};

const PRODUCTS_DIR = path.join(process.cwd(), "public", "products");
const IMAGE_EXTENSIONS = new Set([".jpg", ".jpeg", ".png", ".webp", ".gif", ".avif"]);

const UNIVERSE_LABELS: Record<string, string> = {
  entry: "Entry",
  bathroom: "Bathroom",
  kitchen: "Kitchen",
  living: "Living",
  bedroom: "Bedroom",
  kids: "Kids",
  prayer: "Prayer & Nattes",
  desk: "MUSE Desk",
  vanity: "Vanity & Dressing",
  decor: "Décor & Gifts",
  corporate: "Corporate & Custom",
};

const UNIVERSE_INTROS: Record<string, string> = {
  entry: "Objets d’entrée pour chaussures, clés, courrier, parapluies et accueil.",
  bathroom: "Accessoires raffinés pour organiser la salle de bain sans perdre l’élégance.",
  kitchen: "Rangements utiles pour café, épices, évier, ustensiles et gestes du quotidien.",
  living: "Pièces décoratives et fonctionnelles pour sublimer le salon.",
  bedroom: "Organisation de chevet, bijoux, parfum, dressing et routine beauté.",
  kids: "Objets doux, pratiques et personnalisables pour chambres d’enfants.",
  prayer: "Supports pour nattes, Coran, duaa, tasbih, senteurs et coin prière.",
  desk: "Accessoires de bureau pour ranger, travailler et offrir en entreprise.",
  vanity: "Organisation beauté, bijoux, maquillage et dressing.",
  decor: "Objets cadeaux, vases, lampes, sculptures, plateaux et pièces signature.",
  corporate: "Objets personnalisés pour entreprises, hôtels, boutiques et événements.",
};

const COLORS: Record<string, string[]> = {
  entry: ["sable", "terracotta", "moka", "noir mat", "ivoire", "effet bois"],
  bathroom: ["pierre claire", "sage", "ivoire", "marbre clair", "sable", "blanc cassé"],
  kitchen: ["terracotta", "effet bois", "sage", "sable", "ivoire", "moka"],
  living: ["ivoire", "moka", "noir mat", "effet pierre", "silk champagne", "terracotta"],
  bedroom: ["blush", "champagne", "ivoire", "sage", "moka", "marbre clair"],
  kids: ["sage doux", "blush", "crème", "bleu grisé", "terracotta clair", "ivoire"],
  prayer: ["ivoire", "sage", "moka", "noir Kaaba", "effet bois", "sable"],
  desk: ["noir mat", "gris pierre", "ivoire", "sage", "moka", "terracotta"],
  vanity: ["blush", "champagne", "ivoire", "marbre", "moka", "sage"],
  decor: ["silk champagne", "terracotta", "effet pierre", "noir mat", "effet bois", "ivoire"],
  corporate: ["couleur marque", "noir mat", "ivoire", "orange", "vert", "gris pierre"],
};

const MATERIALS: Record<string, string[]> = {
  bathroom: ["PETG mat", "PETG effet pierre", "PETG marbre", "ASA mat"],
  kitchen: ["PETG mat", "PLA mat", "PLA bois", "PETG effet pierre"],
  prayer: ["PLA mat", "PLA bois", "PLA effet pierre", "PETG mat"],
  decor: ["PLA Silk", "PLA bois", "PLA marbre", "PLA mat"],
  living: ["PLA Silk", "PLA mat", "PLA bois", "PLA effet pierre"],
  default: ["PLA mat", "PETG mat", "PLA effet pierre", "PLA bois"],
};

const FINISHES = ["mat premium", "rainuré", "effet pierre", "effet bois", "silk", "marbre doux"];

function normalize(value: string) {
  return value
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "")
    .toLowerCase();
}

function walk(dir: string): string[] {
  if (!fs.existsSync(dir)) return [];
  const entries = fs.readdirSync(dir, { withFileTypes: true });
  const files: string[] = [];

  for (const entry of entries) {
    if (entry.name.startsWith(".")) continue;
    const fullPath = path.join(dir, entry.name);
    if (entry.isDirectory()) {
      files.push(...walk(fullPath));
      continue;
    }
    const ext = path.extname(entry.name).toLowerCase();
    if (IMAGE_EXTENSIONS.has(ext)) files.push(fullPath);
  }

  return files;
}

function guessUniverse(relative: string) {
  const text = normalize(relative);

  const checks: Array<[string, string[]]> = [
    ["prayer", ["priere", "prière", "prayer", "coran", "quran", "natte", "salat", "salaah", "tasbih", "duaa", "dua", "ramadan", "kaaba", "mihrab", "musc", "hijab", "abaya"]],
    ["bathroom", ["bath", "bain", "salle-de-bain", "douche", "savon", "rasoir", "coton", "qtip", "tooth", "dent", "serviette", "peignoir"]],
    ["kitchen", ["kitchen", "cuisine", "epice", "épice", "cafe", "coffee", "the", "tea", "evier", "évier", "ustensile", "fruit", "pain", "essuie", "capsule", "condiment"]],
    ["entry", ["entry", "entree", "entrée", "shoe", "chauss", "cle", "clé", "key", "parapluie", "courrier", "console", "valet", "accueil", "foyer"]],
    ["kids", ["kids", "enfant", "child", "jouet", "toy", "crayon", "nuage", "prenom", "prénom", "nounours", "cartable"]],
    ["desk", ["desk", "bureau", "document", "stylo", "post", "laptop", "ordinateur", "tablette", "cable", "câble", "souris", "casque"]],
    ["vanity", ["vanity", "maquillage", "makeup", "beauty", "bijou", "bijoux", "rouge", "bracelet", "collier", "peigne", "coiffeuse", "dressing"]],
    ["bedroom", ["bedroom", "chambre", "chevet", "lit", "montre", "parfum", "foulard", "moussor", "tiroir"]],
    ["living", ["living", "salon", "vase", "lampe", "lamp", "bougie", "bougeoir", "diffuseur", "telecommande", "tv", "revue", "cache-pot", "enceinte"]],
    ["corporate", ["corporate", "entreprise", "logo", "badge", "bureau-sonatel", "b2b", "hotel", "boutique"]],
    ["decor", ["decor", "deco", "décor", "cadeau", "gift", "sculpture", "baobab", "kora", "goree", "gorée", "wall", "mur", "panneau", "lanterne"]],
  ];

  for (const [universe, keywords] of checks) {
    if (keywords.some((keyword) => text.includes(normalize(keyword)))) return universe;
  }

  return "decor";
}

function titleCase(value: string) {
  return value
    .split(" ")
    .filter(Boolean)
    .map((word) => word.charAt(0).toUpperCase() + word.slice(1))
    .join(" ");
}

function cleanTitle(fileName: string, universe: string, index: number) {
  const base = path.basename(fileName, path.extname(fileName));
  const cleaned = base
    .replace(/^\d+[-_\s.]*/g, "")
    .replace(/muse/gi, "")
    .replace(/imagegen/gi, "")
    .replace(/page[-_\s]?\d+/gi, "")
    .replace(/[_-]+/g, " ")
    .replace(/\s+/g, " ")
    .trim();

  if (cleaned.length >= 4 && !/^\d+$/.test(cleaned)) return titleCase(cleaned);

  const fallback: Record<string, string[]> = {
    entry: ["Station d’entrée", "Plateau chaussures", "Porte-clés mural", "Valet d’accueil"],
    bathroom: ["Organisateur lavabo", "Porte-savon drainant", "Boîte coton", "Support rasoir"],
    kitchen: ["Station café", "Range-épices", "Organisateur évier", "Corbeille fruits"],
    living: ["Vase sculptural", "Plateau salon", "Cache-pot", "Photophore"],
    bedroom: ["Organisateur chevet", "Plateau bijoux", "Support parfum", "Rangement dressing"],
    kids: ["Rangement livres", "Organisateur crayons", "Boîte jouets", "Plaque prénom"],
    prayer: ["Station prière", "Support Coran", "Rangement nattes", "Porte-tasbih"],
    desk: ["Organisateur bureau", "Porte-documents", "Support téléphone", "Range-câbles"],
    vanity: ["Organisateur bijoux", "Plateau maquillage", "Support parfum", "Tour skincare"],
    decor: ["Objet décoratif", "Pièce signature", "Idée cadeau", "Décoration murale"],
    corporate: ["Cadeau entreprise", "Support logo", "Objet corporate", "Kit accueil"],
  };

  const list = fallback[universe] ?? fallback.decor;
  return `${list[index % list.length]} ${String(index + 1).padStart(2, "0")}`;
}

function productDescription(universe: string) {
  const descriptions: Record<string, string> = {
    entry: "Pensé pour garder l’entrée propre, belle et organisée.",
    bathroom: "Un accessoire élégant, facile à nettoyer et adapté aux zones humides.",
    kitchen: "Un rangement pratique pour simplifier les gestes du quotidien.",
    living: "Une pièce décorative qui reste utile et facile à placer.",
    bedroom: "Un objet doux pour organiser le chevet, la beauté ou le dressing.",
    kids: "Un rangement simple, arrondi et personnalisable pour les enfants.",
    prayer: "Un objet pour structurer le coin prière avec respect et élégance.",
    desk: "Un accessoire professionnel pour garder le bureau net et premium.",
    vanity: "Un rangement beauté pensé pour voir, trier et accéder vite aux essentiels.",
    decor: "Une proposition décorative MUSE, personnalisable en couleur et finition.",
    corporate: "Un objet personnalisable pour marque, accueil, événement ou cadeau client.",
  };
  return descriptions[universe] ?? descriptions.decor;
}

function productPrice(universe: string) {
  const prices: Record<string, string> = {
    entry: "à partir de 12 000 F CFA",
    bathroom: "à partir de 8 000 F CFA",
    kitchen: "à partir de 9 000 F CFA",
    living: "à partir de 15 000 F CFA",
    bedroom: "à partir de 9 000 F CFA",
    kids: "à partir de 8 000 F CFA",
    prayer: "à partir de 12 000 F CFA",
    desk: "à partir de 7 000 F CFA",
    vanity: "à partir de 9 000 F CFA",
    decor: "à partir de 15 000 F CFA",
    corporate: "sur devis",
  };
  return prices[universe] ?? "sur devis";
}

function sizeFor(universe: string) {
  if (["entry", "prayer", "living"].includes(universe)) return "format moyen ou modules simples";
  if (["bathroom", "desk", "vanity", "kids"].includes(universe)) return "petit/moyen format";
  return "format Bambu ou assemblage simple";
}

function pick<T>(items: T[], index: number): T {
  return items[index % items.length];
}

export function getLocalProducts(): MuseProduct[] {
  const files = walk(PRODUCTS_DIR).sort((a, b) => a.localeCompare(b));

  return files.map((absolutePath, index) => {
    const relativePublic = path.relative(path.join(process.cwd(), "public"), absolutePath).replace(/\\/g, "/");
    const relativeProducts = path.relative(PRODUCTS_DIR, absolutePath).replace(/\\/g, "/");
    const universe = guessUniverse(relativeProducts);
    const palette = COLORS[universe] ?? COLORS.decor;
    const materialList = MATERIALS[universe] ?? MATERIALS.default;

    return {
      id: `${universe}-${index}-${path.basename(absolutePath)}`,
      title: cleanTitle(relativeProducts, universe, index),
      universe,
      universeLabel: UNIVERSE_LABELS[universe] ?? "MUSE",
      image: encodeURI(`/${relativePublic}`),
      fileName: path.basename(absolutePath),
      color: pick(palette, index),
      finish: pick(FINISHES, index),
      material: pick(materialList, index),
      size: sizeFor(universe),
      price: productPrice(universe),
      description: productDescription(universe),
    };
  });
}

export function getMuseUniverses(products: MuseProduct[]): MuseUniverse[] {
  const order = ["entry", "bathroom", "kitchen", "living", "bedroom", "kids", "prayer", "desk", "vanity", "decor", "corporate"];
  const counts = new Map<string, number>();
  for (const product of products) counts.set(product.universe, (counts.get(product.universe) ?? 0) + 1);

  return order
    .filter((id) => counts.has(id))
    .map((id) => ({
      id,
      label: UNIVERSE_LABELS[id],
      count: counts.get(id) ?? 0,
      intro: UNIVERSE_INTROS[id],
    }));
}
