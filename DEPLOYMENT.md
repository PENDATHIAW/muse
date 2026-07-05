# Déploiement Vercel — site inaccessible ?

## Erreur « This page couldn't load »

Si vous voyez ce message, c'est souvent parce que **Vercel bloque l'accès public** au site (protection activée).

### Solution (2 minutes)

1. Allez sur **https://vercel.com** → projet **muse**
2. **Settings** → **Deployment Protection**
3. Section **Vercel Authentication** ou **Password Protection**
4. Désactivez la protection pour **Production** (ou mettez « Only Preview Deployments »)
5. **Save**
6. **Deployments** → **Redeploy** le dernier déploiement

Le site doit alors être accessible publiquement sans connexion Vercel.

### URL à utiliser pour `NEXT_PUBLIC_SITE_URL`

Préférez l'URL stable de production :

```
https://muse-git-main-pendathiaws-projects.vercel.app
```

Ou le domaine personnalisé si vous en avez un.

## Variables d'environnement requises

```
NEXT_PUBLIC_SUPABASE_URL
NEXT_PUBLIC_SUPABASE_ANON_KEY
SUPABASE_SERVICE_ROLE_KEY
NEXT_PUBLIC_SITE_URL
```

Après modification des variables → **Redeploy** obligatoire.

## Admin

Connexion : `/admin/login` avec **email + mot de passe Supabase Auth** (pas ADMIN_PASSWORD).
