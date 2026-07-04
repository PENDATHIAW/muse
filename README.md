# MUSE — Site catalogue e-commerce

Site premium pour la marque **MUSE**, objets personnalisables conçus en impression 3D (Bambu Lab H2S).

## Stack

- **Next.js 16** (App Router) + TypeScript
- **Tailwind CSS** + shadcn/ui
- **Supabase** (Auth, PostgreSQL, Storage)

## Installation

```bash
# 1. Cloner le dépôt
git clone <votre-repo>
cd muse

# 2. Installer les dépendances
npm install

# 3. Configurer les variables d'environnement
cp .env.example .env.local
# Éditez .env.local avec vos clés Supabase

# 4. Appliquer le schéma Supabase
# Dans le SQL Editor Supabase, exécutez dans l'ordre :
#   - supabase/migrations/20240704000000_initial_schema.sql
#   - supabase/seed.sql

# 5. Lancer le projet
npm run dev
```

Ouvrez [http://localhost:3000](http://localhost:3000).

## Variables Supabase (.env.local)

| Variable | Description |
|----------|-------------|
| `NEXT_PUBLIC_SUPABASE_URL` | URL du projet Supabase |
| `NEXT_PUBLIC_SUPABASE_ANON_KEY` | Clé publique (anon) |
| `SUPABASE_SERVICE_ROLE_KEY` | Clé service (optionnelle, server-only) |
| `NEXT_PUBLIC_SITE_URL` | URL du site (ex: `https://muse.sn`) |

## Créer le premier compte admin

1. Allez dans **Supabase Dashboard → Authentication → Users**
2. Cliquez **Add user → Create new user**
3. Entrez email + mot de passe
4. Connectez-vous sur `/admin/login`

> Seul un utilisateur authentifié Supabase peut accéder à l'admin (RLS activé).

## Structure du projet

```
app/
  (site)/          # Pages client (accueil, catalogue, produit...)
  admin/           # Interface administrateur
components/        # Composants UI MUSE
lib/               # Supabase, queries, actions
types/             # Types TypeScript
supabase/          # Migrations SQL + seed
public/            # Assets statiques (logo-muse.png)
```

## Pages client

- `/` — Accueil
- `/catalogue` — Catalogue avec filtres
- `/univers/[slug]` — Page univers
- `/produit/[slug]` — Fiche produit
- `/personnalisation` — Options de personnalisation
- `/contact` — Formulaire de commande
- `/a-propos` — À propos de MUSE

## Interface admin (`/admin`)

- Dashboard, Univers, Produits, Images, Demandes, Réglages
- CRUD complet sans toucher au code
- Upload images vers Supabase Storage (`product-images`)

## Ajouter un produit

1. Connectez-vous à `/admin`
2. **Produits → Ajouter**
3. Remplissez les champs et choisissez **Publié** ou **Brouillon**
4. Après création, uploadez les images sur la page d'édition
5. Définissez l'image principale

## Uploader une image

1. Éditez un produit (`/admin/produits/[id]/edit`)
2. Section **Images du produit**
3. Choisissez un fichier (JPEG, PNG, WebP)
4. L'image est stockée dans le bucket `product-images`

## Logo

Remplacez facilement le logo en ajoutant :

`public/logo-muse.png`

Sans ce fichier, le texte **MUSE** s'affiche automatiquement.

## Publier le site

### Vercel (recommandé)

1. Poussez le code sur GitHub
2. Importez le projet sur [vercel.com](https://vercel.com)
3. Ajoutez les variables d'environnement Supabase
4. Déployez

### Build local

```bash
npm run build
npm start
```

## Sécurité

- RLS activé sur toutes les tables
- Visiteurs : lecture produits publiés + création de demandes
- Admin authentifié : accès complet CRUD

## Seed inclus

- 17 univers produits
- 4 produits exemples (Kitchen, Tech, Plaques de porte)
- Réglages par défaut (WhatsApp, textes accueil...)
