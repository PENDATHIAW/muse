# Catalogue MUSE — sans Supabase

Tout le contenu du site est ici. Modifiez ces fichiers sur **GitHub** puis le site se met à jour automatiquement (Vercel redéploie).

## Fichiers

| Fichier | Contenu |
|---------|---------|
| `settings.json` | Textes accueil, WhatsApp, contact, à propos |
| `universes.json` | Liste des univers (nom, description, couverture) |
| `products.json` | Produits (prix, descriptions, images, tags…) |

## Ajouter un produit

1. Copiez un bloc existant dans `products.json`
2. Changez `slug`, `name`, `price`, etc.
3. Ajoutez `"universe_id"` (slug de l'univers)
4. Dans `"images"`, mettez le chemin : `/products/mon-slug/main.jpg`
5. Uploadez la photo dans `public/products/mon-slug/main.jpg`
6. Commit + push GitHub

## Ajouter une photo à un produit existant

1. Uploadez `public/products/[slug]/main.jpg` sur GitHub
2. Vérifiez que `products.json` contient bien ce chemin dans `"images"`
3. Push → le site affiche la photo

## Ajouter un univers

Ajoutez une entrée dans `universes.json` avec un `slug` unique.

## Statut produit

- `"status": "published"` → visible sur le site
- `"status": "draft"` → masqué (brouillon)

## Admin web

`/admin` affiche le catalogue en lecture seule.  
Mot de passe : variable `ADMIN_PASSWORD` sur Vercel (ou `muse2026` en local).

Pour modifier : éditez directement ces fichiers JSON sur GitHub.
