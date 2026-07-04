# MUSE — Site catalogue e-commerce

Site premium pour la marque **MUSE**, objets personnalisables conçus en impression 3D (Bambu Lab H2S).

## Stack

- **Next.js 16** (App Router) + TypeScript
- **Tailwind CSS** + shadcn/ui
- **Supabase** (Auth + PostgreSQL uniquement — pas de Storage requis)

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
#
# Note plan Free : si vous avez déjà 2 projets Supabase, réutilisez
# un projet existant (ajoutez les tables MUSE dedans) — pas besoin d'en créer un 3e.

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
- CRUD complet sans toucher au code
- **Visuels via GitHub** (`public/products/`) — voir ci-dessous

## Visuels produits (GitHub — recommandé)

Pas besoin de Supabase Storage ni de plan payant.

1. Ajoutez vos photos dans `public/products/[slug-du-produit]/main.jpg`
2. **Commit + push** sur GitHub
3. Admin → Produit → **Images** → liez le chemin : `/products/[slug]/main.jpg`
4. Cochez « image principale »

Détail : `public/products/README.md`

## Ajouter un produit

1. Connectez-vous à `/admin`
2. **Produits → Ajouter**
3. Remplissez les champs et choisissez **Publié** ou **Brouillon**
4. Ajoutez les images (GitHub + liaison dans l'admin)
5. Définissez l'image principale

## Lier une image produit

1. Placez le fichier : `public/products/mon-produit/main.jpg`
2. Poussez sur GitHub
3. Admin → **Produits → [produit] → Images**
4. Chemin : `/products/mon-produit/main.jpg` → **Lier cette image**

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
