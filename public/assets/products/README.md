# Photos officielles MUSE (source locale)

**C'est ici que tu déposes tes visuels** sur ton Mac.

Ce dossier n'est pas toujours sur GitHub — c'est ta bibliothèque locale.

## Workflow

1. Mets tes photos ici : `public/assets/products/`
2. Lance :

```bash
cd ~/Documents/muse
npm run sync-product-photos
npm run prune-catalog
git add public/products/ data/products.json
git commit -m "Photos officielles MUSE"
git push origin main
```

3. Attends 1–2 min (Vercel)
4. Admin → `/admin/produits` → **nouvelles images** → tu décides de publier ou pas

## Règles

- Pas de sous-dossier
- Formats : `.png`, `.jpg`, `.webp`
- Les logos / images ChatGPT sont ignorés automatiquement à la copie
