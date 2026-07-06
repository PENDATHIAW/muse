# Ajouter un modèle MUSE — workflow simple

## La bonne méthode (Git + admin, sans Supabase Storage)

### 1. Ajoutez vos photos

Déposez vos fichiers `.png` / `.jpg` **à la racine** de :

```
public/products/
```

Pas de sous-dossier. Poussez sur GitHub (token ou upload web).

### 2. Attendez le déploiement (~1–2 min)

Vercel redéploie automatiquement après votre push GitHub.

### 3. Ouvrez l'admin

**https://muse-pendathiaws-projects.vercel.app/admin/produits**

Si de nouvelles images sont détectées, un bandeau s'affiche :

> **X nouvelles images détectées** — Voulez-vous les ajouter au catalogue ?

Cliquez **Tout ajouter au catalogue** (ou **Ajouter** image par image).

**Automatique pour chaque photo :**
- Univers détecté (Teranga, Salaah, cuisine…)
- Nom avec référence **REF M01**, **REF M02**…
- Prix de l'univers
- Descriptions courtes et longues
- Textes usage / inspiration / placement

### 4. Modifiez si besoin

Sur chaque produit → **Modifier** pour ajuster prix, nom ou textes.

---

## Configuration Vercel (une seule fois)

Pour que le bouton **Ajouter au catalogue** enregistre le catalogue sur GitHub :

| Variable | Valeur |
|----------|--------|
| `GITHUB_TOKEN` | Token GitHub (classic) avec scope `repo` |

Sans ce token, l'admin détecte les images mais ne peut pas sauvegarder en production. En local (`npm run dev`), l'enregistrement se fait directement dans `data/products.json`.

---

## GitHub demande un mot de passe ?

GitHub **n'accepte plus** le mot de passe du compte pour `git push`. Utilisez un **token** (PAT).

1. GitHub → **Settings** → **Developer settings** → **Personal access tokens** → **Tokens (classic)**
2. **Generate new token** — cochez `repo`
3. Copiez le token

```bash
git add public/products/
git commit -m "Ajout photos produits"
git push origin main
```

- **Username** : `PENDATHIAW`
- **Password** : collez le **token**

### Alternative : upload direct sur GitHub

https://github.com/PENDATHIAW/muse/tree/main/public/products → **Add file** → **Upload files**

---

## Classer un visuel Salaah manuellement

Si l'univers n'est pas détecté, ajoutez une ligne dans `data/product-type-map.json` :

```json
"/products/mon-fichier.png": "RANGE NATTE"
```

Types : `SUPPORT TASBIH`, `RANGE NATTE`, `COIN PRIÈRE`, `NATTE DE PRIÈRE`.

Poussez le fichier, attendez le déploiement, puis **Ajouter au catalogue** dans l'admin.

---

## Résumé

| Étape | Action |
|-------|--------|
| 1 | Photos dans `public/products/` |
| 2 | `git push` ou upload GitHub |
| 3 | Admin → **Ajouter au catalogue** |
| 4 | Modifier prix/textes si besoin |

**Plus besoin de** Supabase Storage, SQL manuel, ni `npm run import-photos` au quotidien.
