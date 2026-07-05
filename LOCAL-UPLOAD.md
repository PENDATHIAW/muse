# Ajouter vos photos en local (Mac) — plus simple que GitHub web

GitHub web échoue souvent avec beaucoup de photos ou des fichiers lourds.  
En local, vous copiez les fichiers puis `git push` — c’est plus fiable.

---

## Étape 1 — Avoir le projet sur votre Mac

Si ce n’est pas déjà fait :

```bash
cd ~/Desktop
git clone https://github.com/PENDATHIAW/muse.git
cd muse
npm install
```

---

## Étape 2 — Configurer Supabase en local

```bash
cp .env.example .env.local
```

Ouvrez `.env.local` et mettez vos vraies valeurs :

```
NEXT_PUBLIC_SUPABASE_URL=https://zboduyqtfhzlrfiqymju.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=votre_clé_eyJ...
SUPABASE_SERVICE_ROLE_KEY=votre_clé_secret
NEXT_PUBLIC_SITE_URL=http://localhost:3000
```

---

## Étape 3 — Copier vos photos (simple : tout dans `public/products/`)

```bash
cd ~/Desktop/muse
cp ~/Downloads/*.jpg public/products/
# ou vos .png / .webp
```

Formats : `.jpg`, `.jpeg`, `.png`, `.webp`

L'assistant classera par univers en regardant chaque photo après le push.

---

## Étape 4 — Générer les produits + envoyer sur GitHub

```bash
npm run import-photos
git add public/products/ data/products.json supabase/import-from-photos.sql data/photo-universe-map.json
git commit -m "Ajout visuels catalogue MUSE"
git push origin main
```

Puis dites à l'assistant : **« c'est pushé »**

Ce script :
- lit chaque photo dans `public/products/` et `catalogue-a-traiter/`
- crée nom, description, prix proposé par univers
- met à jour `data/products.json`
- génère `supabase/import-from-photos.sql`

---

## Étape 5 — Voir le site en local

```bash
npm run dev
```

Ouvrez **http://localhost:3000** — vous verrez le catalogue (JSON en local si Supabase pas encore sync).

Admin : **http://localhost:3000/admin/login** (email + mot de passe Supabase)

---

## Étape 6 — Envoyer sur Supabase (base en ligne)

1. Ouvrez le fichier `supabase/import-from-photos.sql` (généré à l’étape 4)
2. Copiez tout le contenu
3. Supabase → **SQL Editor** → **New query** → Collez → **Run**

→ Les produits apparaissent sur le site en ligne.

---

## Étape 7 — Envoyer photos + code sur GitHub

```bash
git add public/catalogue-a-traiter/
git add data/products.json
git add supabase/import-from-photos.sql
git commit -m "Ajout visuels catalogue MUSE"
git push
```

Vercel redéploie automatiquement avec les nouvelles images.

---

## Pourquoi GitHub web échoue parfois

| Cause | Solution locale |
|-------|-----------------|
| Trop de fichiers d’un coup | Copiez par petits lots, plusieurs `git push` |
| Photo > 25 Mo | Réduisez la taille (Photos, Preview, ou [squoosh.app](https://squoosh.app)) |
| Connexion instable | `git push` reprend mieux qu’un upload navigateur |
| Mauvais dossier | Vérifiez le chemin `public/catalogue-a-traiter/[univers]/` |

---

## Ajuster prix / descriptions après

1. **En local** : Admin → Produits → Modifier  
2. **Ou** : dites à l’assistant « ajuste le produit X »

---

## Besoin d’aide ?

Copiez vos photos dans `public/catalogue-a-traiter/` puis dites dans le chat :

> « J’ai copié les photos en local, le dossier muse-kitchen a 5 images »

L’assistant peut vous guider ou faire l’import pour vous si le projet est synchronisé.
