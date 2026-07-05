-- Champs « histoire produit » pour usage / inspiration / emplacement
ALTER TABLE public.products
  ADD COLUMN IF NOT EXISTS usage TEXT NOT NULL DEFAULT '',
  ADD COLUMN IF NOT EXISTS inspiration TEXT NOT NULL DEFAULT '',
  ADD COLUMN IF NOT EXISTS placement TEXT NOT NULL DEFAULT '';
