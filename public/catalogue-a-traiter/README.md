# Déposez vos photos ici — MUSE les transformera en produits

Uploadez vos visuels **dans le dossier de l'univers** correspondant, puis dites à l'assistant « les photos sont uploadées ».

## Structure

```
public/catalogue-a-traiter/
  muse-kitchen/              ← organisateurs cuisine
  plaques-de-porte-chez-nous/
  muse-tech-charge-guard/
  boite-a-cles-murale/
  ... (17 univers)
```

## Comment uploader sur GitHub

1. Allez sur https://github.com/PENDATHIAW/muse
2. Naviguez vers `public/catalogue-a-traiter/[univers]/`
3. **Add file → Upload files**
4. Glissez vos `.jpg` / `.png` / `.webp`
5. **Commit**

## Nommage des fichiers (conseillé)

Utilisez un nom descriptif en minuscules avec tirets :

```
organisateur-mural-drainage.jpg
pot-couverts-sage.jpg
plaque-diagne-ivoire.jpg
```

→ L'assistant en déduira le nom du produit, la description et un prix de départ.

## Si vous ne connaissez pas l'univers

Mettez la photo dans :

```
public/catalogue-a-traiter/a-classer/
```

L'assistant regardera le visuel et choisira l'univers.

## Formats acceptés

- JPEG, PNG, WebP
- Taille conseillée : 1200 × 1500 px max
- Poids : &lt; 1 Mo si possible

## Après l'upload

L'assistant :
1. Regarde chaque visuel
2. Classe par univers
3. Rédige description + prix proposé
4. Crée les produits dans Supabase (vous ajustez ensuite dans `/admin`)
