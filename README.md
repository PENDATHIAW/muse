# MUSE — Site catalogue e-commerce

Site premium pour la marque **MUSE**, objets personnalisables conçus en impression 3D.

## Stack

- **Next.js 16** + TypeScript + Tailwind + shadcn/ui
- **Supabase** (Auth, PostgreSQL, Storage)
- **Visuels** : Supabase Storage ou fichiers dans `public/products/`

## Installation locale

```bash
git clone https://github.com/PENDATHIAW/muse.git
cd muse
npm install
cp .env.example .env.local
# Renseignez vos clés Supabase dans .env.local
npm run dev
```

Site : http://localhost:3000  
Admin : http://localhost:3000/admin/login (compte Supabase Auth)

## Variables d'environnement (Vercel)

| Variable | Description |
|----------|-------------|
| `NEXT_PUBLIC_SUPABASE_URL` | URL du projet Supabase |
| `NEXT_PUBLIC_SUPABASE_ANON_KEY` | Clé publique anon |
| `SUPABASE_SERVICE_ROLE_KEY` | Clé secrète service_role |
| `NEXT_PUBLIC_SITE_URL` | URL du site (ex. `https://muse-git-main-....vercel.app`) |

## Supabase — première configuration

1. Créez un projet sur [supabase.com](https://supabase.com)
2. **SQL Editor** → exécutez `supabase/migrations/20240704000000_initial_schema.sql`
3. **SQL Editor** → exécutez `supabase/seed.sql`
4. **Authentication → Users** → créez un utilisateur admin
5. Copiez les clés API dans Vercel → **Redeploy**

## Upload des images vers Supabase

### A) Nouveau workflow (recommandé, sans redéploiement)

1. Ouvrez `/admin/produits/nouveau`
2. Sélectionnez vos photos
3. Renseignez le prix (et optionnellement nom + univers)
4. Cliquez **Ajouter au site**

Les images sont envoyées directement dans le bucket Supabase `product-images`
et visibles immédiatement sur le catalogue.

### B) Migration en masse d'images locales existantes

Si vous avez déjà un stock dans `public/products/`, lancez en local :

```bash
npm run classify-photos
npm run upload-photos-supabase
```

Ce script :
- classe automatiquement les photos par univers (`data/photo-universe-map.json`) via analyse visuelle
- upload toutes les images locales vers Supabase Storage
- remplace les URL `/products/...` dans `product_images` (et couvertures univers) par les URL publiques Supabase

Variables nécessaires dans `.env.local` :
- `NEXT_PUBLIC_SUPABASE_URL`
- `SUPABASE_SERVICE_ROLE_KEY`

## Admin web (`/admin`)

- CRUD univers, produits, images, demandes, réglages
- Connexion avec email + mot de passe Supabase Auth

## Commandes clients

Pas de paiement en ligne. Les clients commandent via :
- Formulaire de contact (enregistré dans Supabase)
- Bouton WhatsApp direct

## Structure

```
supabase/       → migrations SQL + seed
data/           → catalogue JSON (secours / référence)
public/         → images statiques, logo, PDF
app/            → pages Next.js
components/     → UI MUSE
lib/            → Supabase, queries, actions
```
