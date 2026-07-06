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

## Ajouter des photos depuis votre ordinateur (recommandé pour beaucoup d'images)

**Pas de sous-dossier** : mettez toutes les photos directement dans `public/products/` à la racine.

### Étapes

1. Copiez vos fichiers `.png` / `.jpg` dans `public/products/`
2. Poussez vers GitHub (voir section « GitHub demande un mot de passe » ci-dessous)
3. Le site se met à jour automatiquement sur Vercel

Pour classer automatiquement un visuel Salaah (tasbih, natte, coin prière), ajoutez une ligne dans `data/product-type-map.json` :

```json
"/products/mon-fichier.png": "RANGE NATTE"
```

Types possibles : `SUPPORT TASBIH`, `RANGE NATTE`, `COIN PRIÈRE`, `NATTE DE PRIÈRE`.

Puis lancez `npm run import-photos` (ou demandez à l'agent de le faire) pour régénérer le catalogue.

---

## GitHub demande un mot de passe ?

GitHub **n'accepte plus** le mot de passe du compte pour `git push`. Utilisez un **token** (PAT) ou **SSH**.

### Option A — Token (le plus simple)

1. GitHub → **Settings** → **Developer settings** → **Personal access tokens** → **Tokens (classic)**
2. **Generate new token (classic)** — cochez au minimum `repo`
3. Copiez le token (il ne s'affiche qu'une fois)

Sur votre Mac/PC, dans le dossier du projet :

```bash
git add public/products/
git commit -m "Ajout photos produits"
git push origin main
```

Quand Git demande :
- **Username** : votre identifiant GitHub (ex. `PENDATHIAW`)
- **Password** : collez le **token**, pas votre mot de passe GitHub

Pour ne pas retaper le token à chaque fois (macOS) :

```bash
git config --global credential.helper osxkeychain
```

### Option B — SSH

1. Générez une clé : `ssh-keygen -t ed25519 -C "votre@email.com"`
2. Ajoutez la clé publique (`~/.ssh/id_ed25519.pub`) dans GitHub → **Settings** → **SSH keys**
3. Changez l'URL du dépôt :

```bash
git remote set-url origin git@github.com:PENDATHIAW/muse.git
git push origin main
```

### Alternative sans Git : upload GitHub web

1. Ouvrez https://github.com/PENDATHIAW/muse/tree/main/public/products
2. **Add file** → **Upload files**
3. Glissez vos photos → **Commit changes**

Vercel redéploie le site en quelques minutes.

---

## Upload admin ne fonctionne pas ?

L'upload dans `/admin/produits/nouveau` envoie les images vers **Supabase Storage** (pas vers `public/products/` sur Vercel).

Vérifiez sur [Supabase Dashboard](https://supabase.com/dashboard) :

1. **Storage** → bucket `product-images` doit exister (public)
2. **Project Settings** → **API** → copiez la clé **service_role** (secrète)

Sur [Vercel](https://vercel.com) → projet **muse** → **Settings** → **Environment Variables** :

| Variable | Valeur |
|----------|--------|
| `SUPABASE_SERVICE_ROLE_KEY` | clé service_role Supabase |

Redéployez après avoir ajouté la variable.

**En attendant** : ajoutez les photos via GitHub (`public/products/`) — c'est la méthode la plus fiable pour un lot d'images.

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
