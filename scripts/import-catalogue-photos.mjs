#!/usr/bin/env node
/**
 * Scanne public/catalogue-a-traiter/ ET public/products/
 * Génère data/products.json + supabase/import-from-photos.sql
 *
 * Optionnel : data/photo-universe-map.json pour forcer l'univers par fichier
 * Usage: npm run import-photos
 */

import fs from "fs";
import path from "path";
import { fileURLToPath } from "url";

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const ROOT = path.join(__dirname, "..");
const CATALOGUE_DIR = path.join(ROOT, "public/catalogue-a-traiter");
const PRODUCTS_DIR = path.join(ROOT, "public/products");
const MAP_FILE = path.join(ROOT, "data/photo-universe-map.json");
const PRODUCTS_JSON = path.join(ROOT, "data/products.json");
const UNIVERSES_JSON = path.join(ROOT, "data/universes.json");
const SQL_OUT = path.join(ROOT, "supabase/import-from-photos.sql");

const IMAGE_EXT = new Set([".jpg", ".jpeg", ".png", ".webp", ".gif"]);

/** Dossier produit existant → univers */
const PRODUCT_FOLDER_UNIVERSE = {
  "organisateur-mural-cuisine-drainage": "muse-kitchen",
  "pot-a-couverts-drainant": "muse-kitchen",
  "charge-guard-2-en-1": "muse-tech-charge-guard",
  "plaque-chez-les-diagne": "plaques-de-porte-chez-nous",
};

