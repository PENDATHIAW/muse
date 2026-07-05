#!/usr/bin/env node
/**
 * Scanne public/catalogue-a-traiter/ et génère :
 * - data/products.json (nouveaux produits)
 * - supabase/import-from-photos.sql (à exécuter dans Supabase SQL Editor)
 *
 * Usage: node scripts/import-catalogue-photos.mjs
 */

import fs from "fs";
import path from "path";
import { fileURLToPath } from "url";

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const ROOT = path.join(__dirname, "..");
const UPLOAD_DIR = path.join(ROOT, "public/catalogue-a-traiter");
const PRODUCTS_JSON = path.join(ROOT, "data/products.json");
const UNIVERSES_JSON = path.join(ROOT, "data/universes.json");
const SQL_OUT = path.join(ROOT, "supabase/import-from-photos.sql");

const IMAGE_EXT = new Set([".jpg", ".jpeg", ".png", ".webp", ".gif"]);

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

function scanImages() {
  const results = [];
  if (!fs.existsSync(UPLOAD_DIR)) return results;

  for (const entry of fs.readdirSync(UPLOAD_DIR, { withFileTypes: true })) {
    if (!entry.isDirectory() || entry.name.startsWith(".")) continue;

    const universeSlug = entry.name;
    const dir = path.join(UPLOAD_DIR, universeSlug);

    for (const file of fs.readdirSync(dir)) {
      const ext = path.extname(file).toLowerCase();
      if (!IMAGE_EXT.has(ext)) continue;
      results.push({
        universeSlug,
        filename: file,
        imagePath: `/catalogue-a-traiter/${universeSlug}/${file}`,
      });
    }
  }
  return results;
}

function buildProduct(image, universe, displayOrder) {
  const defaults = UNIVERSE_DEFAULTS[image.universeSlug] ?? {
    price: 10000,
    material: "PLA mat ou PETG",
    print_time: "4-6 heures",
    personalization: ["couleur", "personnalisation"],
  };

  const name = humanName(image.filename);
  const slug = slugify(path.basename(image.filename, path.extname(image.filename)));
  const universeName = universe?.name ?? image.universeSlug;

  return {
    id: slug,
    universe_id: image.universeSlug,
    name,
    slug,
    short_description: `${name} — collection MUSE, univers ${universeName}.`,
    long_description: `${name} conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l'univers « ${universeName} ». Qualité premium, finitions soignées.`,
    price: defaults.price,
    old_price: null,
    dimensions: "Sur mesure",
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

function escapeSql(str) {
  return String(str).replace(/'/g, "''");
}

function generateSql(products, universesBySlug) {
  const lines = [
    "-- Import automatique depuis public/catalogue-a-traiter/",
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
    lines.push(`      price = EXCLUDED.price`);
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
    console.log("Aucune photo trouvée dans public/catalogue-a-traiter/");
    console.log("Uploadez vos .jpg/.png dans un dossier univers, puis relancez.");
    process.exit(0);
  }

  const universes = JSON.parse(fs.readFileSync(UNIVERSES_JSON, "utf8"));
  const universesBySlug = Object.fromEntries(universes.map((u) => [u.slug, u]));
  const existing = JSON.parse(fs.readFileSync(PRODUCTS_JSON, "utf8"));
  const existingSlugs = new Set(existing.map((p) => p.slug));

  const orderByUniverse = {};
  const newProducts = [];

  for (const image of images) {
    if (image.universeSlug === "a-classer") {
      console.warn(`⚠ À classer manuellement : ${image.filename}`);
      continue;
    }
    if (!universesBySlug[image.universeSlug]) {
      console.warn(`⚠ Univers inconnu : ${image.universeSlug}/${image.filename}`);
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
      console.log(`↻ Mis à jour : ${product.name}`);
    } else {
      newProducts.push(product);
      existing.push(product);
      console.log(`+ Ajouté : ${product.name} → ${image.universeSlug}`);
    }
  }

  fs.writeFileSync(PRODUCTS_JSON, JSON.stringify(existing, null, 2) + "\n");

  const allImported = existing.filter((p) =>
    p.images?.some((img) => img.image_url?.startsWith("/catalogue-a-traiter/"))
  );
  fs.writeFileSync(SQL_OUT, generateSql(allImported, universesBySlug));

  console.log(`\n✓ ${images.length} photo(s) traitée(s)`);
  console.log(`✓ data/products.json mis à jour`);
  console.log(`✓ supabase/import-from-photos.sql généré → exécutez dans Supabase`);
}

main();
