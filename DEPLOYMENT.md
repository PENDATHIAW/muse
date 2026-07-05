# Déploiement Vercel — site inaccessible ?

## URL officielle (Production)

**https://muse-git-main-pendathiaws-projects.vercel.app**

Test sans JavaScript :

**https://muse-git-main-pendathiaws-projects.vercel.app/health.html**

Si `/health.html` s'ouvre mais pas `/` → cache navigateur ou extension. Essayez navigation privée.

---

## « This page couldn't load » (Reload / Back)

Ce message **n'est pas** une page MUSE — c'est le navigateur (Safari, app Vercel, Cursor…) qui échoue.

| Cause | Solution |
|-------|----------|
| Mauvaise URL | N'utilisez **pas** `muse.vercel.app` (désactivé). Utilisez l'URL ci-dessus. |
| Lien « Visit » sur un déploiement | Ouvrez le domaine **Production** : Vercel → Settings → Domains |
| Protection Vercel | Settings → Deployment Protection → off pour Production |
| Cache | Navigation privée ou vider le cache |
| Réseau | Testez en 4G (partage connexion) |

---

## Variables d'environnement

Récupérez les clés dans **Supabase → Settings → API** :

```
NEXT_PUBLIC_SUPABASE_URL=https://zboduyqtfhzlrfiqymju.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJ... (clé anon complète)
SUPABASE_SERVICE_ROLE_KEY=eyJ... (clé service_role)
NEXT_PUBLIC_SITE_URL=https://muse-git-main-pendathiaws-projects.vercel.app
```

Après modification → **Deployments → Redeploy** (sans cache).

---

## Admin

`/admin/login` — email + mot de passe Supabase Auth.

---

## Ajouter de nouveaux modèles

Voir **[AJOUTER-PRODUITS.md](./AJOUTER-PRODUITS.md)** — déposer les photos dans `public/products/`, lancer `npm run import-photos`, pousser sur GitHub.