/** Mots-clés dans le nom de fichier → univers */
const KEYWORD_UNIVERSE = [
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
  ["tasbih", "support-tasbih-chapelet"],
  ["chapelet", "support-tasbih-chapelet"],
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

const UNIVERSE_DEFAULTS = {
  "plaques-de-porte-chez-nous": {
    price: 12000,
    material: "PLA mat, effet bois ou effet pierre",
    print_time: "4-5 heures",
    personalization: ["nom de famille", "prénom", "couleur", "finition"],
  },
  "boite-a-cles-murale": {
    price: 10000,
    material: "PLA+ ou PETG",
    print_time: "4-6 heures",
    personalization: ["nom", "couleur", "logo discret"],
  },
  "vide-poche-teranga": {
    price: 9000,
    material: "PLA mat ou effet pierre",
    print_time: "3-5 heures",
    personalization: ["mot Teranga", "couleur", "initiales"],
  },
  "support-telephone-vide-poche": {
    price: 11000,
    material: "PLA+ recommandé",
    print_time: "5-7 heures",
    personalization: ["couleur", "nom", "logo"],
  },
  "porte-moussor-foulards": {
    price: 10000,
    material: "PLA mat",
    print_time: "4-6 heures",
    personalization: ["couleur", "motif"],
  },
  "support-bijoux-coiffeuse": {
    price: 12000,
    material: "PLA mat ou effet bois",
    print_time: "5-8 heures",
    personalization: ["initiales", "couleur"],
  },
  "boite-a-bijoux": {
    price: 15000,
    material: "PLA mat, effet bois",
    print_time: "6-10 heures",
    personalization: ["prénom", "couleur", "finition premium"],
  },
  "support-tasbih-chapelet": {
    price: 8000,
    material: "PLA mat ou effet bois",
    print_time: "3-5 heures",
    personalization: ["couleur", "motif discret"],
  },
  "plaques-naissance-bapteme": {
    price: 10000,
    material: "PLA mat, effet bois",
    print_time: "4-6 heures",
    personalization: ["prénom", "date", "couleur"],
  },
  "supports-qr-paiement": {
    price: 7000,
    material: "PLA+ ou PETG",
    print_time: "2-4 heures",
    personalization: ["logo boutique", "couleur Wave/OM"],
  },
  "etiquettes-prix-boutiques": {
    price: 5000,
    material: "PLA mat",
    print_time: "1-2 heures",
    personalization: ["nom boutique", "couleur"],
  },
  "porte-cartes-flyers": {
    price: 8000,
    material: "PLA mat",
    print_time: "3-5 heures",
    personalization: ["logo", "couleur"],
  },
  "supports-parfum-thiouraye": {
    price: 9000,
    material: "PLA mat, finition décorative",
    print_time: "4-6 heures",
    personalization: ["couleur", "motif"],
  },
  "cache-pot-decoratif": {
    price: 11000,
    material: "PLA mat, effet terracotta",
    print_time: "6-8 heures",
    personalization: ["couleur", "motif", "taille"],
  },
  "mini-deco-murale-senegal": {
    price: 10000,
    material: "PLA mat multicolore",
    print_time: "4-7 heures",
    personalization: ["symbole", "couleur", "taille"],
  },
  "muse-tech-charge-guard": {
    price: 5000,
    material: "PLA+, PETG ou TPU",
    print_time: "2-3 heures",
    personalization: ["initiales", "couleur", "logo discret"],
  },
  "muse-kitchen": {
    price: 12000,
    material: "PETG ou ASA recommandé",
    print_time: "5-8 heures",
    personalization: ["couleur", "logo MUSE", "configuration"],
  },
};

const UNIVERSE_CONTENT = {
  "plaques-de-porte-chez-nous": {
    inspiration:
      "Inspirées des plaques de porte artisanales et de l'identité familiale sénégalaise — accueillir chez soi avec fierté.",
    usage:
      "Fixez la plaque sur votre porte d'entrée ou de chambre. Personnalisez avec le nom de famille, un prénom ou une courte phrase d'accueil.",
    placement:
      "Porte d'entrée principale, chambre d'amis, porte de bureau ou entrée de boutique.",
  },
  "boite-a-cles-murale": {
    inspiration:
      "Née du besoin de ne plus chercher ses clés en sortant — une entrée organisée, esthétique et fonctionnelle.",
    usage:
      "Accrochez la boîte près de la porte. Déposez clés, badges et petits objets en arrivant. Certains modèles incluent un crochet ou un vide-poche intégré.",
    placement:
      "Entrée, couloir, prise murale à hauteur de main (1,40 m environ).",
  },
  "vide-poche-teranga": {
    inspiration:
      "Inspiré par la Teranga sénégalaise : accueillir, ranger, et offrir un bel objet dès l'entrée de la maison.",
    usage:
      "Déposez clés, montre, bijoux, pièces ou lunettes au retour à la maison. Parfait comme petit cadeau d'accueil ou de table.",
    placement:
      "Console d'entrée, table de chevet, bureau, réception d'hôtel ou comptoir de boutique.",
  },
  "support-telephone-vide-poche": {
    inspiration:
      "Allier charge du téléphone et rangement du quotidien — un seul objet, deux fonctions.",
    usage:
      "Posez le téléphone en charge dans le support. Utilisez le vide-poche pour clés, écouteurs ou montre pendant la nuit.",
    placement:
      "Table de nuit, bureau, table de chevet, plan de travail cuisine ou entrée.",
  },
  "porte-moussor-foulards": {
    inspiration:
      "Inspiré des porte-foulards muraux discrets pour mettre en valeur moussors, écharpes et accessoires textiles.",
    usage:
      "Accrochez moussor, foulard ou petit sac. Garde les tissus visibles, ordonnés et à portée de main.",
    placement:
      "Chambre, dressing, entrée ou mur près du miroir.",
  },
  "support-bijoux-coiffeuse": {
    inspiration:
      "Pensé pour la coiffeuse : ranger bagues, colliers et boucles d'oreilles sans les mélanger.",
    usage:
      "Disposez bijoux par type sur les supports. Idéal pour préparer une tenue ou offrir un cadeau personnalisé.",
    placement:
      "Coiffeuse, salle de bain, table de chevet ou vitrine de boutique.",
  },
  "boite-a-bijoux": {
    inspiration:
      "Inspirée des boîtes à bijoux traditionnelles, réinterprétée en impression 3D avec finitions premium.",
    usage:
      "Rangez bijoux précieux ou du quotidien. Peut être personnalisée avec prénom, initiales ou couleur.",
    placement:
      "Coiffeuse, armoire, étagère chambre ou coffret cadeau.",
  },
  "support-tasbih-chapelet": {
    inspiration:
      "Respect et sobriété — un support dédié pour poser tasbih ou chapelet entre les moments de recueillement.",
    usage:
      "Posez le chapelet sur le support entre les prières ou séances de méditation. Protège des nœuds et de la poussière.",
    placement:
      "Bureau de prière, table de chevet, étagère discrète ou coin méditation.",
  },
  "plaques-naissance-bapteme": {
    inspiration:
      "Célébrer une naissance ou un baptême avec une pièce unique, personnalisée et durable.",
    usage:
      "Offrez ou exposez la plaque avec prénom, date et message. Peut compléter une chambre d'enfant ou un album de souvenirs.",
    placement:
      "Chambre bébé, mur du salon, étagère ou cadre sur commode.",
  },
  "supports-qr-paiement": {
    inspiration:
      "Faciliter les paiements Wave, Orange Money ou QR en boutique — visible, propre et professionnel.",
    usage:
      "Insérez ou affichez votre QR code. Placez le support sur le comptoir pour que le client scanne facilement.",
    placement:
      "Comptoir caisse, vitrine, table de marché ou réception.",
  },
  "etiquettes-prix-boutiques": {
    inspiration:
      "Des étiquettes lisibles et cohérentes avec l'identité visuelle de votre boutique.",
    usage:
      "Glissez ou fixez l'étiquette sur l'étagère ou le produit. Indiquez prix, taille ou promotion.",
    placement:
      "Étagères, présentoirs, comptoir ou vitrine.",
  },
  "porte-cartes-flyers": {
    inspiration:
      "Mettre en avant cartes de visite, flyers ou menus de façon ordonnée et élégante.",
    usage:
      "Insérez cartes ou flyers dans les fentes. Renouvelez le contenu selon vos campagnes ou événements.",
    placement:
      "Comptoir d'accueil, bureau, salon professionnel ou stand événementiel.",
  },
  "supports-parfum-thiouraye": {
    inspiration:
      "Inspiré des rituels de parfumage et de thiouraye — un support décoratif et pratique.",
    usage:
      "Posez le brûleur ou le flacon sur le support. Protège les surfaces et structure votre espace parfumé.",
    placement:
      "Salon, entrée, chambre ou espace d'accueil.",
  },
  "cache-pot-decoratif": {
    inspiration:
      "Allier plantes et décoration intérieure avec un cache-pot aux lignes modernes.",
    usage:
      "Placez votre pot ou plante directement dans le cache-pot. Facilite l'arrosage et habille la plante.",
    placement:
      "Salon, balcon, bureau, rebord de fenêtre ou terrasse.",
  },
  "mini-deco-murale-senegal": {
    inspiration:
      "Hommage aux symboles, couleurs et motifs du Sénégal — une touche culturelle et chaleureuse.",
    usage:
      "Accrochez ou posez la pièce comme élément décoratif. Peut être offerte en souvenir ou cadeau.",
    placement:
      "Mur du salon, entrée, chambre ou espace bureau.",
  },
  "muse-tech-charge-guard": {
    inspiration:
      "Née d'un besoin quotidien : ranger chargeur et câble proprement, sans nœuds ni chute.",
    usage:
      "Glissez le bloc chargeur dans le support, enroulez le câble. Garde la table de nuit ou le bureau ordonnés.",
    placement:
      "Table de chevet, bureau, table de salon ou plan de travail.",
  },
  "muse-kitchen": {
    inspiration:
      "Inspirée des cuisines organisées — libérer le plan de travail tout en gardant ustensiles à portée de main.",
    usage:
      "Fixez au mur ou posez sur le plan de travail. Rangez spatules, cuillères, éponges ou condiments selon le modèle.",
    placement:
      "Cuisine, crédence murale, plan de travail près de l'évier ou coin préparation.",
  },
};

function slugify(text) {
  return text
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "")
    .toLowerCase()
    .trim()
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/^-+|-+$/g, "");
}

