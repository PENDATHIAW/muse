-- MUSE E-commerce Schema
-- Run this migration in your Supabase SQL Editor or via Supabase CLI

-- Extensions
CREATE EXTENSION IF NOT EXISTS "pgcrypto";
CREATE EXTENSION IF NOT EXISTS "unaccent";

-- Helper: slugify text
CREATE OR REPLACE FUNCTION public.slugify(input TEXT)
RETURNS TEXT
LANGUAGE sql
IMMUTABLE
AS $$
  SELECT trim(both '-' FROM regexp_replace(
    lower(unaccent(coalesce(input, ''))),
    '[^a-z0-9]+', '-', 'g'
  ));
$$;

-- updated_at trigger
CREATE OR REPLACE FUNCTION public.set_updated_at()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$;

-- Universes
CREATE TABLE IF NOT EXISTS public.universes (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  slug TEXT NOT NULL UNIQUE,
  description TEXT DEFAULT '',
  cover_image_url TEXT,
  display_order INTEGER NOT NULL DEFAULT 0,
  is_active BOOLEAN NOT NULL DEFAULT true,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_universes_slug ON public.universes(slug);
CREATE INDEX IF NOT EXISTS idx_universes_active_order ON public.universes(is_active, display_order);

CREATE TRIGGER universes_updated_at
  BEFORE UPDATE ON public.universes
  FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();

-- Products
CREATE TABLE IF NOT EXISTS public.products (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  universe_id UUID NOT NULL REFERENCES public.universes(id) ON DELETE RESTRICT,
  name TEXT NOT NULL,
  slug TEXT NOT NULL UNIQUE,
  short_description TEXT DEFAULT '',
  long_description TEXT DEFAULT '',
  price NUMERIC(12, 2) NOT NULL DEFAULT 0,
  old_price NUMERIC(12, 2),
  dimensions TEXT DEFAULT '',
  print_time TEXT DEFAULT '',
  material TEXT DEFAULT '',
  colors JSONB NOT NULL DEFAULT '[]'::jsonb,
  finishes JSONB NOT NULL DEFAULT '[]'::jsonb,
  personalization_options JSONB NOT NULL DEFAULT '[]'::jsonb,
  stock_status TEXT NOT NULL DEFAULT 'available',
  status TEXT NOT NULL DEFAULT 'draft' CHECK (status IN ('draft', 'published')),
  is_featured BOOLEAN NOT NULL DEFAULT false,
  display_order INTEGER NOT NULL DEFAULT 0,
  tags JSONB NOT NULL DEFAULT '[]'::jsonb,
  internal_note TEXT DEFAULT '',
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_products_slug ON public.products(slug);
CREATE INDEX IF NOT EXISTS idx_products_universe ON public.products(universe_id);
CREATE INDEX IF NOT EXISTS idx_products_status ON public.products(status, is_featured, display_order);

CREATE TRIGGER products_updated_at
  BEFORE UPDATE ON public.products
  FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();

-- Product images
CREATE TABLE IF NOT EXISTS public.product_images (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  product_id UUID NOT NULL REFERENCES public.products(id) ON DELETE CASCADE,
  image_url TEXT NOT NULL,
  alt_text TEXT DEFAULT '',
  is_main BOOLEAN NOT NULL DEFAULT false,
  display_order INTEGER NOT NULL DEFAULT 0,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_product_images_product ON public.product_images(product_id, display_order);

-- Inquiries
CREATE TABLE IF NOT EXISTS public.inquiries (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  customer_name TEXT NOT NULL,
  customer_phone TEXT NOT NULL,
  customer_email TEXT,
  product_id UUID REFERENCES public.products(id) ON DELETE SET NULL,
  universe_id UUID REFERENCES public.universes(id) ON DELETE SET NULL,
  message TEXT NOT NULL DEFAULT '',
  status TEXT NOT NULL DEFAULT 'new' CHECK (status IN ('new', 'discussing', 'confirmed', 'delivered', 'cancelled')),
  admin_note TEXT DEFAULT '',
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_inquiries_status ON public.inquiries(status, created_at DESC);

CREATE TRIGGER inquiries_updated_at
  BEFORE UPDATE ON public.inquiries
  FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();

-- Settings (key-value store)
CREATE TABLE IF NOT EXISTS public.settings (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  key TEXT NOT NULL UNIQUE,
  value TEXT NOT NULL DEFAULT '',
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TRIGGER settings_updated_at
  BEFORE UPDATE ON public.settings
  FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();

-- RLS
ALTER TABLE public.universes ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.products ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.product_images ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.inquiries ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.settings ENABLE ROW LEVEL SECURITY;

-- Public read: active universes
CREATE POLICY "Public can view active universes"
  ON public.universes FOR SELECT
  TO anon, authenticated
  USING (is_active = true);

-- Admin full access universes
CREATE POLICY "Admins manage universes"
  ON public.universes FOR ALL
  TO authenticated
  USING (true)
  WITH CHECK (true);

-- Public read: published products
CREATE POLICY "Public can view published products"
  ON public.products FOR SELECT
  TO anon, authenticated
  USING (status = 'published');

-- Admin full access products
CREATE POLICY "Admins manage products"
  ON public.products FOR ALL
  TO authenticated
  USING (true)
  WITH CHECK (true);

-- Public read: images of published products
CREATE POLICY "Public can view product images"
  ON public.product_images FOR SELECT
  TO anon, authenticated
  USING (
    EXISTS (
      SELECT 1 FROM public.products p
      WHERE p.id = product_id AND p.status = 'published'
    )
  );

-- Admin full access product images
CREATE POLICY "Admins manage product images"
  ON public.product_images FOR ALL
  TO authenticated
  USING (true)
  WITH CHECK (true);

-- Public can submit inquiries
CREATE POLICY "Public can create inquiries"
  ON public.inquiries FOR INSERT
  TO anon, authenticated
  WITH CHECK (true);

-- Admin manage inquiries
CREATE POLICY "Admins manage inquiries"
  ON public.inquiries FOR ALL
  TO authenticated
  USING (true)
  WITH CHECK (true);

-- Public read settings
CREATE POLICY "Public can read settings"
  ON public.settings FOR SELECT
  TO anon, authenticated
  USING (true);

-- Admin manage settings
CREATE POLICY "Admins manage settings"
  ON public.settings FOR ALL
  TO authenticated
  USING (true)
  WITH CHECK (true);

-- Storage bucket for product images
INSERT INTO storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
VALUES (
  'product-images',
  'product-images',
  true,
  5242880,
  ARRAY['image/jpeg', 'image/png', 'image/webp', 'image/gif']
)
ON CONFLICT (id) DO NOTHING;

-- Storage policies
CREATE POLICY "Public read product images bucket"
  ON storage.objects FOR SELECT
  TO anon, authenticated
  USING (bucket_id = 'product-images');

CREATE POLICY "Admins upload product images"
  ON storage.objects FOR INSERT
  TO authenticated
  WITH CHECK (bucket_id = 'product-images');

CREATE POLICY "Admins update product images"
  ON storage.objects FOR UPDATE
  TO authenticated
  USING (bucket_id = 'product-images')
  WITH CHECK (bucket_id = 'product-images');

CREATE POLICY "Admins delete product images"
  ON storage.objects FOR DELETE
  TO authenticated
  USING (bucket_id = 'product-images');
