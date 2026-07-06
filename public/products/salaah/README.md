# Univers Salaah — déposez vos photos ici

Placez vos visuels **supports tasbih**, **nattes de prière**, **ranges nattes**, **coins prière** dans ce dossier :

```
public/products/salaah/
```

Puis lancez :

```bash
npm run import-photos
git add public/products/ data/
git commit -m "Ajout produits Salaah"
git push
```

Les fichiers seront automatiquement classés dans l'univers **Salaah** avec des noms du type :

- `SUPPORT TASBIH REF M01`
- `NATTE DE PRIÈRE REF M02`
- `RANGE NATTE REF M03`
- `COIN PRIÈRE REF M04`

Pour forcer un type précis sur une photo à la racine `public/products/`, ajoutez une entrée dans `data/product-type-map.json`.