function humanName(filename) {
  const base = path.basename(filename, path.extname(filename));
  return base
    .replace(/[-_]+/g, " ")
    .replace(/\b\w/g, (c) => c.toUpperCase())
    .trim();
}

function loadUniverseMap() {
  if (!fs.existsSync(MAP_FILE)) return {};
  try {
    return JSON.parse(fs.readFileSync(MAP_FILE, "utf8"));
  } catch {
    return {};
  }
}

function guessUniverse(relativePath, filename) {
  const manual = loadUniverseMap();
  const key = relativePath.replace(/\\/g, "/");
  const candidates = [
    key,
    filename,
    `/products/${key}`,
    `/products/${filename}`,
    `/catalogue-a-traiter/${key}`,
  ];
  for (const candidate of candidates) {
    if (manual[candidate]) return manual[candidate];
  }

  const parts = key.split("/").filter(Boolean);
  const folder = parts.length >= 2 ? parts[parts.length - 2] : parts[0];
  if (PRODUCT_FOLDER_UNIVERSE[folder]) return PRODUCT_FOLDER_UNIVERSE[folder];
  if (UNIVERSE_DEFAULTS[folder]) return folder;

  const haystack = key.toLowerCase();
  for (const [keyword, universe] of KEYWORD_UNIVERSE) {
    if (haystack.includes(keyword)) return universe;
  }

  return "a-classer";
}

