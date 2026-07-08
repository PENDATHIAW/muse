# Photos produits MUSE

Mets toutes tes images dans ce dossier :

```txt
public/products/
```

Le nouveau site scanne automatiquement ce dossier et affiche **toutes les photos** comme produits.

## Organisation conseillée

Tu peux déposer les photos directement :

```txt
public/products/plateau-chaussures-terracotta.jpg
public/products/support-coran-sage.png
public/products/organisateur-salle-de-bain.webp
```

Ou les ranger par univers :

```txt
public/products/entry/plateau-chaussures.jpg
public/products/bathroom/boite-coton.png
public/products/kitchen/station-cafe.webp
public/products/prayer/support-coran.jpg
public/products/desk/organisateur-bureau.jpg
```

## Univers détectés automatiquement

Le site classe les images selon les mots dans le nom du fichier ou du dossier :

- `entry`, `entrée`, `chaussures`, `clés`, `parapluie`
- `bathroom`, `bain`, `douche`, `savon`, `rasoir`, `coton`
- `kitchen`, `cuisine`, `épices`, `café`, `évier`, `ustensile`
- `living`, `salon`, `vase`, `lampe`, `bougie`, `diffuseur`
- `bedroom`, `chambre`, `chevet`, `parfum`, `dressing`
- `kids`, `enfant`, `jouet`, `crayon`, `nuage`
- `prayer`, `prière`, `natte`, `coran`, `quran`, `tasbih`, `duaa`, `ramadan`
- `desk`, `bureau`, `document`, `stylo`, `ordinateur`, `câble`
- `vanity`, `maquillage`, `bijoux`, `coiffeuse`, `peigne`

## Important

- Les images ne sont **pas coupées** sur les fiches produits : elles sont affichées avec `object-fit: contain`.
- Pour que les images apparaissent en ligne après déploiement, elles doivent être ajoutées puis commit/push dans `public/products`.
- Change le numéro WhatsApp dans `.env.local` :

```txt
NEXT_PUBLIC_WHATSAPP_PHONE=221XXXXXXXXX
```
