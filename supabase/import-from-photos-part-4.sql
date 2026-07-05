-- Import automatique photos MUSE (partie)
-- Exécutez dans Supabase → SQL Editor

-- Partie 4/4 (38 produits)

DO $$
DECLARE
  v_universe_id UUID;
  v_product_id UUID;
BEGIN
  -- A2a80360 15fb 47b2 B332 05f8c6e1940a
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'A2a80360 15fb 47b2 B332 05f8c6e1940a',
      'a2a80360-15fb-47b2-b332-05f8c6e1940a',
      'A2a80360 15fb 47b2 B332 05f8c6e1940a — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      'A2a80360 15fb 47b2 B332 05f8c6e1940a est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 103,
      '["nouveauté","personnalisable"]'::jsonb
    ) ON CONFLICT (slug) DO UPDATE SET
      name = EXCLUDED.name,
      short_description = EXCLUDED.short_description,
      long_description = EXCLUDED.long_description,
      price = EXCLUDED.price,
      universe_id = EXCLUDED.universe_id
    RETURNING id INTO v_product_id;
    DELETE FROM public.product_images WHERE product_id = v_product_id;
    INSERT INTO public.product_images (product_id, image_url, alt_text, is_main, display_order)
    VALUES (v_product_id, '/products/a2a80360-15fb-47b2-b332-05f8c6e1940a.png', 'A2a80360 15fb 47b2 B332 05f8c6e1940a MUSE', true, 0);
  END IF;

  -- A2b9112b 761b 4b67 8fec B84df880d028
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'A2b9112b 761b 4b67 8fec B84df880d028',
      'a2b9112b-761b-4b67-8fec-b84df880d028',
      'A2b9112b 761b 4b67 8fec B84df880d028 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      'A2b9112b 761b 4b67 8fec B84df880d028 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 104,
      '["nouveauté","personnalisable"]'::jsonb
    ) ON CONFLICT (slug) DO UPDATE SET
      name = EXCLUDED.name,
      short_description = EXCLUDED.short_description,
      long_description = EXCLUDED.long_description,
      price = EXCLUDED.price,
      universe_id = EXCLUDED.universe_id
    RETURNING id INTO v_product_id;
    DELETE FROM public.product_images WHERE product_id = v_product_id;
    INSERT INTO public.product_images (product_id, image_url, alt_text, is_main, display_order)
    VALUES (v_product_id, '/products/a2b9112b-761b-4b67-8fec-b84df880d028.png', 'A2b9112b 761b 4b67 8fec B84df880d028 MUSE', true, 0);
  END IF;

  -- A305ce2a A358 4bd8 B0b3 686784c36006
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'muse-kitchen';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'A305ce2a A358 4bd8 B0b3 686784c36006',
      'a305ce2a-a358-4bd8-b0b3-686784c36006',
      'A305ce2a A358 4bd8 B0b3 686784c36006 — objet personnalisable MUSE, univers « MUSE Kitchen / Organisateurs cuisine ».',
      'A305ce2a A358 4bd8 B0b3 686784c36006 est conçu et imprimé en 3D par MUSE dans l''univers « MUSE Kitchen / Organisateurs cuisine ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      12000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '5-8 heures',
      'PETG ou ASA recommandé',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["couleur","logo MUSE","configuration"]'::jsonb,
      'available', 'published', false, 7,
      '["nouveauté","personnalisable"]'::jsonb
    ) ON CONFLICT (slug) DO UPDATE SET
      name = EXCLUDED.name,
      short_description = EXCLUDED.short_description,
      long_description = EXCLUDED.long_description,
      price = EXCLUDED.price,
      universe_id = EXCLUDED.universe_id
    RETURNING id INTO v_product_id;
    DELETE FROM public.product_images WHERE product_id = v_product_id;
    INSERT INTO public.product_images (product_id, image_url, alt_text, is_main, display_order)
    VALUES (v_product_id, '/products/a305ce2a-a358-4bd8-b0b3-686784c36006.png', 'A305ce2a A358 4bd8 B0b3 686784c36006 MUSE', true, 0);
  END IF;

  -- A366d601 9ec9 41a1 8212 6f69c382a39e
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'A366d601 9ec9 41a1 8212 6f69c382a39e',
      'a366d601-9ec9-41a1-8212-6f69c382a39e',
      'A366d601 9ec9 41a1 8212 6f69c382a39e — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      'A366d601 9ec9 41a1 8212 6f69c382a39e est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 105,
      '["nouveauté","personnalisable"]'::jsonb
    ) ON CONFLICT (slug) DO UPDATE SET
      name = EXCLUDED.name,
      short_description = EXCLUDED.short_description,
      long_description = EXCLUDED.long_description,
      price = EXCLUDED.price,
      universe_id = EXCLUDED.universe_id
    RETURNING id INTO v_product_id;
    DELETE FROM public.product_images WHERE product_id = v_product_id;
    INSERT INTO public.product_images (product_id, image_url, alt_text, is_main, display_order)
    VALUES (v_product_id, '/products/a366d601-9ec9-41a1-8212-6f69c382a39e.png', 'A366d601 9ec9 41a1 8212 6f69c382a39e MUSE', true, 0);
  END IF;

  -- A3c526c3 Ac31 47cc Aa77 Fa767aceef73
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'A3c526c3 Ac31 47cc Aa77 Fa767aceef73',
      'a3c526c3-ac31-47cc-aa77-fa767aceef73',
      'A3c526c3 Ac31 47cc Aa77 Fa767aceef73 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      'A3c526c3 Ac31 47cc Aa77 Fa767aceef73 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 106,
      '["nouveauté","personnalisable"]'::jsonb
    ) ON CONFLICT (slug) DO UPDATE SET
      name = EXCLUDED.name,
      short_description = EXCLUDED.short_description,
      long_description = EXCLUDED.long_description,
      price = EXCLUDED.price,
      universe_id = EXCLUDED.universe_id
    RETURNING id INTO v_product_id;
    DELETE FROM public.product_images WHERE product_id = v_product_id;
    INSERT INTO public.product_images (product_id, image_url, alt_text, is_main, display_order)
    VALUES (v_product_id, '/products/a3c526c3-ac31-47cc-aa77-fa767aceef73.png', 'A3c526c3 Ac31 47cc Aa77 Fa767aceef73 MUSE', true, 0);
  END IF;

  -- A4a9b546 0014 4dc7 A98c C15cdec1e597
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'A4a9b546 0014 4dc7 A98c C15cdec1e597',
      'a4a9b546-0014-4dc7-a98c-c15cdec1e597',
      'A4a9b546 0014 4dc7 A98c C15cdec1e597 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      'A4a9b546 0014 4dc7 A98c C15cdec1e597 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 107,
      '["nouveauté","personnalisable"]'::jsonb
    ) ON CONFLICT (slug) DO UPDATE SET
      name = EXCLUDED.name,
      short_description = EXCLUDED.short_description,
      long_description = EXCLUDED.long_description,
      price = EXCLUDED.price,
      universe_id = EXCLUDED.universe_id
    RETURNING id INTO v_product_id;
    DELETE FROM public.product_images WHERE product_id = v_product_id;
    INSERT INTO public.product_images (product_id, image_url, alt_text, is_main, display_order)
    VALUES (v_product_id, '/products/a4a9b546-0014-4dc7-a98c-c15cdec1e597.png', 'A4a9b546 0014 4dc7 A98c C15cdec1e597 MUSE', true, 0);
  END IF;

  -- A5512a9e 4845 47e1 993f 843eec3df7af
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'A5512a9e 4845 47e1 993f 843eec3df7af',
      'a5512a9e-4845-47e1-993f-843eec3df7af',
      'A5512a9e 4845 47e1 993f 843eec3df7af — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      'A5512a9e 4845 47e1 993f 843eec3df7af est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 108,
      '["nouveauté","personnalisable"]'::jsonb
    ) ON CONFLICT (slug) DO UPDATE SET
      name = EXCLUDED.name,
      short_description = EXCLUDED.short_description,
      long_description = EXCLUDED.long_description,
      price = EXCLUDED.price,
      universe_id = EXCLUDED.universe_id
    RETURNING id INTO v_product_id;
    DELETE FROM public.product_images WHERE product_id = v_product_id;
    INSERT INTO public.product_images (product_id, image_url, alt_text, is_main, display_order)
    VALUES (v_product_id, '/products/a5512a9e-4845-47e1-993f-843eec3df7af.png', 'A5512a9e 4845 47e1 993f 843eec3df7af MUSE', true, 0);
  END IF;

  -- A55ac68b D034 451f 997b 04b1ee2e6ecd
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'boite-a-cles-murale';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'A55ac68b D034 451f 997b 04b1ee2e6ecd',
      'a55ac68b-d034-451f-997b-04b1ee2e6ecd',
      'A55ac68b D034 451f 997b 04b1ee2e6ecd — objet personnalisable MUSE, univers « Boîte à clés murale ».',
      'A55ac68b D034 451f 997b 04b1ee2e6ecd est conçu et imprimé en 3D par MUSE dans l''univers « Boîte à clés murale ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      10000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '4-6 heures',
      'PLA+ ou PETG',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["nom","couleur","logo discret"]'::jsonb,
      'available', 'published', false, 3,
      '["nouveauté","personnalisable"]'::jsonb
    ) ON CONFLICT (slug) DO UPDATE SET
      name = EXCLUDED.name,
      short_description = EXCLUDED.short_description,
      long_description = EXCLUDED.long_description,
      price = EXCLUDED.price,
      universe_id = EXCLUDED.universe_id
    RETURNING id INTO v_product_id;
    DELETE FROM public.product_images WHERE product_id = v_product_id;
    INSERT INTO public.product_images (product_id, image_url, alt_text, is_main, display_order)
    VALUES (v_product_id, '/products/a55ac68b-d034-451f-997b-04b1ee2e6ecd.png', 'A55ac68b D034 451f 997b 04b1ee2e6ecd MUSE', true, 0);
  END IF;

  -- Aa7c6b02 B712 4c8b B677 A2ade3da33f6
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Aa7c6b02 B712 4c8b B677 A2ade3da33f6',
      'aa7c6b02-b712-4c8b-b677-a2ade3da33f6',
      'Aa7c6b02 B712 4c8b B677 A2ade3da33f6 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      'Aa7c6b02 B712 4c8b B677 A2ade3da33f6 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 109,
      '["nouveauté","personnalisable"]'::jsonb
    ) ON CONFLICT (slug) DO UPDATE SET
      name = EXCLUDED.name,
      short_description = EXCLUDED.short_description,
      long_description = EXCLUDED.long_description,
      price = EXCLUDED.price,
      universe_id = EXCLUDED.universe_id
    RETURNING id INTO v_product_id;
    DELETE FROM public.product_images WHERE product_id = v_product_id;
    INSERT INTO public.product_images (product_id, image_url, alt_text, is_main, display_order)
    VALUES (v_product_id, '/products/aa7c6b02-b712-4c8b-b677-a2ade3da33f6.png', 'Aa7c6b02 B712 4c8b B677 A2ade3da33f6 MUSE', true, 0);
  END IF;

  -- Ab1d4e83 2811 436b A80f Bf74280a5e11
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Ab1d4e83 2811 436b A80f Bf74280a5e11',
      'ab1d4e83-2811-436b-a80f-bf74280a5e11',
      'Ab1d4e83 2811 436b A80f Bf74280a5e11 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      'Ab1d4e83 2811 436b A80f Bf74280a5e11 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 110,
      '["nouveauté","personnalisable"]'::jsonb
    ) ON CONFLICT (slug) DO UPDATE SET
      name = EXCLUDED.name,
      short_description = EXCLUDED.short_description,
      long_description = EXCLUDED.long_description,
      price = EXCLUDED.price,
      universe_id = EXCLUDED.universe_id
    RETURNING id INTO v_product_id;
    DELETE FROM public.product_images WHERE product_id = v_product_id;
    INSERT INTO public.product_images (product_id, image_url, alt_text, is_main, display_order)
    VALUES (v_product_id, '/products/ab1d4e83-2811-436b-a80f-bf74280a5e11.png', 'Ab1d4e83 2811 436b A80f Bf74280a5e11 MUSE', true, 0);
  END IF;

  -- Ab9e2db7 A338 4bfd 9e8e 114d8d95aa11
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Ab9e2db7 A338 4bfd 9e8e 114d8d95aa11',
      'ab9e2db7-a338-4bfd-9e8e-114d8d95aa11',
      'Ab9e2db7 A338 4bfd 9e8e 114d8d95aa11 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      'Ab9e2db7 A338 4bfd 9e8e 114d8d95aa11 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 111,
      '["nouveauté","personnalisable"]'::jsonb
    ) ON CONFLICT (slug) DO UPDATE SET
      name = EXCLUDED.name,
      short_description = EXCLUDED.short_description,
      long_description = EXCLUDED.long_description,
      price = EXCLUDED.price,
      universe_id = EXCLUDED.universe_id
    RETURNING id INTO v_product_id;
    DELETE FROM public.product_images WHERE product_id = v_product_id;
    INSERT INTO public.product_images (product_id, image_url, alt_text, is_main, display_order)
    VALUES (v_product_id, '/products/ab9e2db7-a338-4bfd-9e8e-114d8d95aa11.png', 'Ab9e2db7 A338 4bfd 9e8e 114d8d95aa11 MUSE', true, 0);
  END IF;

  -- Ac15af47 9483 4245 Be1a E7b81639cf3c
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Ac15af47 9483 4245 Be1a E7b81639cf3c',
      'ac15af47-9483-4245-be1a-e7b81639cf3c',
      'Ac15af47 9483 4245 Be1a E7b81639cf3c — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      'Ac15af47 9483 4245 Be1a E7b81639cf3c est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 112,
      '["nouveauté","personnalisable"]'::jsonb
    ) ON CONFLICT (slug) DO UPDATE SET
      name = EXCLUDED.name,
      short_description = EXCLUDED.short_description,
      long_description = EXCLUDED.long_description,
      price = EXCLUDED.price,
      universe_id = EXCLUDED.universe_id
    RETURNING id INTO v_product_id;
    DELETE FROM public.product_images WHERE product_id = v_product_id;
    INSERT INTO public.product_images (product_id, image_url, alt_text, is_main, display_order)
    VALUES (v_product_id, '/products/ac15af47-9483-4245-be1a-e7b81639cf3c.png', 'Ac15af47 9483 4245 Be1a E7b81639cf3c MUSE', true, 0);
  END IF;

  -- Ae78975c 5146 40a5 Be16 957a616ebe85
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Ae78975c 5146 40a5 Be16 957a616ebe85',
      'ae78975c-5146-40a5-be16-957a616ebe85',
      'Ae78975c 5146 40a5 Be16 957a616ebe85 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      'Ae78975c 5146 40a5 Be16 957a616ebe85 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 113,
      '["nouveauté","personnalisable"]'::jsonb
    ) ON CONFLICT (slug) DO UPDATE SET
      name = EXCLUDED.name,
      short_description = EXCLUDED.short_description,
      long_description = EXCLUDED.long_description,
      price = EXCLUDED.price,
      universe_id = EXCLUDED.universe_id
    RETURNING id INTO v_product_id;
    DELETE FROM public.product_images WHERE product_id = v_product_id;
    INSERT INTO public.product_images (product_id, image_url, alt_text, is_main, display_order)
    VALUES (v_product_id, '/products/ae78975c-5146-40a5-be16-957a616ebe85.png', 'Ae78975c 5146 40a5 Be16 957a616ebe85 MUSE', true, 0);
  END IF;

  -- Aeac0923 8444 4a9b Ba94 5089e2662a47
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Aeac0923 8444 4a9b Ba94 5089e2662a47',
      'aeac0923-8444-4a9b-ba94-5089e2662a47',
      'Aeac0923 8444 4a9b Ba94 5089e2662a47 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      'Aeac0923 8444 4a9b Ba94 5089e2662a47 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 114,
      '["nouveauté","personnalisable"]'::jsonb
    ) ON CONFLICT (slug) DO UPDATE SET
      name = EXCLUDED.name,
      short_description = EXCLUDED.short_description,
      long_description = EXCLUDED.long_description,
      price = EXCLUDED.price,
      universe_id = EXCLUDED.universe_id
    RETURNING id INTO v_product_id;
    DELETE FROM public.product_images WHERE product_id = v_product_id;
    INSERT INTO public.product_images (product_id, image_url, alt_text, is_main, display_order)
    VALUES (v_product_id, '/products/aeac0923-8444-4a9b-ba94-5089e2662a47.png', 'Aeac0923 8444 4a9b Ba94 5089e2662a47 MUSE', true, 0);
  END IF;

  -- Af63541c E6eb 41c4 9634 D727f0726fce
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Af63541c E6eb 41c4 9634 D727f0726fce',
      'af63541c-e6eb-41c4-9634-d727f0726fce',
      'Af63541c E6eb 41c4 9634 D727f0726fce — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      'Af63541c E6eb 41c4 9634 D727f0726fce est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 115,
      '["nouveauté","personnalisable"]'::jsonb
    ) ON CONFLICT (slug) DO UPDATE SET
      name = EXCLUDED.name,
      short_description = EXCLUDED.short_description,
      long_description = EXCLUDED.long_description,
      price = EXCLUDED.price,
      universe_id = EXCLUDED.universe_id
    RETURNING id INTO v_product_id;
    DELETE FROM public.product_images WHERE product_id = v_product_id;
    INSERT INTO public.product_images (product_id, image_url, alt_text, is_main, display_order)
    VALUES (v_product_id, '/products/af63541c-e6eb-41c4-9634-d727f0726fce.png', 'Af63541c E6eb 41c4 9634 D727f0726fce MUSE', true, 0);
  END IF;

  -- Afbc33c6 Bb54 41c1 8ca5 D6003c5cd4ab
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Afbc33c6 Bb54 41c1 8ca5 D6003c5cd4ab',
      'afbc33c6-bb54-41c1-8ca5-d6003c5cd4ab',
      'Afbc33c6 Bb54 41c1 8ca5 D6003c5cd4ab — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      'Afbc33c6 Bb54 41c1 8ca5 D6003c5cd4ab est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 116,
      '["nouveauté","personnalisable"]'::jsonb
    ) ON CONFLICT (slug) DO UPDATE SET
      name = EXCLUDED.name,
      short_description = EXCLUDED.short_description,
      long_description = EXCLUDED.long_description,
      price = EXCLUDED.price,
      universe_id = EXCLUDED.universe_id
    RETURNING id INTO v_product_id;
    DELETE FROM public.product_images WHERE product_id = v_product_id;
    INSERT INTO public.product_images (product_id, image_url, alt_text, is_main, display_order)
    VALUES (v_product_id, '/products/afbc33c6-bb54-41c1-8ca5-d6003c5cd4ab.png', 'Afbc33c6 Bb54 41c1 8ca5 D6003c5cd4ab MUSE', true, 0);
  END IF;

  -- B0d30119 41fe 490a 8738 88ae86c20ca7
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'B0d30119 41fe 490a 8738 88ae86c20ca7',
      'b0d30119-41fe-490a-8738-88ae86c20ca7',
      'B0d30119 41fe 490a 8738 88ae86c20ca7 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      'B0d30119 41fe 490a 8738 88ae86c20ca7 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 117,
      '["nouveauté","personnalisable"]'::jsonb
    ) ON CONFLICT (slug) DO UPDATE SET
      name = EXCLUDED.name,
      short_description = EXCLUDED.short_description,
      long_description = EXCLUDED.long_description,
      price = EXCLUDED.price,
      universe_id = EXCLUDED.universe_id
    RETURNING id INTO v_product_id;
    DELETE FROM public.product_images WHERE product_id = v_product_id;
    INSERT INTO public.product_images (product_id, image_url, alt_text, is_main, display_order)
    VALUES (v_product_id, '/products/b0d30119-41fe-490a-8738-88ae86c20ca7.png', 'B0d30119 41fe 490a 8738 88ae86c20ca7 MUSE', true, 0);
  END IF;

  -- B1c39a0a 01e0 409c B560 080e12953a42
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'B1c39a0a 01e0 409c B560 080e12953a42',
      'b1c39a0a-01e0-409c-b560-080e12953a42',
      'B1c39a0a 01e0 409c B560 080e12953a42 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      'B1c39a0a 01e0 409c B560 080e12953a42 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 118,
      '["nouveauté","personnalisable"]'::jsonb
    ) ON CONFLICT (slug) DO UPDATE SET
      name = EXCLUDED.name,
      short_description = EXCLUDED.short_description,
      long_description = EXCLUDED.long_description,
      price = EXCLUDED.price,
      universe_id = EXCLUDED.universe_id
    RETURNING id INTO v_product_id;
    DELETE FROM public.product_images WHERE product_id = v_product_id;
    INSERT INTO public.product_images (product_id, image_url, alt_text, is_main, display_order)
    VALUES (v_product_id, '/products/b1c39a0a-01e0-409c-b560-080e12953a42.png', 'B1c39a0a 01e0 409c B560 080e12953a42 MUSE', true, 0);
  END IF;

  -- B2dd3074 9c51 4ad7 Aac8 5f78977697a3
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'B2dd3074 9c51 4ad7 Aac8 5f78977697a3',
      'b2dd3074-9c51-4ad7-aac8-5f78977697a3',
      'B2dd3074 9c51 4ad7 Aac8 5f78977697a3 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      'B2dd3074 9c51 4ad7 Aac8 5f78977697a3 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 119,
      '["nouveauté","personnalisable"]'::jsonb
    ) ON CONFLICT (slug) DO UPDATE SET
      name = EXCLUDED.name,
      short_description = EXCLUDED.short_description,
      long_description = EXCLUDED.long_description,
      price = EXCLUDED.price,
      universe_id = EXCLUDED.universe_id
    RETURNING id INTO v_product_id;
    DELETE FROM public.product_images WHERE product_id = v_product_id;
    INSERT INTO public.product_images (product_id, image_url, alt_text, is_main, display_order)
    VALUES (v_product_id, '/products/b2dd3074-9c51-4ad7-aac8-5f78977697a3.png', 'B2dd3074 9c51 4ad7 Aac8 5f78977697a3 MUSE', true, 0);
  END IF;

  -- B34f15dd A5e1 4995 9d99 491095db3553
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'B34f15dd A5e1 4995 9d99 491095db3553',
      'b34f15dd-a5e1-4995-9d99-491095db3553',
      'B34f15dd A5e1 4995 9d99 491095db3553 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      'B34f15dd A5e1 4995 9d99 491095db3553 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 120,
      '["nouveauté","personnalisable"]'::jsonb
    ) ON CONFLICT (slug) DO UPDATE SET
      name = EXCLUDED.name,
      short_description = EXCLUDED.short_description,
      long_description = EXCLUDED.long_description,
      price = EXCLUDED.price,
      universe_id = EXCLUDED.universe_id
    RETURNING id INTO v_product_id;
    DELETE FROM public.product_images WHERE product_id = v_product_id;
    INSERT INTO public.product_images (product_id, image_url, alt_text, is_main, display_order)
    VALUES (v_product_id, '/products/b34f15dd-a5e1-4995-9d99-491095db3553.png', 'B34f15dd A5e1 4995 9d99 491095db3553 MUSE', true, 0);
  END IF;

  -- B38e82f6 233f 4ed6 81f9 8f3c0bb2c679
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'B38e82f6 233f 4ed6 81f9 8f3c0bb2c679',
      'b38e82f6-233f-4ed6-81f9-8f3c0bb2c679',
      'B38e82f6 233f 4ed6 81f9 8f3c0bb2c679 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      'B38e82f6 233f 4ed6 81f9 8f3c0bb2c679 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 121,
      '["nouveauté","personnalisable"]'::jsonb
    ) ON CONFLICT (slug) DO UPDATE SET
      name = EXCLUDED.name,
      short_description = EXCLUDED.short_description,
      long_description = EXCLUDED.long_description,
      price = EXCLUDED.price,
      universe_id = EXCLUDED.universe_id
    RETURNING id INTO v_product_id;
    DELETE FROM public.product_images WHERE product_id = v_product_id;
    INSERT INTO public.product_images (product_id, image_url, alt_text, is_main, display_order)
    VALUES (v_product_id, '/products/b38e82f6-233f-4ed6-81f9-8f3c0bb2c679.png', 'B38e82f6 233f 4ed6 81f9 8f3c0bb2c679 MUSE', true, 0);
  END IF;

  -- Babf43a8 Fd2a 4b46 B6da D41720c83698
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Babf43a8 Fd2a 4b46 B6da D41720c83698',
      'babf43a8-fd2a-4b46-b6da-d41720c83698',
      'Babf43a8 Fd2a 4b46 B6da D41720c83698 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      'Babf43a8 Fd2a 4b46 B6da D41720c83698 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 122,
      '["nouveauté","personnalisable"]'::jsonb
    ) ON CONFLICT (slug) DO UPDATE SET
      name = EXCLUDED.name,
      short_description = EXCLUDED.short_description,
      long_description = EXCLUDED.long_description,
      price = EXCLUDED.price,
      universe_id = EXCLUDED.universe_id
    RETURNING id INTO v_product_id;
    DELETE FROM public.product_images WHERE product_id = v_product_id;
    INSERT INTO public.product_images (product_id, image_url, alt_text, is_main, display_order)
    VALUES (v_product_id, '/products/babf43a8-fd2a-4b46-b6da-d41720c83698.png', 'Babf43a8 Fd2a 4b46 B6da D41720c83698 MUSE', true, 0);
  END IF;

  -- Bcafd4d0 104b 434e 881c 062a741e8ec7
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Bcafd4d0 104b 434e 881c 062a741e8ec7',
      'bcafd4d0-104b-434e-881c-062a741e8ec7',
      'Bcafd4d0 104b 434e 881c 062a741e8ec7 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      'Bcafd4d0 104b 434e 881c 062a741e8ec7 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 123,
      '["nouveauté","personnalisable"]'::jsonb
    ) ON CONFLICT (slug) DO UPDATE SET
      name = EXCLUDED.name,
      short_description = EXCLUDED.short_description,
      long_description = EXCLUDED.long_description,
      price = EXCLUDED.price,
      universe_id = EXCLUDED.universe_id
    RETURNING id INTO v_product_id;
    DELETE FROM public.product_images WHERE product_id = v_product_id;
    INSERT INTO public.product_images (product_id, image_url, alt_text, is_main, display_order)
    VALUES (v_product_id, '/products/bcafd4d0-104b-434e-881c-062a741e8ec7.png', 'Bcafd4d0 104b 434e 881c 062a741e8ec7 MUSE', true, 0);
  END IF;

  -- Bd82a04f C4ad 499d Abcb 9aaf5d0cd43c
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Bd82a04f C4ad 499d Abcb 9aaf5d0cd43c',
      'bd82a04f-c4ad-499d-abcb-9aaf5d0cd43c',
      'Bd82a04f C4ad 499d Abcb 9aaf5d0cd43c — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      'Bd82a04f C4ad 499d Abcb 9aaf5d0cd43c est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 124,
      '["nouveauté","personnalisable"]'::jsonb
    ) ON CONFLICT (slug) DO UPDATE SET
      name = EXCLUDED.name,
      short_description = EXCLUDED.short_description,
      long_description = EXCLUDED.long_description,
      price = EXCLUDED.price,
      universe_id = EXCLUDED.universe_id
    RETURNING id INTO v_product_id;
    DELETE FROM public.product_images WHERE product_id = v_product_id;
    INSERT INTO public.product_images (product_id, image_url, alt_text, is_main, display_order)
    VALUES (v_product_id, '/products/bd82a04f-c4ad-499d-abcb-9aaf5d0cd43c.png', 'Bd82a04f C4ad 499d Abcb 9aaf5d0cd43c MUSE', true, 0);
  END IF;

  -- Bf0fe373 435d 4101 Bda3 B5e28e74770e
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Bf0fe373 435d 4101 Bda3 B5e28e74770e',
      'bf0fe373-435d-4101-bda3-b5e28e74770e',
      'Bf0fe373 435d 4101 Bda3 B5e28e74770e — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      'Bf0fe373 435d 4101 Bda3 B5e28e74770e est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 125,
      '["nouveauté","personnalisable"]'::jsonb
    ) ON CONFLICT (slug) DO UPDATE SET
      name = EXCLUDED.name,
      short_description = EXCLUDED.short_description,
      long_description = EXCLUDED.long_description,
      price = EXCLUDED.price,
      universe_id = EXCLUDED.universe_id
    RETURNING id INTO v_product_id;
    DELETE FROM public.product_images WHERE product_id = v_product_id;
    INSERT INTO public.product_images (product_id, image_url, alt_text, is_main, display_order)
    VALUES (v_product_id, '/products/bf0fe373-435d-4101-bda3-b5e28e74770e.png', 'Bf0fe373 435d 4101 Bda3 B5e28e74770e MUSE', true, 0);
  END IF;

  -- Bf9ca937 Ccf7 4002 8172 25a2f07f21c3
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Bf9ca937 Ccf7 4002 8172 25a2f07f21c3',
      'bf9ca937-ccf7-4002-8172-25a2f07f21c3',
      'Bf9ca937 Ccf7 4002 8172 25a2f07f21c3 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      'Bf9ca937 Ccf7 4002 8172 25a2f07f21c3 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 126,
      '["nouveauté","personnalisable"]'::jsonb
    ) ON CONFLICT (slug) DO UPDATE SET
      name = EXCLUDED.name,
      short_description = EXCLUDED.short_description,
      long_description = EXCLUDED.long_description,
      price = EXCLUDED.price,
      universe_id = EXCLUDED.universe_id
    RETURNING id INTO v_product_id;
    DELETE FROM public.product_images WHERE product_id = v_product_id;
    INSERT INTO public.product_images (product_id, image_url, alt_text, is_main, display_order)
    VALUES (v_product_id, '/products/bf9ca937-ccf7-4002-8172-25a2f07f21c3.png', 'Bf9ca937 Ccf7 4002 8172 25a2f07f21c3 MUSE', true, 0);
  END IF;

  -- C366a081 8156 4759 Bb7d 1ceba6114f80
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'C366a081 8156 4759 Bb7d 1ceba6114f80',
      'c366a081-8156-4759-bb7d-1ceba6114f80',
      'C366a081 8156 4759 Bb7d 1ceba6114f80 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      'C366a081 8156 4759 Bb7d 1ceba6114f80 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 127,
      '["nouveauté","personnalisable"]'::jsonb
    ) ON CONFLICT (slug) DO UPDATE SET
      name = EXCLUDED.name,
      short_description = EXCLUDED.short_description,
      long_description = EXCLUDED.long_description,
      price = EXCLUDED.price,
      universe_id = EXCLUDED.universe_id
    RETURNING id INTO v_product_id;
    DELETE FROM public.product_images WHERE product_id = v_product_id;
    INSERT INTO public.product_images (product_id, image_url, alt_text, is_main, display_order)
    VALUES (v_product_id, '/products/c366a081-8156-4759-bb7d-1ceba6114f80.png', 'C366a081 8156 4759 Bb7d 1ceba6114f80 MUSE', true, 0);
  END IF;

  -- C37d55f1 434d 4af5 Bb9f Ca04d9953359
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'C37d55f1 434d 4af5 Bb9f Ca04d9953359',
      'c37d55f1-434d-4af5-bb9f-ca04d9953359',
      'C37d55f1 434d 4af5 Bb9f Ca04d9953359 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      'C37d55f1 434d 4af5 Bb9f Ca04d9953359 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 128,
      '["nouveauté","personnalisable"]'::jsonb
    ) ON CONFLICT (slug) DO UPDATE SET
      name = EXCLUDED.name,
      short_description = EXCLUDED.short_description,
      long_description = EXCLUDED.long_description,
      price = EXCLUDED.price,
      universe_id = EXCLUDED.universe_id
    RETURNING id INTO v_product_id;
    DELETE FROM public.product_images WHERE product_id = v_product_id;
    INSERT INTO public.product_images (product_id, image_url, alt_text, is_main, display_order)
    VALUES (v_product_id, '/products/c37d55f1-434d-4af5-bb9f-ca04d9953359.png', 'C37d55f1 434d 4af5 Bb9f Ca04d9953359 MUSE', true, 0);
  END IF;

  -- C3f0d579 C06c 41e2 A1b7 1d020ea8c4f9
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'C3f0d579 C06c 41e2 A1b7 1d020ea8c4f9',
      'c3f0d579-c06c-41e2-a1b7-1d020ea8c4f9',
      'C3f0d579 C06c 41e2 A1b7 1d020ea8c4f9 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      'C3f0d579 C06c 41e2 A1b7 1d020ea8c4f9 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 129,
      '["nouveauté","personnalisable"]'::jsonb
    ) ON CONFLICT (slug) DO UPDATE SET
      name = EXCLUDED.name,
      short_description = EXCLUDED.short_description,
      long_description = EXCLUDED.long_description,
      price = EXCLUDED.price,
      universe_id = EXCLUDED.universe_id
    RETURNING id INTO v_product_id;
    DELETE FROM public.product_images WHERE product_id = v_product_id;
    INSERT INTO public.product_images (product_id, image_url, alt_text, is_main, display_order)
    VALUES (v_product_id, '/products/c3f0d579-c06c-41e2-a1b7-1d020ea8c4f9.png', 'C3f0d579 C06c 41e2 A1b7 1d020ea8c4f9 MUSE', true, 0);
  END IF;

  -- C703c001 Df0e 41ec B0c4 B5915972d50f
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'C703c001 Df0e 41ec B0c4 B5915972d50f',
      'c703c001-df0e-41ec-b0c4-b5915972d50f',
      'C703c001 Df0e 41ec B0c4 B5915972d50f — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      'C703c001 Df0e 41ec B0c4 B5915972d50f est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 130,
      '["nouveauté","personnalisable"]'::jsonb
    ) ON CONFLICT (slug) DO UPDATE SET
      name = EXCLUDED.name,
      short_description = EXCLUDED.short_description,
      long_description = EXCLUDED.long_description,
      price = EXCLUDED.price,
      universe_id = EXCLUDED.universe_id
    RETURNING id INTO v_product_id;
    DELETE FROM public.product_images WHERE product_id = v_product_id;
    INSERT INTO public.product_images (product_id, image_url, alt_text, is_main, display_order)
    VALUES (v_product_id, '/products/c703c001-df0e-41ec-b0c4-b5915972d50f.png', 'C703c001 Df0e 41ec B0c4 B5915972d50f MUSE', true, 0);
  END IF;

  -- C77bc1fb 9aca 4e66 Aa37 476088afbd3e
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'C77bc1fb 9aca 4e66 Aa37 476088afbd3e',
      'c77bc1fb-9aca-4e66-aa37-476088afbd3e',
      'C77bc1fb 9aca 4e66 Aa37 476088afbd3e — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      'C77bc1fb 9aca 4e66 Aa37 476088afbd3e est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 131,
      '["nouveauté","personnalisable"]'::jsonb
    ) ON CONFLICT (slug) DO UPDATE SET
      name = EXCLUDED.name,
      short_description = EXCLUDED.short_description,
      long_description = EXCLUDED.long_description,
      price = EXCLUDED.price,
      universe_id = EXCLUDED.universe_id
    RETURNING id INTO v_product_id;
    DELETE FROM public.product_images WHERE product_id = v_product_id;
    INSERT INTO public.product_images (product_id, image_url, alt_text, is_main, display_order)
    VALUES (v_product_id, '/products/c77bc1fb-9aca-4e66-aa37-476088afbd3e.png', 'C77bc1fb 9aca 4e66 Aa37 476088afbd3e MUSE', true, 0);
  END IF;

  -- C850853b 9f49 47f2 9cf1 913aa40f7238
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'C850853b 9f49 47f2 9cf1 913aa40f7238',
      'c850853b-9f49-47f2-9cf1-913aa40f7238',
      'C850853b 9f49 47f2 9cf1 913aa40f7238 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      'C850853b 9f49 47f2 9cf1 913aa40f7238 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 132,
      '["nouveauté","personnalisable"]'::jsonb
    ) ON CONFLICT (slug) DO UPDATE SET
      name = EXCLUDED.name,
      short_description = EXCLUDED.short_description,
      long_description = EXCLUDED.long_description,
      price = EXCLUDED.price,
      universe_id = EXCLUDED.universe_id
    RETURNING id INTO v_product_id;
    DELETE FROM public.product_images WHERE product_id = v_product_id;
    INSERT INTO public.product_images (product_id, image_url, alt_text, is_main, display_order)
    VALUES (v_product_id, '/products/c850853b-9f49-47f2-9cf1-913aa40f7238.png', 'C850853b 9f49 47f2 9cf1 913aa40f7238 MUSE', true, 0);
  END IF;

  -- C98d8d49 F055 49f6 Bb2e D1227b98534a
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'muse-kitchen';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'C98d8d49 F055 49f6 Bb2e D1227b98534a',
      'c98d8d49-f055-49f6-bb2e-d1227b98534a',
      'C98d8d49 F055 49f6 Bb2e D1227b98534a — objet personnalisable MUSE, univers « MUSE Kitchen / Organisateurs cuisine ».',
      'C98d8d49 F055 49f6 Bb2e D1227b98534a est conçu et imprimé en 3D par MUSE dans l''univers « MUSE Kitchen / Organisateurs cuisine ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      12000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '5-8 heures',
      'PETG ou ASA recommandé',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["couleur","logo MUSE","configuration"]'::jsonb,
      'available', 'published', false, 8,
      '["nouveauté","personnalisable"]'::jsonb
    ) ON CONFLICT (slug) DO UPDATE SET
      name = EXCLUDED.name,
      short_description = EXCLUDED.short_description,
      long_description = EXCLUDED.long_description,
      price = EXCLUDED.price,
      universe_id = EXCLUDED.universe_id
    RETURNING id INTO v_product_id;
    DELETE FROM public.product_images WHERE product_id = v_product_id;
    INSERT INTO public.product_images (product_id, image_url, alt_text, is_main, display_order)
    VALUES (v_product_id, '/products/c98d8d49-f055-49f6-bb2e-d1227b98534a.png', 'C98d8d49 F055 49f6 Bb2e D1227b98534a MUSE', true, 0);
  END IF;

  -- Cc059606 76f0 449d Bc8c 1adfb240fdd1
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Cc059606 76f0 449d Bc8c 1adfb240fdd1',
      'cc059606-76f0-449d-bc8c-1adfb240fdd1',
      'Cc059606 76f0 449d Bc8c 1adfb240fdd1 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      'Cc059606 76f0 449d Bc8c 1adfb240fdd1 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 133,
      '["nouveauté","personnalisable"]'::jsonb
    ) ON CONFLICT (slug) DO UPDATE SET
      name = EXCLUDED.name,
      short_description = EXCLUDED.short_description,
      long_description = EXCLUDED.long_description,
      price = EXCLUDED.price,
      universe_id = EXCLUDED.universe_id
    RETURNING id INTO v_product_id;
    DELETE FROM public.product_images WHERE product_id = v_product_id;
    INSERT INTO public.product_images (product_id, image_url, alt_text, is_main, display_order)
    VALUES (v_product_id, '/products/cc059606-76f0-449d-bc8c-1adfb240fdd1.png', 'Cc059606 76f0 449d Bc8c 1adfb240fdd1 MUSE', true, 0);
  END IF;

  -- Cc4ca1dc 3230 4ba5 9dff 8e12ef359d36
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Cc4ca1dc 3230 4ba5 9dff 8e12ef359d36',
      'cc4ca1dc-3230-4ba5-9dff-8e12ef359d36',
      'Cc4ca1dc 3230 4ba5 9dff 8e12ef359d36 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      'Cc4ca1dc 3230 4ba5 9dff 8e12ef359d36 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 134,
      '["nouveauté","personnalisable"]'::jsonb
    ) ON CONFLICT (slug) DO UPDATE SET
      name = EXCLUDED.name,
      short_description = EXCLUDED.short_description,
      long_description = EXCLUDED.long_description,
      price = EXCLUDED.price,
      universe_id = EXCLUDED.universe_id
    RETURNING id INTO v_product_id;
    DELETE FROM public.product_images WHERE product_id = v_product_id;
    INSERT INTO public.product_images (product_id, image_url, alt_text, is_main, display_order)
    VALUES (v_product_id, '/products/cc4ca1dc-3230-4ba5-9dff-8e12ef359d36.png', 'Cc4ca1dc 3230 4ba5 9dff 8e12ef359d36 MUSE', true, 0);
  END IF;

  -- Cdf4ec48 990d 44c5 89ed 477374f1ad18
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Cdf4ec48 990d 44c5 89ed 477374f1ad18',
      'cdf4ec48-990d-44c5-89ed-477374f1ad18',
      'Cdf4ec48 990d 44c5 89ed 477374f1ad18 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      'Cdf4ec48 990d 44c5 89ed 477374f1ad18 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 135,
      '["nouveauté","personnalisable"]'::jsonb
    ) ON CONFLICT (slug) DO UPDATE SET
      name = EXCLUDED.name,
      short_description = EXCLUDED.short_description,
      long_description = EXCLUDED.long_description,
      price = EXCLUDED.price,
      universe_id = EXCLUDED.universe_id
    RETURNING id INTO v_product_id;
    DELETE FROM public.product_images WHERE product_id = v_product_id;
    INSERT INTO public.product_images (product_id, image_url, alt_text, is_main, display_order)
    VALUES (v_product_id, '/products/cdf4ec48-990d-44c5-89ed-477374f1ad18.png', 'Cdf4ec48 990d 44c5 89ed 477374f1ad18 MUSE', true, 0);
  END IF;

  -- Cee234a2 2627 4147 B51b B24501d312a9
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Cee234a2 2627 4147 B51b B24501d312a9',
      'cee234a2-2627-4147-b51b-b24501d312a9',
      'Cee234a2 2627 4147 B51b B24501d312a9 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      'Cee234a2 2627 4147 B51b B24501d312a9 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 136,
      '["nouveauté","personnalisable"]'::jsonb
    ) ON CONFLICT (slug) DO UPDATE SET
      name = EXCLUDED.name,
      short_description = EXCLUDED.short_description,
      long_description = EXCLUDED.long_description,
      price = EXCLUDED.price,
      universe_id = EXCLUDED.universe_id
    RETURNING id INTO v_product_id;
    DELETE FROM public.product_images WHERE product_id = v_product_id;
    INSERT INTO public.product_images (product_id, image_url, alt_text, is_main, display_order)
    VALUES (v_product_id, '/products/cee234a2-2627-4147-b51b-b24501d312a9.png', 'Cee234a2 2627 4147 B51b B24501d312a9 MUSE', true, 0);
  END IF;

  -- Cfac250a 62fa 4b8d B9ad B1381f9e1ba9
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'supports-qr-paiement';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Cfac250a 62fa 4b8d B9ad B1381f9e1ba9',
      'cfac250a-62fa-4b8d-b9ad-b1381f9e1ba9',
      'Cfac250a 62fa 4b8d B9ad B1381f9e1ba9 — objet personnalisable MUSE, univers « Supports QR boutique / Wave / Orange Money ».',
      'Cfac250a 62fa 4b8d B9ad B1381f9e1ba9 est conçu et imprimé en 3D par MUSE dans l''univers « Supports QR boutique / Wave / Orange Money ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      7000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '2-4 heures',
      'PLA+ ou PETG',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["logo boutique","couleur Wave/OM"]'::jsonb,
      'available', 'published', false, 3,
      '["nouveauté","personnalisable"]'::jsonb
    ) ON CONFLICT (slug) DO UPDATE SET
      name = EXCLUDED.name,
      short_description = EXCLUDED.short_description,
      long_description = EXCLUDED.long_description,
      price = EXCLUDED.price,
      universe_id = EXCLUDED.universe_id
    RETURNING id INTO v_product_id;
    DELETE FROM public.product_images WHERE product_id = v_product_id;
    INSERT INTO public.product_images (product_id, image_url, alt_text, is_main, display_order)
    VALUES (v_product_id, '/products/cfac250a-62fa-4b8d-b9ad-b1381f9e1ba9.png', 'Cfac250a 62fa 4b8d B9ad B1381f9e1ba9 MUSE', true, 0);
  END IF;
END $$;