function walkImages(baseDir, urlPrefix) {
  const results = [];
  if (!fs.existsSync(baseDir)) return results;

  function walk(currentDir) {
    for (const entry of fs.readdirSync(currentDir, { withFileTypes: true })) {
      if (entry.name.startsWith(".") || entry.name === "README.md") continue;
      const full = path.join(currentDir, entry.name);
      if (entry.isDirectory()) {
        walk(full);
        continue;
      }
      const ext = path.extname(entry.name).toLowerCase();
      if (!IMAGE_EXT.has(ext)) continue;

      const rel = path.relative(baseDir, full).replace(/\\/g, "/");
      const universeSlug =
        urlPrefix === "/catalogue-a-traiter"
          ? rel.includes("/")
            ? rel.split("/")[0]
            : "a-classer"
          : guessUniverse(rel, entry.name);

      results.push({
        universeSlug,
        filename: entry.name,
        imagePath: `${urlPrefix}/${rel}`,
        relativePath: rel,
      });
    }
  }

  walk(baseDir);
  return results;
}

function scanImages() {
  return [
    ...walkImages(CATALOGUE_DIR, "/catalogue-a-traiter"),
    ...walkImages(PRODUCTS_DIR, "/products"),
  ];
}

function buildProduct(image, universe, displayOrder) {
  const defaults = UNIVERSE_DEFAULTS[image.universeSlug] ?? {
    price: 10000,
    material: "PLA mat ou PETG",
    print_time: "4-6 heures",
    personalization: ["couleur", "personnalisation"],
  };
  const content = UNIVERSE_CONTENT[image.universeSlug] ?? {
    inspiration:
      "Conçu par MUSE pour allier utilité, esthétique et personnalisation au quotidien.",
    usage:
      "Utilisez cet objet selon vos besoins. Contactez-nous pour une variante sur mesure (couleur, texte, taille).",
    placement:
      "Entrée, salon, chambre, bureau ou espace commercial selon votre projet.",
  };

  const name = humanName(image.filename);
  const slug = slugify(path.basename(image.filename, path.extname(image.filename)));
  const universeName = universe?.name ?? image.universeSlug;

  return {
    id: slug,
    universe_id: image.universeSlug,
    name,
    slug,
    short_description: `${name} — objet personnalisable MUSE, univers « ${universeName} ».`,
    long_description: `${name} est conçu et imprimé en 3D par MUSE dans l'univers « ${universeName} ». Finitions soignées, matériaux adaptés à l'usage, personnalisation possible (couleur, texte, initiales).`,
    usage: content.usage,
    inspiration: content.inspiration,
    placement: content.placement,
    price: defaults.price,
    old_price: null,
    dimensions: "Sur mesure — indiquez vos contraintes lors de la commande",
    print_time: defaults.print_time,
    material: defaults.material,
    colors: ["ivoire", "sage", "terracotta", "moka", "noir mat"],
    finishes: ["mat"],
    personalization_options: defaults.personalization,
    stock_status: "available",
    status: "published",
    is_featured: displayOrder <= 2,
    display_order: displayOrder,
    tags: ["nouveauté", "personnalisable"],
    internal_note: `Import auto depuis ${image.imagePath}`,
    images: [
      {
        id: `${slug}-main`,
        image_url: image.imagePath,
        alt_text: `${name} MUSE`,
        is_main: true,
        display_order: 0,
      },
    ],
  };
}

