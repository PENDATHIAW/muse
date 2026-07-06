-- Délai de conception (jours) visible côté client — remplace print_time/material à l'affichage
ALTER TABLE public.products
  ADD COLUMN IF NOT EXISTS conception_days INTEGER;

-- Fiches de devis / validation commande client
CREATE TABLE IF NOT EXISTS public.order_quotes (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  token TEXT NOT NULL UNIQUE DEFAULT encode(gen_random_bytes(16), 'hex'),
  inquiry_id UUID REFERENCES public.inquiries(id) ON DELETE SET NULL,
  customer_name TEXT NOT NULL,
  customer_phone TEXT NOT NULL,
  customer_email TEXT,
  product_id UUID REFERENCES public.products(id) ON DELETE SET NULL,
  product_name TEXT NOT NULL DEFAULT '',
  product_image_url TEXT DEFAULT '',
  universe_name TEXT DEFAULT '',
  unit_price INTEGER NOT NULL DEFAULT 0,
  quantity INTEGER NOT NULL DEFAULT 1,
  dimensions TEXT DEFAULT '',
  colors TEXT DEFAULT '',
  finishes TEXT DEFAULT '',
  personalization TEXT DEFAULT '',
  conception_days INTEGER,
  delivery_note TEXT DEFAULT '',
  admin_message TEXT DEFAULT '',
  status TEXT NOT NULL DEFAULT 'draft'
    CHECK (status IN ('draft', 'sent', 'validated', 'rejected', 'cancelled')),
  send_channel TEXT DEFAULT ''
    CHECK (send_channel IN ('', 'whatsapp', 'email')),
  client_validated_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_order_quotes_token ON public.order_quotes(token);
CREATE INDEX IF NOT EXISTS idx_order_quotes_inquiry ON public.order_quotes(inquiry_id);

ALTER TABLE public.order_quotes ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Public can read quotes"
  ON public.order_quotes FOR SELECT
  USING (true);

CREATE POLICY "Public can update quote validation"
  ON public.order_quotes FOR UPDATE
  USING (true)
  WITH CHECK (status IN ('sent', 'validated', 'rejected'));

CREATE POLICY "Admins manage quotes"
  ON public.order_quotes FOR ALL
  USING (
    EXISTS (
      SELECT 1 FROM public.profiles
      WHERE profiles.id = auth.uid() AND profiles.role = 'admin'
    )
  );
