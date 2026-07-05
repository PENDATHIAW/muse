# Ajouter un modèle MUSE — workflow simple

## La bonne méthode (admin, sans SQL ni Git)

### 1. Connexion admin

Ouvrez **https://muse-pendathiaws-projects.vercel.app/admin/login**

Connectez-vous avec votre compte Supabase.

### 2. Ajouter un modèle

1. **Produits → Ajouter un modèle**
2. Saisissez le **nom** (ex. « Vide-poche Teranga — modèle 12 »)
3. Choisissez l'**univers** (Teranga, cuisine, bijoux, etc.)
4. Optionnel : chemin photo `/products/mon-fichier.png`
5. Cliquez **Publier sur le site**

**Automatique :**
- Prix de l'univers
- Description courte et longue
- Comment l'utiliser
- Ce qui nous a inspirés
- Où le poser
- Couleurs et options de personnalisation

Le produit apparaît **immédiatement** sur le site public.

### 3. Ajouter / modifier la photo

Sur la page d'édition du produit :
- **Uploader** une image (Supabase Storage), ou
- **Lier** un chemin déjà sur le site : `/products/mon-fichier.png`

---

## Première synchronisation (une seule fois)

Si le catalogue JSON (162 produits) n'est pas encore dans Supabase :

1. Supabase → **SQL Editor** → exécutez d'abord :

```sql
ALTER TABLE public.products
  ADD COLUMN IF NOT EXISTS usage TEXT NOT NULL DEFAULT '',
  ADD COLUMN IF NOT EXISTS inspiration TEXT NOT NULL DEFAULT '',
  ADD COLUMN IF NOT EXISTS placement TEXT NOT NULL DEFAULT '';
```

2. Admin → **Produits → Synchroniser le catalogue JSON**

Tous les produits du fichier `data/products.json` sont copiés dans Supabase.

---

## Ajouter une photo au projet (optionnel)

Si vous voulez héberger la photo sur le site Vercel :

1. Déposez le fichier dans `public/products/` (via GitHub ou votre ordinateur)
2. Dans l'admin, utilisez le chemin `/products/nom-du-fichier.png`

Ou uploadez directement dans l'admin (plus simple).

---

## Modifier les textes par univers

Les textes automatiques (prix, usage, inspiration…) sont dans :

```
data/universe-catalog.json
```

Chaque univers a son prix et ses 3 paragraphes. Après modification, les **nouveaux** produits utiliseront les textes mis à jour.

---

## Résumé

| Action | Où |
|--------|-----|
| Ajouter un modèle | `/admin/produits/nouveau` |
| Modifier prix / textes | `/admin/produits/{id}/edit` |
| Importer les 162 produits existants | Admin → Synchroniser le catalogue JSON |
| Textes automatiques par univers | `data/universe-catalog.json` |

**Plus besoin de** `import-from-photos.sql` pour le quotidien — réservé à l'import initial massif si besoin.