function isValidProductImage(url) {
  return Boolean(url && /\/products\/[^/]+\.(png|jpe?g|webp|gif)$/i.test(url));
}

function updateUniverseCovers(products, universes) {
  const coverByUniverse = {};
  for (const product of products) {
    const img = product.images?.[0]?.image_url;
    if (!coverByUniverse[product.universe_id] && isValidProductImage(img)) {
      coverByUniverse[product.universe_id] = img;
    }
  }
  return universes.map((universe) => ({
    ...universe,
    cover_image_url: coverByUniverse[universe.slug] ?? null,
  }));
}

function cleanupProducts(products) {
  return products.map((product) => {
    const img = product.images?.[0]?.image_url ?? "";
    const hasBrokenDemoImage = img.includes("/main.jpg");
    const content = UNIVERSE_CONTENT[product.universe_id];

    return {
      ...product,
      is_featured: hasBrokenDemoImage ? false : product.is_featured,
      usage: product.usage ?? content?.usage,
      inspiration: product.inspiration ?? content?.inspiration,
      placement: product.placement ?? content?.placement,
    };
  });
}

function escapeSql(str) {
  return String(str).replace(/'/g, "''");
}

function generateSql(products) {
  const lines = [
    "-- Import automatique photos MUSE",
    "-- Exécutez dans Supabase → SQL Editor",
    "",
    "DO $$",
    "DECLARE",
    "  v_universe_id UUID;",
    "  v_product_id UUID;",
    "BEGIN",
  ];

  for (const p of products) {
    lines.push(`  -- ${p.name}`);
    lines.push(
      `  SELECT id INTO v_universe_id FROM public.universes WHERE slug = '${escapeSql(p.universe_id)}';`
    );
    lines.push(`  IF v_universe_id IS NOT NULL THEN`);
    lines.push(`    INSERT INTO public.products (`);
    lines.push(`      universe_id, name, slug, short_description, long_description,`);
    lines.push(`      price, dimensions, print_time, material, colors, finishes,`);
    lines.push(`      personalization_options, stock_status, status, is_featured, display_order, tags`);
    lines.push(`    ) VALUES (`);
    lines.push(`      v_universe_id,`);
    lines.push(`      '${escapeSql(p.name)}',`);
    lines.push(`      '${escapeSql(p.slug)}',`);
    lines.push(`      '${escapeSql(p.short_description)}',`);
    lines.push(`      '${escapeSql(p.long_description)}',`);
    lines.push(`      ${p.price},`);
    lines.push(`      '${escapeSql(p.dimensions)}',`);
    lines.push(`      '${escapeSql(p.print_time)}',`);
    lines.push(`      '${escapeSql(p.material)}',`);
    lines.push(`      '${JSON.stringify(p.colors)}'::jsonb,`);
    lines.push(`      '${JSON.stringify(p.finishes)}'::jsonb,`);
    lines.push(`      '${JSON.stringify(p.personalization_options)}'::jsonb,`);
    lines.push(`      'available', 'published', ${p.is_featured}, ${p.display_order},`);
    lines.push(`      '${JSON.stringify(p.tags)}'::jsonb`);
    lines.push(`    ) ON CONFLICT (slug) DO UPDATE SET`);
    lines.push(`      name = EXCLUDED.name,`);
    lines.push(`      short_description = EXCLUDED.short_description,`);
    lines.push(`      long_description = EXCLUDED.long_description,`);
    lines.push(`      price = EXCLUDED.price,`);
    lines.push(`      universe_id = EXCLUDED.universe_id`);
    lines.push(`    RETURNING id INTO v_product_id;`);
    lines.push(`    DELETE FROM public.product_images WHERE product_id = v_product_id;`);
    lines.push(`    INSERT INTO public.product_images (product_id, image_url, alt_text, is_main, display_order)`);
    lines.push(`    VALUES (v_product_id, '${escapeSql(p.images[0].image_url)}', '${escapeSql(p.images[0].alt_text)}', true, 0);`);
    lines.push(`  END IF;`);
    lines.push("");
  }

  lines.push("END $$;");
  return lines.join("\n");
}

function main() {
  const images = scanImages();

  if (images.length === 0) {
    console.log("Aucune photo trouvée.");
    console.log("Déposez vos images dans :");
    console.log("  public/products/           (n'importe où)");
    console.log("  public/catalogue-a-traiter/[univers]/");
    process.exit(0);
  }

  const universes = JSON.parse(fs.readFileSync(UNIVERSES_JSON, "utf8"));
  const universesBySlug = Object.fromEntries(universes.map((u) => [u.slug, u]));
  const existing = JSON.parse(fs.readFileSync(PRODUCTS_JSON, "utf8"));
  const existingSlugs = new Set(existing.map((p) => p.slug));

  const orderByUniverse = {};
  const importedProducts = [];

  for (const image of images) {
    if (image.universeSlug === "a-classer") {
      console.warn(`⚠ À classer : ${image.imagePath}`);
      continue;
    }
    if (!universesBySlug[image.universeSlug]) {
      console.warn(`⚠ Univers inconnu pour ${image.imagePath}`);
      continue;
    }

    orderByUniverse[image.universeSlug] = (orderByUniverse[image.universeSlug] ?? 0) + 1;
    const product = buildProduct(
      image,
      universesBySlug[image.universeSlug],
      orderByUniverse[image.universeSlug]
    );

    if (existingSlugs.has(product.slug)) {
      const idx = existing.findIndex((p) => p.slug === product.slug);
      existing[idx] = { ...existing[idx], ...product, id: existing[idx].id };
      console.log(`↻ ${product.name} → ${image.universeSlug}`);
    } else {
      existing.push(product);
      existingSlugs.add(product.slug);
      console.log(`+ ${product.name} → ${image.universeSlug}`);
    }
    importedProducts.push(product);
  }

  fs.writeFileSync(PRODUCTS_JSON, JSON.stringify(cleanupProducts(existing), null, 2) + "\n");
  fs.writeFileSync(
    UNIVERSES_JSON,
    JSON.stringify(updateUniverseCovers(existing, universes), null, 2) + "\n"
  );
  fs.writeFileSync(SQL_OUT, generateSql(cleanupProducts(existing)));

  console.log(`\n✓ ${images.length} photo(s) scannée(s), ${importedProducts.length} produit(s) généré(s)`);
  console.log(`✓ data/products.json mis à jour`);
  console.log(`✓ data/universes.json — couvertures mises à jour`);
  console.log(`✓ supabase/import-from-photos.sql → exécutez dans Supabase SQL Editor`);
}

main();
