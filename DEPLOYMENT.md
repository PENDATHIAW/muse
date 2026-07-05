# MUSE — déploiement Vercel (guide rapide)

## Bonne nouvelle

Le site **fonctionne** sur cette URL (testée) :

**https://muse-git-main-pendathiaws-projects.vercel.app**

Si vous voyez « error loading » ou « This page couldn't load » :

1. **Videz le cache** du navigateur (ou ouvrez en navigation privée)
2. **N'utilisez pas** `muse.vercel.app` (domaine désactivé)
3. **Redeploy** obligatoire après toute modification de variable d'environnement

---

## Étape 1 — Retrouver vos clés Supabase (2 min)

1. Allez sur **https://supabase.com/dashboard**
2. Ouvrez le projet MUSE (`zboduyqtfhzlrfiqymju`)
3. **Project Settings** (engrenage) → **API**
4. Copiez :

| Variable Vercel | Où la trouver dans Supabase |
|---------------|----------------------------|
| `NEXT_PUBLIC_SUPABASE_URL` | **Project URL** → `https://zboduyqtfhzlrfiqymju.supabase.co` |
| `NEXT_PUBLIC_SUPABASE_ANON_KEY` | **Project API keys** → `anon` `public` (commence par `eyJ...`) |
| `SUPABASE_SERVICE_ROLE_KEY` | **Project API keys** → `service_role` `secret` (commence par `eyJ...`) |

5. **Project Settings** → **API** → vérifiez que **JWT Secret** n'a pas été régénéré récemment (sinon recopiez les nouvelles clés)

---

## Étape 2 — Variables Vercel (copier-coller)

Dans **Vercel → muse → Settings → Environment Variables** :

```
NEXT_PUBLIC_SUPABASE_URL=https://zboduyqtfhzlrfiqymju.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJ... (votre clé anon complète)
SUPABASE_SERVICE_ROLE_KEY=eyJ... (votre clé service_role complète)
NEXT_PUBLIC_SITE_URL=https://muse-git-main-pendathiaws-projects.vercel.app
```

Cochez **Production** et **Preview** pour chaque variable.

⚠️ Ne mettez pas d'espaces avant/après. La clé doit être **complète** (plusieurs centaines de caractères).

---

## Étape 3 — Redeploy (obligatoire)

Les variables `NEXT_PUBLIC_*` sont injectées **au build**. Sans redeploy, le site peut planter côté navigateur.

1. **Vercel → Deployments**
2. Dernier déploiement → **⋯** → **Redeploy**
3. Cochez **Use existing Build Cache** → **OFF** (décoché)
4. **Redeploy**

Attendez 2–3 minutes, puis testez en navigation privée.

---

## Étape 4 — Vérifier que tout marche

Ouvrez dans le navigateur :

| Test | URL attendue |
|------|--------------|
| Santé API | https://muse-git-main-pendathiaws-projects.vercel.app/api/health |
| Accueil | https://muse-git-main-pendathiaws-projects.vercel.app |
| Catalogue | https://muse-git-main-pendathiaws-projects.vercel.app/catalogue |

`/api/health` doit afficher :

```json
{"ok":true,"supabaseConfigured":true,"siteUrl":"https://...","timestamp":"..."}
```

Si `supabaseConfigured` est `false` → clés manquantes ou mal formatées → refaire étape 2 + redeploy.

---

## Protection Vercel

**Settings → Deployment Protection** :

- **Vercel Authentication** → « Preview Deployments only » (pas Production)
- **Password Protection** → désactivé pour Production

---

## Admin

`/admin/login` — email + mot de passe du compte créé dans Supabase Auth (Authentication → Users).

---

## Le site marche sans Supabase

Même si Supabase est mal configuré, le catalogue JSON local s'affiche (4 produits exemples + fallback). Une fois Supabase OK + SQL importé, les 158+ produits apparaissent en ligne.
