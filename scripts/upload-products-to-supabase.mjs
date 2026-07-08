#!/usr/bin/env node
/**
 * Upload en masse des images locales public/products/ vers Supabase Storage.
 * Puis remplace les URLs locales (/products/...) dans Supabase par les URLs publiques du bucket.
 *
 * Usage:
 *   npm run upload-photos-supabase
 */

import fs from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";
import { createClient } from "@supabase/supabase-js";

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const ROOT = path.join(__dirname, "..");
const PRODUCTS_DIR = path.join(ROOT, "public/products");
const BUCKET = process.env.SUPABASE_PRODUCT_BUCKET || "product-images";
const PREFIX = process.env.SUPABASE_PRODUCT_PREFIX || "catalog";

const MIME_TYPES = {
  ".jpg": "image/jpeg",
  ".jpeg": "image/jpeg",
  ".png": "image/png",
  ".webp": "image/webp",
  ".gif": "image/gif",
};

const IMAGE_EXT = new Set(Object.keys(MIME_TYPES));

function loadEnvFile(filename) {
  const fullPath = path.join(ROOT, filename);
  if (!fs.existsSync(fullPath)) return;

  const lines = fs.readFileSync(fullPath, "utf8").split("\n");
  for (const rawLine of lines) {
    const line = rawLine.trim();
    if (!line || line.startsWith("#")) continue;

    const match = line.match(/^(?:export\s+)?([A-Za-z_][A-Za-z0-9_]*)=(.*)$/);
    if (!match) continue;

    const key = match[1];
    let value = match[2].trim();
    if (
      (value.startsWith('"') && value.endsWith('"')) ||
      (value.startsWith("'") && value.endsWith("'"))
    ) {
      value = value.slice(1, -1);
    }

    if (!process.env[key]) {
      process.env[key] = value;
    }
  }
}

function scanProductImages(baseDir) {
  const files = [];

  function walk(currentDir) {
    for (const entry of fs.readdirSync(currentDir, { withFileTypes: true })) {
      if (entry.name.startsWith(".") || entry.name === "README.md") continue;

      const fullPath = path.join(currentDir, entry.name);
      if (entry.isDirectory()) {
        walk(fullPath);
        continue;
      }

      const ext = path.extname(entry.name).toLowerCase();
      if (!IMAGE_EXT.has(ext)) continue;

      const relativePath = path.relative(baseDir, fullPath).replace(/\\/g, "/");
      files.push({
        fullPath,
        relativePath,
        ext,
        localUrl: `/products/${relativePath}`,
        objectPath: `${PREFIX}/${relativePath}`,
      });
    }
  }

  if (fs.existsSync(baseDir)) {
    walk(baseDir);
  }

  return files.sort((a, b) => a.relativePath.localeCompare(b.relativePath));
}

async function ensureBucket(supabase) {
  const { data: buckets, error } = await supabase.storage.listBuckets();
  if (error) {
    throw new Error(`Impossible de lister les buckets: ${error.message}`);
  }

  if (buckets?.some((bucket) => bucket.id === BUCKET)) return;

  const { error: createError } = await supabase.storage.createBucket(BUCKET, {
    public: true,
    allowedMimeTypes: Object.values(MIME_TYPES),
    fileSizeLimit: 10 * 1024 * 1024,
  });

  if (createError) {
    throw new Error(
      `Impossible de créer le bucket "${BUCKET}": ${createError.message}`
    );
  }
}

async function uploadFiles(supabase, files) {
  const urlMap = new Map();
  let uploaded = 0;

  for (const file of files) {
    const contentType = MIME_TYPES[file.ext] || "application/octet-stream";
    const buffer = fs.readFileSync(file.fullPath);

    const { error: uploadError } = await supabase.storage
      .from(BUCKET)
      .upload(file.objectPath, buffer, { upsert: true, contentType });

    if (uploadError) {
      console.warn(`⚠ Upload échoué pour ${file.relativePath}: ${uploadError.message}`);
      continue;
    }

    const { data } = supabase.storage.from(BUCKET).getPublicUrl(file.objectPath);
    urlMap.set(file.localUrl, data.publicUrl);
    uploaded += 1;

    if (uploaded % 25 === 0 || uploaded === files.length) {
      console.log(`… ${uploaded}/${files.length} image(s) uploadée(s)`);
    }
  }

  return { urlMap, uploaded };
}

async function rewriteReferences(supabase, urlMap) {
  let rewiredImages = 0;
  let rewiredUniverses = 0;

  for (const [localUrl, publicUrl] of urlMap.entries()) {
    const { data: updatedImages, error: imageUpdateError } = await supabase
      .from("product_images")
      .update({ image_url: publicUrl })
      .eq("image_url", localUrl)
      .select("id");

    if (imageUpdateError) {
      console.warn(
        `⚠ Mise à jour product_images impossible (${localUrl}): ${imageUpdateError.message}`
      );
    } else {
      rewiredImages += updatedImages?.length ?? 0;
    }

    const { data: updatedUniverses, error: universeUpdateError } = await supabase
      .from("universes")
      .update({ cover_image_url: publicUrl })
      .eq("cover_image_url", localUrl)
      .select("id");

    if (universeUpdateError) {
      console.warn(
        `⚠ Mise à jour universes impossible (${localUrl}): ${universeUpdateError.message}`
      );
    } else {
      rewiredUniverses += updatedUniverses?.length ?? 0;
    }
  }

  return { rewiredImages, rewiredUniverses };
}

async function main() {
  loadEnvFile(".env.local");
  loadEnvFile(".env");

  const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL;
  const serviceRoleKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

  if (!supabaseUrl || !serviceRoleKey) {
    console.error(
      "Variables manquantes. Définissez NEXT_PUBLIC_SUPABASE_URL et SUPABASE_SERVICE_ROLE_KEY."
    );
    process.exit(1);
  }

  if (!fs.existsSync(PRODUCTS_DIR)) {
    console.error("Dossier introuvable: public/products");
    process.exit(1);
  }

  const files = scanProductImages(PRODUCTS_DIR);
  if (files.length === 0) {
    console.error("Aucune image trouvée dans public/products");
    process.exit(1);
  }

  console.log(`→ ${files.length} image(s) locale(s) détectée(s)`);

  const supabase = createClient(supabaseUrl, serviceRoleKey, {
    auth: { persistSession: false, autoRefreshToken: false },
  });

  await ensureBucket(supabase);
  const { urlMap, uploaded } = await uploadFiles(supabase, files);
  const { rewiredImages, rewiredUniverses } = await rewriteReferences(
    supabase,
    urlMap
  );

  console.log("");
  console.log("✅ Migration terminée");
  console.log(`- Uploads Supabase Storage: ${uploaded}/${files.length}`);
  console.log(`- product_images mis à jour: ${rewiredImages}`);
  console.log(`- universes.cover_image_url mis à jour: ${rewiredUniverses}`);
  console.log("");
  console.log(
    "Astuce: pour les nouveaux produits, utilisez /admin/produits/nouveau (upload direct Supabase)."
  );
}

main().catch((error) => {
  console.error("Erreur:", error instanceof Error ? error.message : String(error));
  process.exit(1);
});
