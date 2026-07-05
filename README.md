# MUSE — Site catalogue e-commerce

Site premium pour la marque **MUSE**, objets personnalisables conçus en impression 3D.

**Aucune base de données requise** — le catalogue vit dans des fichiers JSON sur GitHub, les visuels dans `public/`.

## Stack

- **Next.js 16** + TypeScript + Tailwind + shadcn/ui
- **Catalogue JSON** (`data/`) — pas de Supabase
- **Visuels GitHub** (`public/products/`)

## Installation locale

```bash
git clone https://github.com/PENDATHIAW/muse.git
cd muse
npm install
cp .env.example .env.local
npm run dev
```

Site : http://localhost:3000  
Admin : http://localhost:3000/admin/login (mot de passe : `muse2026`)

## Modifier le catalogue (sans coder)

| Action | Fichier GitHub |
|--------|----------------|
| Textes accueil, WhatsApp, contact | `data/settings.json` |
| Univers | `data/universes.json` |
| Produits (prix, descriptions…) | `data/products.json` |
| Photos produits | `public/products/[slug]/main.jpg` |
| Logo | `public/logo-muse.png` |
| Catalogue PDF | `public/catalogue_muse_2026.pdf` |

Guide détaillé : `data/README.md`

## Ajouter un produit

1. Éditez `data/products.json` sur GitHub (dupliquez un produit existant)
2. Uploadez la photo : `public/products/mon-slug/main.jpg`
3. Commit + push → Vercel redéploie → produit visible

## Ajouter une photo plus tard

1. Uploadez `public/products/[slug]/main.jpg`
2. Vérifiez le chemin dans `products.json` → `"images"`
3. Push GitHub

## Admin web (`/admin`)

- Consultation du catalogue
- Liens directs pour éditer sur GitHub
- Mot de passe : variable `ADMIN_PASSWORD` sur Vercel

## Déployer sur Vercel

1. Importez le repo GitHub
2. Variable optionnelle : `ADMIN_PASSWORD` (votre mot de passe admin)
3. Déployez — **aucune variable Supabase nécessaire**

## Commandes clients

Pas de paiement en ligne. Les clients commandent via :
- Formulaire de contact (message prérempli WhatsApp)
- Bouton WhatsApp direct

## Structure

```
data/           → catalogue JSON
public/         → images, logo, PDF
app/            → pages Next.js
components/     → UI MUSE
```
