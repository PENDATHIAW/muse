# Pousser tes photos officielles (Mac)

## Dossier source (ton Mac)

```
~/Documents/muse/public/assets/products/
```

**C'est ton dossier officiel.** Mets toutes tes photos ici.

## Remplacer complètement GitHub (une fois)

Copie-colle tout ce bloc dans le Terminal :

```bash
cd ~/Documents/muse
git pull origin main

npm run sync-product-photos
npm run prune-catalog

git add public/products/ data/products.json public/assets/products/README.md
git commit -m "Photos officielles depuis assets/products"
git pull origin main --rebase
git push origin main
```

### Ce que ça fait

| Étape | Action |
|-------|--------|
| `sync-product-photos` | Vide `public/products/` sur GitHub et recopie depuis `public/assets/products/` |
| `prune-catalog` | Retire du catalogue les produits dont la photo n'existe plus |
| `git push` | Envoie sur GitHub → Vercel redéploie |

## Demain : ajouter de nouvelles photos

1. Dépose les nouvelles images dans `public/assets/products/`
2. Relance :

```bash
cd ~/Documents/muse
npm run sync-product-photos
git add public/products/
git commit -m "Nouvelles photos"
git push origin main
```

3. Va sur **Admin → Produits**
4. Les **nouvelles** images apparaissent → tu cliques **Ajouter** seulement celles que tu veux publier

**Tu n'es pas obligée de tout publier d'un coup.**

## Username / mot de passe Git

- Username : `PENDATHIAW`
- Password : ton **token GitHub** (`ghp_...`), pas ton mot de passe

## Si le push est trop gros

```bash
git config --global http.postBuffer 524288000
git push origin main
```
