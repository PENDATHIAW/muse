# Visuels produits MUSE (GitHub)

Stockez vos photos ici — **pas besoin de Supabase Storage**.

## Structure recommandée

```
public/products/
  charge-guard-2-en-1/
    main.jpg          ← image principale
    2.jpg             ← galerie (optionnel)
  organisateur-mural-cuisine-drainage/
    main.jpg
  muse-kitchen/
    cover.jpg         ← couverture univers (optionnel)
```

Le nom du dossier doit correspondre au **slug** du produit (visible dans Admin → Produits).

## Workflow

1. **Ajoutez vos fichiers** dans ce dossier (localement ou via GitHub web)
2. **Commit + push** sur GitHub
3. Dans **Admin → Produits → [produit] → Images**, liez le chemin :
   - `/products/charge-guard-2-en-1/main.jpg`
4. Cochez « image principale » pour la photo de couverture

## Formats

- JPEG, PNG ou WebP
- Taille conseillée : 1200 × 1500 px (ratio 4:5)
- Poids : &lt; 500 Ko si possible (site plus rapide)

## Couvertures univers

Même principe — champ « URL image de couverture » dans Admin → Univers :

```
/products/muse-kitchen/cover.jpg
```

Ou dossier dédié :

```
public/univers/muse-kitchen/cover.jpg  →  /univers/muse-kitchen/cover.jpg
```

## Logo & PDF

| Fichier | Chemin |
|---------|--------|
| Logo | `public/logo-muse.png` |
| Catalogue | `public/catalogue_muse_2026.pdf` |
