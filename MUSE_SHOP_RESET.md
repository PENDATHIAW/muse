# MUSE — Nouveau site boutique

Cette branche repart sur une version simple et propre du site :

- page d’accueil boutique
- catalogue automatique depuis `public/products`
- filtres par univers
- recherche produit
- panier simple
- commande WhatsApp
- design déco premium
- images affichées en entier, sans coupe forcée

## Lancer le site

```bash
npm install
npm run dev
```

Puis ouvre :

```txt
http://localhost:3000
```

## Mettre tes photos

Ajoute tes images dans :

```txt
public/products
```

Le site les scanne automatiquement.

## Numéro WhatsApp

Crée un fichier `.env.local` à la racine :

```txt
NEXT_PUBLIC_WHATSAPP_PHONE=221XXXXXXXXX
```

## Organisation conseillée des photos

```txt
public/products/
  entry/
  bathroom/
  kitchen/
  living/
  bedroom/
  kids/
  prayer/
  desk/
  vanity/
  decor/
```

Chaque image devient une fiche produit.
