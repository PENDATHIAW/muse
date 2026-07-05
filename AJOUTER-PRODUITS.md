# Ajouter de nouveaux modèles MUSE

## Méthode simple (recommandée)

### 1. Déposer vos photos

Copiez vos fichiers image (`.png`, `.jpg`, `.webp`) dans :

```
public/products/
```

**Exemple :** `public/products/mon-nouveau-vide-poche.png`

### 2. Lancer l'import automatique

Dans le terminal, à la racine du projet :

```bash
npm run import-photos
```

Le script va :
- scanner `public/products/` et `public/catalogue-a-traiter/`
- deviner l'univers (cuisine, Teranga, bijoux, etc.)
- créer ou mettre à jour `data/products.json`
- générer `supabase/import-from-photos.sql`
- mettre à jour les couvertures des univers

### 3. Pousser sur GitHub

```bash
git add public/products/ data/products.json data/universes.json supabase/import-from-photos.sql
git commit -m "catalogue: ajout de nouveaux modèles"
git push
```

Vercel redéploie automatiquement — les produits apparaissent en ligne en quelques minutes.

---

## Forcer l'univers d'une photo

Si une photo est classée dans le mauvais univers, éditez `data/photo-universe-map.json` :

```json
{
  "mon-fichier.png": "vide-poche-teranga"
}
```

Puis relancez `npm run import-photos`.

---

## Classer par dossier

Vous pouvez aussi organiser ainsi :

```
public/catalogue-a-traiter/vide-poche-teranga/photo1.png
public/catalogue-a-traiter/muse-kitchen/photo2.png
```

---

## Enrichir les textes (description, usage, inspiration)

Les textes par univers sont dans :

```
scripts/import-catalogue-photos.mjs  →  UNIVERSE_CONTENT
```

Chaque produit reçoit automatiquement :
- **Comment l'utiliser**
- **Ce qui nous a inspirés**
- **Où le poser**

Pour un modèle spécifique, éditez directement `data/products.json` :

```json
{
  "slug": "mon-produit",
  "usage": "Déposez vos clés en rentrant...",
  "inspiration": "Inspiré par...",
  "placement": "Entrée, console..."
}
```

---

## Via l'admin (Supabase)

1. Connectez-vous : `/admin/login`
2. **Produits → Nouveau produit** pour ajouter manuellement
3. **Images** pour lier une photo à un produit

Pour synchroniser la base Supabase avec le catalogue JSON :

1. Supabase → **SQL Editor**
2. Exécutez d'abord `supabase/seed.sql` si les univers n'existent pas encore
3. Collez et exécutez **une partie à la fois** (recommandé) :
   - `supabase/import-from-photos-part-1.sql`
   - `supabase/import-from-photos-part-2.sql`
   - `supabase/import-from-photos-part-3.sql`
   - `supabase/import-from-photos-part-4.sql`

> Ne pas utiliser le fichier complet (5400 lignes) : Supabase peut tronquer le collage et provoquer l'erreur `INSERT has more target columns than expressions`.

---

## Résumé rapide

| Action | Où |
|--------|-----|
| Ajouter une photo | `public/products/` |
| Regénérer le catalogue | `npm run import-photos` |
| Forcer un univers | `data/photo-universe-map.json` |
| Textes par univers | `scripts/import-catalogue-photos.mjs` |
| Texte d'un produit | `data/products.json` |
| Admin en ligne | `/admin/produits` |
