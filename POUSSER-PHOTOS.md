# Pousser tes photos officielles (Mac)

## Dossier source (ton Mac)

```
~/Documents/muse/public/assets/products/
```

**C'est ton dossier officiel.** Mets toutes tes photos ici.

Si ce dossier est vide mais que tu as déjà des visuels dans bovinia :

```bash
mkdir -p ~/Documents/muse/public/assets/products
cp ~/Downloads/bovinia/public/assets/products/* ~/Documents/muse/public/assets/products/
```

## Remplacer complètement GitHub (une fois)

Copie-colle tout ce bloc dans le Terminal :

```bash
cd ~/Documents/muse
git pull origin main

# Vérifie qu'il y a bien des photos dans la source AVANT de lancer le script
ls public/assets/products/*.png | head

npm run sync-product-photos
npm run prune-catalog

git add public/products/ data/products.json public/assets/products/
git commit -m "Photos officielles depuis assets/products"
git pull origin main --rebase
git push origin main
```

### Ce que ça fait

| Étape | Action |
|-------|--------|
| `sync-product-photos` | Recopie depuis `public/assets/products/` vers `public/products/` |
| `prune-catalog` | Retire du catalogue les produits dont la photo n'existe plus |
| `git push` | Envoie sur GitHub → Vercel redéploie |

### Sécurité

Si `public/assets/products/` est **vide**, le script **ne supprime rien** et s'arrête avec un message d'erreur. Tu ne perdras plus tes photos par accident.

## Demain : ajouter de nouvelles photos

1. Dépose les nouvelles images dans `public/assets/products/`
2. Relance :

```bash
cd ~/Documents/muse
npm run sync-product-photos
git add public/products/ public/assets/products/
git commit -m "Nouvelles photos"
git push origin main
```

3. Va sur **Admin → Produits**
4. Les **nouvelles** images apparaissent → tu cliques **Ajouter** seulement celles que tu veux publier

**Tu n'es pas obligée de tout publier d'un coup.**

## Pourquoi les univers sont vides sur le site ?

Les photos dans `public/products/` ne suffisent pas : il faut aussi des **produits publiés** dans `data/products.json` avec un `universe_id`.

- Si tu veux tout republier automatiquement avec univers + REF Mxx : `npm run import-photos`
- Si tu préfères choisir produit par produit : laisse le catalogue vide après sync, puis utilise l'admin

## Username / mot de passe Git

- Username : `PENDATHIAW`
- Password : ton **token GitHub** (`ghp_...`), pas ton mot de passe

**Important :** si un token a été affiché dans le Terminal, révoque-le sur GitHub → Settings → Developer settings → Personal access tokens, puis crée-en un nouveau.

## Si le push est trop gros

```bash
git config --global http.postBuffer 524288000
git push origin main
```
