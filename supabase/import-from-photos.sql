-- Import automatique photos MUSE
-- Exécutez dans Supabase → SQL Editor

DO $$
DECLARE
  v_universe_id UUID;
  v_product_id UUID;
BEGIN
  -- Vide-poche d'entrée « Teranga » — modèle 1
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 1',
      '041e83b9-7b28-443f-b28e-4f601b679fcb',
      'Vide-poche d''entrée « Teranga » — modèle 1 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 1 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', true, 1,
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
    VALUES (v_product_id, '/products/041e83b9-7b28-443f-b28e-4f601b679fcb.png', 'Vide-poche d''entrée « Teranga » — modèle 1 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 2
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 2',
      '073c62dd-6152-42ca-ae44-3126f844d0ed',
      'Vide-poche d''entrée « Teranga » — modèle 2 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 2 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', true, 2,
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
    VALUES (v_product_id, '/products/073c62dd-6152-42ca-ae44-3126f844d0ed.png', 'Vide-poche d''entrée « Teranga » — modèle 2 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 3
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 3',
      '0acd14a7-edee-4835-91b9-827940eee419',
      'Vide-poche d''entrée « Teranga » — modèle 3 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 3 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
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
    VALUES (v_product_id, '/products/0acd14a7-edee-4835-91b9-827940eee419.png', 'Vide-poche d''entrée « Teranga » — modèle 3 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 4
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 4',
      '0ddcd20a-32eb-494d-818b-740331ae89a0',
      'Vide-poche d''entrée « Teranga » — modèle 4 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 4 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 4,
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
    VALUES (v_product_id, '/products/0ddcd20a-32eb-494d-818b-740331ae89a0.png', 'Vide-poche d''entrée « Teranga » — modèle 4 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 5
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 5',
      '0e45841b-c406-46ff-b016-2082d57770d4',
      'Vide-poche d''entrée « Teranga » — modèle 5 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 5 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 5,
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
    VALUES (v_product_id, '/products/0e45841b-c406-46ff-b016-2082d57770d4.png', 'Vide-poche d''entrée « Teranga » — modèle 5 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 6
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 6',
      '0fba0202-0653-45eb-8c1d-974b08274d53',
      'Vide-poche d''entrée « Teranga » — modèle 6 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 6 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 6,
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
    VALUES (v_product_id, '/products/0fba0202-0653-45eb-8c1d-974b08274d53.png', 'Vide-poche d''entrée « Teranga » — modèle 6 MUSE', true, 0);
  END IF;

  -- KITCHEN OBJECT
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'muse-kitchen';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'KITCHEN OBJECT',
      '111bd4c1-55de-4e6b-9938-602cec04cd00',
      'KITCHEN OBJECT — collection MUSE, univers MUSE Kitchen / Organisateurs cuisine.',
      'KITCHEN OBJECT conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « MUSE Kitchen / Organisateurs cuisine ». Qualité premium, finitions soignées.',
      12000,
      'Sur mesure',
      '5-8 heures',
      'PETG ou ASA recommandé',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["couleur","logo MUSE","configuration"]'::jsonb,
      'available', 'published', true, 1,
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
    VALUES (v_product_id, '/products/111bd4c1-55de-4e6b-9938-602cec04cd00.png', 'KITCHEN OBJECT MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 7
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 7',
      '1346f3bb-2b57-4d9f-9e2d-51797e11bb78',
      'Vide-poche d''entrée « Teranga » — modèle 7 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 7 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
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
    VALUES (v_product_id, '/products/1346f3bb-2b57-4d9f-9e2d-51797e11bb78.png', 'Vide-poche d''entrée « Teranga » — modèle 7 MUSE', true, 0);
  END IF;

  -- OFF RCEH ORGANIZER
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'OFF RCEH ORGANIZER',
      '15a0820e-e669-4c4d-9c84-51cd133a0c0f',
      'OFF RCEH ORGANIZER — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'OFF RCEH ORGANIZER conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
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
    VALUES (v_product_id, '/products/15a0820e-e669-4c4d-9c84-51cd133a0c0f.png', 'OFF RCEH ORGANIZER MUSE', true, 0);
  END IF;

  -- WALL & VANITY ORGANIZER
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'support-bijoux-coiffeuse';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'WALL & VANITY ORGANIZER',
      '1a007e80-9d3d-4751-b882-6b5b63dcb733',
      'WALL & VANITY ORGANIZER — collection MUSE, univers Support bijoux de coiffeuse.',
      'WALL & VANITY ORGANIZER conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Support bijoux de coiffeuse ». Qualité premium, finitions soignées.',
      12000,
      'Sur mesure',
      '5-8 heures',
      'PLA mat ou effet bois',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["initiales","couleur"]'::jsonb,
      'available', 'published', true, 1,
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
    VALUES (v_product_id, '/products/1a007e80-9d3d-4751-b882-6b5b63dcb733.png', 'WALL & VANITY ORGANIZER MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 9
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 9',
      '1a4cd869-5e17-4689-bb01-fd44d50bc2b8',
      'Vide-poche d''entrée « Teranga » — modèle 9 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 9 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 9,
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
    VALUES (v_product_id, '/products/1a4cd869-5e17-4689-bb01-fd44d50bc2b8.png', 'Vide-poche d''entrée « Teranga » — modèle 9 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 10
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 10',
      '1bedd536-5f6d-4786-b101-056f1571cab7',
      'Vide-poche d''entrée « Teranga » — modèle 10 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 10 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 10,
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
    VALUES (v_product_id, '/products/1bedd536-5f6d-4786-b101-056f1571cab7.png', 'Vide-poche d''entrée « Teranga » — modèle 10 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 11
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 11',
      '1cfb5cb4-db54-4739-8f2f-3a6aabfcc4cd',
      'Vide-poche d''entrée « Teranga » — modèle 11 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 11 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 11,
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
    VALUES (v_product_id, '/products/1cfb5cb4-db54-4739-8f2f-3a6aabfcc4cd.png', 'Vide-poche d''entrée « Teranga » — modèle 11 MUSE', true, 0);
  END IF;

  -- Supports QR boutique / Wave / Orange Money — modèle 1
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'supports-qr-paiement';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Supports QR boutique / Wave / Orange Money — modèle 1',
      '1e140b2e-5656-4675-b52e-6de9d718a50c',
      'Supports QR boutique / Wave / Orange Money — modèle 1 — collection MUSE, univers Supports QR boutique / Wave / Orange Money.',
      'Supports QR boutique / Wave / Orange Money — modèle 1 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Supports QR boutique / Wave / Orange Money ». Qualité premium, finitions soignées.',
      7000,
      'Sur mesure',
      '2-4 heures',
      'PLA+ ou PETG',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["logo boutique","couleur Wave/OM"]'::jsonb,
      'available', 'published', true, 1,
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
    VALUES (v_product_id, '/products/1e140b2e-5656-4675-b52e-6de9d718a50c.png', 'Supports QR boutique / Wave / Orange Money — modèle 1 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 12
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 12',
      '1f0b23e7-9f05-4bc7-a95c-3e5d3963cf06',
      'Vide-poche d''entrée « Teranga » — modèle 12 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 12 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 12,
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
    VALUES (v_product_id, '/products/1f0b23e7-9f05-4bc7-a95c-3e5d3963cf06.png', 'Vide-poche d''entrée « Teranga » — modèle 12 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 13
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 13',
      '2075d708-8839-4081-9b32-a1e9c3e9700b',
      'Vide-poche d''entrée « Teranga » — modèle 13 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 13 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 13,
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
    VALUES (v_product_id, '/products/2075d708-8839-4081-9b32-a1e9c3e9700b.png', 'Vide-poche d''entrée « Teranga » — modèle 13 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 14
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 14',
      '21e37ce8-6c82-4b14-b1e9-8509eaec8bdc',
      'Vide-poche d''entrée « Teranga » — modèle 14 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 14 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 14,
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
    VALUES (v_product_id, '/products/21e37ce8-6c82-4b14-b1e9-8509eaec8bdc.png', 'Vide-poche d''entrée « Teranga » — modèle 14 MUSE', true, 0);
  END IF;

  -- Mini déco murale Sénégal — modèle 1
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'mini-deco-murale-senegal';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Mini déco murale Sénégal — modèle 1',
      '242765f9-fc7d-4909-aa0b-b67c66dc9a04',
      'Mini déco murale Sénégal — modèle 1 — collection MUSE, univers Mini déco murale Sénégal.',
      'Mini déco murale Sénégal — modèle 1 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Mini déco murale Sénégal ». Qualité premium, finitions soignées.',
      10000,
      'Sur mesure',
      '4-7 heures',
      'PLA mat multicolore',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["symbole","couleur","taille"]'::jsonb,
      'available', 'published', true, 1,
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
    VALUES (v_product_id, '/products/242765f9-fc7d-4909-aa0b-b67c66dc9a04.png', 'Mini déco murale Sénégal — modèle 1 MUSE', true, 0);
  END IF;

  -- WALL & BATH ORGANIZER Br
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'WALL & BATH ORGANIZER Br',
      '25dee405-6dd3-4154-bdc9-aa16247dfb98',
      'WALL & BATH ORGANIZER Br — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'WALL & BATH ORGANIZER Br conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 15,
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
    VALUES (v_product_id, '/products/25dee405-6dd3-4154-bdc9-aa16247dfb98.png', 'WALL & BATH ORGANIZER Br MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 16
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 16',
      '268f1631-fd4c-4012-8451-1d4f3e2a21e7',
      'Vide-poche d''entrée « Teranga » — modèle 16 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 16 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 16,
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
    VALUES (v_product_id, '/products/268f1631-fd4c-4012-8451-1d4f3e2a21e7.png', 'Vide-poche d''entrée « Teranga » — modèle 16 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 17
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 17',
      '290b28bd-a15b-4b72-8b28-299f3de8abb2',
      'Vide-poche d''entrée « Teranga » — modèle 17 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 17 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 17,
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
    VALUES (v_product_id, '/products/290b28bd-a15b-4b72-8b28-299f3de8abb2.png', 'Vide-poche d''entrée « Teranga » — modèle 17 MUSE', true, 0);
  END IF;

  -- COFFEE CORNER ORGANIZER
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'muse-kitchen';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'COFFEE CORNER ORGANIZER',
      '2988ba56-051a-4276-adeb-9162b85b36a5',
      'COFFEE CORNER ORGANIZER — collection MUSE, univers MUSE Kitchen / Organisateurs cuisine.',
      'COFFEE CORNER ORGANIZER conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « MUSE Kitchen / Organisateurs cuisine ». Qualité premium, finitions soignées.',
      12000,
      'Sur mesure',
      '5-8 heures',
      'PETG ou ASA recommandé',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["couleur","logo MUSE","configuration"]'::jsonb,
      'available', 'published', true, 2,
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
    VALUES (v_product_id, '/products/2988ba56-051a-4276-adeb-9162b85b36a5.png', 'COFFEE CORNER ORGANIZER MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 18
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 18',
      '2a676412-2db1-4b8e-8efe-b0da9d1f8bac',
      'Vide-poche d''entrée « Teranga » — modèle 18 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 18 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 18,
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
    VALUES (v_product_id, '/products/2a676412-2db1-4b8e-8efe-b0da9d1f8bac.png', 'Vide-poche d''entrée « Teranga » — modèle 18 MUSE', true, 0);
  END IF;

  -- Ee BATHROOM ORGANIZER Ds
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Ee BATHROOM ORGANIZER Ds',
      '2bb50489-f1a2-4793-af05-9979caffb5c3',
      'Ee BATHROOM ORGANIZER Ds — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Ee BATHROOM ORGANIZER Ds conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 19,
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
    VALUES (v_product_id, '/products/2bb50489-f1a2-4793-af05-9979caffb5c3.png', 'Ee BATHROOM ORGANIZER Ds MUSE', true, 0);
  END IF;

  -- KITCHEN COUNTER ORGANIZER
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'muse-kitchen';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'KITCHEN COUNTER ORGANIZER',
      '2ea6406a-793d-494f-9420-588a4b90bf0c',
      'KITCHEN COUNTER ORGANIZER — collection MUSE, univers MUSE Kitchen / Organisateurs cuisine.',
      'KITCHEN COUNTER ORGANIZER conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « MUSE Kitchen / Organisateurs cuisine ». Qualité premium, finitions soignées.',
      12000,
      'Sur mesure',
      '5-8 heures',
      'PETG ou ASA recommandé',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["couleur","logo MUSE","configuration"]'::jsonb,
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
    VALUES (v_product_id, '/products/2ea6406a-793d-494f-9420-588a4b90bf0c.png', 'KITCHEN COUNTER ORGANIZER MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 20
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 20',
      '319774fd-d4a4-40d1-8c8f-792dd7a826e5',
      'Vide-poche d''entrée « Teranga » — modèle 20 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 20 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 20,
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
    VALUES (v_product_id, '/products/319774fd-d4a4-40d1-8c8f-792dd7a826e5.png', 'Vide-poche d''entrée « Teranga » — modèle 20 MUSE', true, 0);
  END IF;

  -- ORGANIZER X JL
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'ORGANIZER X JL',
      '3261cbd8-830f-4d86-ae61-9dd27b0a79dc',
      'ORGANIZER X JL — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'ORGANIZER X JL conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 21,
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
    VALUES (v_product_id, '/products/3261cbd8-830f-4d86-ae61-9dd27b0a79dc.png', 'ORGANIZER X JL MUSE', true, 0);
  END IF;

  -- VANITY ORGANIZER
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'support-bijoux-coiffeuse';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VANITY ORGANIZER',
      '3409794b-a37b-46ba-9309-c976278d45bd',
      'VANITY ORGANIZER — collection MUSE, univers Support bijoux de coiffeuse.',
      'VANITY ORGANIZER conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Support bijoux de coiffeuse ». Qualité premium, finitions soignées.',
      12000,
      'Sur mesure',
      '5-8 heures',
      'PLA mat ou effet bois',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["initiales","couleur"]'::jsonb,
      'available', 'published', true, 2,
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
    VALUES (v_product_id, '/products/3409794b-a37b-46ba-9309-c976278d45bd.png', 'VANITY ORGANIZER MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 22
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 22',
      '34ce5036-160d-41f1-88e7-14cc0e8738fb',
      'Vide-poche d''entrée « Teranga » — modèle 22 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 22 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 22,
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
    VALUES (v_product_id, '/products/34ce5036-160d-41f1-88e7-14cc0e8738fb.png', 'Vide-poche d''entrée « Teranga » — modèle 22 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 23
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 23',
      '3754cc1b-e544-42c5-991c-675b4054a3b4',
      'Vide-poche d''entrée « Teranga » — modèle 23 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 23 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 23,
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
    VALUES (v_product_id, '/products/3754cc1b-e544-42c5-991c-675b4054a3b4.png', 'Vide-poche d''entrée « Teranga » — modèle 23 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 24
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 24',
      '3805ca06-c788-4f55-8c28-f6732a6b18af',
      'Vide-poche d''entrée « Teranga » — modèle 24 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 24 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 24,
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
    VALUES (v_product_id, '/products/3805ca06-c788-4f55-8c28-f6732a6b18af.png', 'Vide-poche d''entrée « Teranga » — modèle 24 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 25
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 25',
      '393bb64e-cc7f-4b79-b9aa-69174ef68399',
      'Vide-poche d''entrée « Teranga » — modèle 25 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 25 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 25,
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
    VALUES (v_product_id, '/products/393bb64e-cc7f-4b79-b9aa-69174ef68399.png', 'Vide-poche d''entrée « Teranga » — modèle 25 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 26
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 26',
      '3a974963-994b-49e0-a453-ea3017c8e88e',
      'Vide-poche d''entrée « Teranga » — modèle 26 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 26 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 26,
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
    VALUES (v_product_id, '/products/3a974963-994b-49e0-a453-ea3017c8e88e.png', 'Vide-poche d''entrée « Teranga » — modèle 26 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 27
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 27',
      '3aa7ce75-1e08-46d8-8135-1bbf1c3f4bac',
      'Vide-poche d''entrée « Teranga » — modèle 27 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 27 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 27,
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
    VALUES (v_product_id, '/products/3aa7ce75-1e08-46d8-8135-1bbf1c3f4bac.png', 'Vide-poche d''entrée « Teranga » — modèle 27 MUSE', true, 0);
  END IF;

  -- LAVABO ORGANIZER Or
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'LAVABO ORGANIZER Or',
      '3fd6c3cb-893d-44d3-b208-cc599ce892e0',
      'LAVABO ORGANIZER Or — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'LAVABO ORGANIZER Or conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 28,
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
    VALUES (v_product_id, '/products/3fd6c3cb-893d-44d3-b208-cc599ce892e0.png', 'LAVABO ORGANIZER Or MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 29
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 29',
      '406bb427-b3cc-428d-8bfb-b59023cdf558',
      'Vide-poche d''entrée « Teranga » — modèle 29 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 29 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 29,
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
    VALUES (v_product_id, '/products/406bb427-b3cc-428d-8bfb-b59023cdf558.png', 'Vide-poche d''entrée « Teranga » — modèle 29 MUSE', true, 0);
  END IF;

  -- ENTRY COLLECTION
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'boite-a-cles-murale';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'ENTRY COLLECTION',
      '4090092d-f3f8-4db9-aa23-97f6c0106bac',
      'ENTRY COLLECTION — collection MUSE, univers Boîte à clés murale.',
      'ENTRY COLLECTION conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Boîte à clés murale ». Qualité premium, finitions soignées.',
      10000,
      'Sur mesure',
      '4-6 heures',
      'PLA+ ou PETG',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["nom","couleur","logo discret"]'::jsonb,
      'available', 'published', true, 1,
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
    VALUES (v_product_id, '/products/4090092d-f3f8-4db9-aa23-97f6c0106bac.png', 'ENTRY COLLECTION MUSE', true, 0);
  END IF;

  -- Wall Organizer
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Wall Organizer',
      '40958511-78ef-43fc-82eb-c4439842555f',
      'Wall Organizer — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Wall Organizer conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 30,
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
    VALUES (v_product_id, '/products/40958511-78ef-43fc-82eb-c4439842555f.png', 'Wall Organizer MUSE', true, 0);
  END IF;

  -- DECORATIVE FRUIT BOWL
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'muse-kitchen';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'DECORATIVE FRUIT BOWL',
      '4226855b-a2d2-435d-8ee8-264de9ec5922',
      'DECORATIVE FRUIT BOWL — collection MUSE, univers MUSE Kitchen / Organisateurs cuisine.',
      'DECORATIVE FRUIT BOWL conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « MUSE Kitchen / Organisateurs cuisine ». Qualité premium, finitions soignées.',
      12000,
      'Sur mesure',
      '5-8 heures',
      'PETG ou ASA recommandé',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["couleur","logo MUSE","configuration"]'::jsonb,
      'available', 'published', false, 4,
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
    VALUES (v_product_id, '/products/4226855b-a2d2-435d-8ee8-264de9ec5922.png', 'DECORATIVE FRUIT BOWL MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 31
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 31',
      '425af7e7-44d1-45eb-9af1-8dbf9fc32a15',
      'Vide-poche d''entrée « Teranga » — modèle 31 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 31 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 31,
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
    VALUES (v_product_id, '/products/425af7e7-44d1-45eb-9af1-8dbf9fc32a15.png', 'Vide-poche d''entrée « Teranga » — modèle 31 MUSE', true, 0);
  END IF;

  -- MUSE Kitchen / Organisateurs cuisine — modèle 5
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'muse-kitchen';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'MUSE Kitchen / Organisateurs cuisine — modèle 5',
      '465828cf-14a0-4e8d-ac97-926050d5160e',
      'MUSE Kitchen / Organisateurs cuisine — modèle 5 — collection MUSE, univers MUSE Kitchen / Organisateurs cuisine.',
      'MUSE Kitchen / Organisateurs cuisine — modèle 5 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « MUSE Kitchen / Organisateurs cuisine ». Qualité premium, finitions soignées.',
      12000,
      'Sur mesure',
      '5-8 heures',
      'PETG ou ASA recommandé',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["couleur","logo MUSE","configuration"]'::jsonb,
      'available', 'published', false, 5,
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
    VALUES (v_product_id, '/products/465828cf-14a0-4e8d-ac97-926050d5160e.png', 'MUSE Kitchen / Organisateurs cuisine — modèle 5 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 32
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 32',
      '46f996d7-9a09-4d08-8f3d-91d08b737ceb',
      'Vide-poche d''entrée « Teranga » — modèle 32 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 32 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 32,
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
    VALUES (v_product_id, '/products/46f996d7-9a09-4d08-8f3d-91d08b737ceb.png', 'Vide-poche d''entrée « Teranga » — modèle 32 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 33
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 33',
      '477d3822-29e0-4a19-aeec-30a57991cddd',
      'Vide-poche d''entrée « Teranga » — modèle 33 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 33 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 33,
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
    VALUES (v_product_id, '/products/477d3822-29e0-4a19-aeec-30a57991cddd.png', 'Vide-poche d''entrée « Teranga » — modèle 33 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 34
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 34',
      '4865d9ef-d2a4-4a8b-b73f-1781076c768f',
      'Vide-poche d''entrée « Teranga » — modèle 34 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 34 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 34,
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
    VALUES (v_product_id, '/products/4865d9ef-d2a4-4a8b-b73f-1781076c768f.png', 'Vide-poche d''entrée « Teranga » — modèle 34 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 35
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 35',
      '49106b4d-cd4b-4caf-ba3c-1adfc7cb2442',
      'Vide-poche d''entrée « Teranga » — modèle 35 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 35 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 35,
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
    VALUES (v_product_id, '/products/49106b4d-cd4b-4caf-ba3c-1adfc7cb2442.png', 'Vide-poche d''entrée « Teranga » — modèle 35 MUSE', true, 0);
  END IF;

  -- ENTRY OBJECT
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'ENTRY OBJECT',
      '492429f0-a42c-4511-990c-932e60e86757',
      'ENTRY OBJECT — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'ENTRY OBJECT conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 36,
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
    VALUES (v_product_id, '/products/492429f0-a42c-4511-990c-932e60e86757.png', 'ENTRY OBJECT MUSE', true, 0);
  END IF;

  -- Mini déco murale Sénégal — modèle 2
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'mini-deco-murale-senegal';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Mini déco murale Sénégal — modèle 2',
      '4a0acf3a-74aa-498d-b195-a1525acc8826',
      'Mini déco murale Sénégal — modèle 2 — collection MUSE, univers Mini déco murale Sénégal.',
      'Mini déco murale Sénégal — modèle 2 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Mini déco murale Sénégal ». Qualité premium, finitions soignées.',
      10000,
      'Sur mesure',
      '4-7 heures',
      'PLA mat multicolore',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["symbole","couleur","taille"]'::jsonb,
      'available', 'published', true, 2,
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
    VALUES (v_product_id, '/products/4a0acf3a-74aa-498d-b195-a1525acc8826.png', 'Mini déco murale Sénégal — modèle 2 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 37
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 37',
      '4ea5518b-d972-4636-9a7c-112582388c9d',
      'Vide-poche d''entrée « Teranga » — modèle 37 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 37 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 37,
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
    VALUES (v_product_id, '/products/4ea5518b-d972-4636-9a7c-112582388c9d.png', 'Vide-poche d''entrée « Teranga » — modèle 37 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 38
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 38',
      '53fb0795-f056-4c7a-bfc3-e3edcaff2280',
      'Vide-poche d''entrée « Teranga » — modèle 38 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 38 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 38,
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
    VALUES (v_product_id, '/products/53fb0795-f056-4c7a-bfc3-e3edcaff2280.png', 'Vide-poche d''entrée « Teranga » — modèle 38 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 39
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 39',
      '54951c40-33a0-4590-b396-d4d8782263c6',
      'Vide-poche d''entrée « Teranga » — modèle 39 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 39 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 39,
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
    VALUES (v_product_id, '/products/54951c40-33a0-4590-b396-d4d8782263c6.png', 'Vide-poche d''entrée « Teranga » — modèle 39 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 40
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 40',
      '56e9be07-a72c-4871-9ed8-0cae3fe65781',
      'Vide-poche d''entrée « Teranga » — modèle 40 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 40 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 40,
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
    VALUES (v_product_id, '/products/56e9be07-a72c-4871-9ed8-0cae3fe65781.png', 'Vide-poche d''entrée « Teranga » — modèle 40 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 41
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 41',
      '56f0e63c-6934-4d52-af16-91d8d73ef32b',
      'Vide-poche d''entrée « Teranga » — modèle 41 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 41 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 41,
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
    VALUES (v_product_id, '/products/56f0e63c-6934-4d52-af16-91d8d73ef32b.png', 'Vide-poche d''entrée « Teranga » — modèle 41 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 42
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 42',
      '58f189c9-3f6f-456b-8344-f8ecf25dc5bd',
      'Vide-poche d''entrée « Teranga » — modèle 42 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 42 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 42,
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
    VALUES (v_product_id, '/products/58f189c9-3f6f-456b-8344-f8ecf25dc5bd.png', 'Vide-poche d''entrée « Teranga » — modèle 42 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 43
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 43',
      '5a9726f6-1a57-4eb8-a0ba-f706e4964ebe',
      'Vide-poche d''entrée « Teranga » — modèle 43 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 43 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 43,
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
    VALUES (v_product_id, '/products/5a9726f6-1a57-4eb8-a0ba-f706e4964ebe.png', 'Vide-poche d''entrée « Teranga » — modèle 43 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 44
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 44',
      '5b3df704-1e48-4ec1-be11-950eab7ad873',
      'Vide-poche d''entrée « Teranga » — modèle 44 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 44 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 44,
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
    VALUES (v_product_id, '/products/5b3df704-1e48-4ec1-be11-950eab7ad873.png', 'Vide-poche d''entrée « Teranga » — modèle 44 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 45
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 45',
      '5b9ce444-17e8-4d0a-90a3-277a85b48b2f',
      'Vide-poche d''entrée « Teranga » — modèle 45 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 45 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 45,
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
    VALUES (v_product_id, '/products/5b9ce444-17e8-4d0a-90a3-277a85b48b2f.png', 'Vide-poche d''entrée « Teranga » — modèle 45 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 46
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 46',
      '5bf061a9-000d-425e-83f1-9f6cef4af25a',
      'Vide-poche d''entrée « Teranga » — modèle 46 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 46 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 46,
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
    VALUES (v_product_id, '/products/5bf061a9-000d-425e-83f1-9f6cef4af25a.png', 'Vide-poche d''entrée « Teranga » — modèle 46 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 47
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 47',
      '5c4cef1e-ac79-4e10-9226-0199b9b90b55',
      'Vide-poche d''entrée « Teranga » — modèle 47 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 47 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 47,
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
    VALUES (v_product_id, '/products/5c4cef1e-ac79-4e10-9226-0199b9b90b55.png', 'Vide-poche d''entrée « Teranga » — modèle 47 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 48
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 48',
      '5fe2299c-2058-45f1-953b-a5188cc3cbde',
      'Vide-poche d''entrée « Teranga » — modèle 48 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 48 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 48,
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
    VALUES (v_product_id, '/products/5fe2299c-2058-45f1-953b-a5188cc3cbde.png', 'Vide-poche d''entrée « Teranga » — modèle 48 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 49
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 49',
      '60160835-9fbe-4e59-a713-d919c6bd5c41',
      'Vide-poche d''entrée « Teranga » — modèle 49 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 49 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 49,
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
    VALUES (v_product_id, '/products/60160835-9fbe-4e59-a713-d919c6bd5c41.png', 'Vide-poche d''entrée « Teranga » — modèle 49 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 50
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 50',
      '638565cc-3fbe-4742-8025-2168256555d5',
      'Vide-poche d''entrée « Teranga » — modèle 50 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 50 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 50,
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
    VALUES (v_product_id, '/products/638565cc-3fbe-4742-8025-2168256555d5.png', 'Vide-poche d''entrée « Teranga » — modèle 50 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 51
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 51',
      '649f2ced-ce67-4d02-bbdb-2122c77ae275',
      'Vide-poche d''entrée « Teranga » — modèle 51 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 51 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 51,
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
    VALUES (v_product_id, '/products/649f2ced-ce67-4d02-bbdb-2122c77ae275.png', 'Vide-poche d''entrée « Teranga » — modèle 51 MUSE', true, 0);
  END IF;

  -- Supports QR boutique / Wave / Orange Money — modèle 2
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'supports-qr-paiement';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Supports QR boutique / Wave / Orange Money — modèle 2',
      '653c4bf4-7d0a-4d45-9676-4c8a37d75a0e',
      'Supports QR boutique / Wave / Orange Money — modèle 2 — collection MUSE, univers Supports QR boutique / Wave / Orange Money.',
      'Supports QR boutique / Wave / Orange Money — modèle 2 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Supports QR boutique / Wave / Orange Money ». Qualité premium, finitions soignées.',
      7000,
      'Sur mesure',
      '2-4 heures',
      'PLA+ ou PETG',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["logo boutique","couleur Wave/OM"]'::jsonb,
      'available', 'published', true, 2,
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
    VALUES (v_product_id, '/products/653c4bf4-7d0a-4d45-9676-4c8a37d75a0e.png', 'Supports QR boutique / Wave / Orange Money — modèle 2 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 52
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 52',
      '66b26fe6-ccf5-460b-8902-44d9bd58c5f6',
      'Vide-poche d''entrée « Teranga » — modèle 52 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 52 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 52,
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
    VALUES (v_product_id, '/products/66b26fe6-ccf5-460b-8902-44d9bd58c5f6.png', 'Vide-poche d''entrée « Teranga » — modèle 52 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 53
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 53',
      '670436f4-e5dc-41ee-a12c-0f5037cdf17b',
      'Vide-poche d''entrée « Teranga » — modèle 53 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 53 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 53,
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
    VALUES (v_product_id, '/products/670436f4-e5dc-41ee-a12c-0f5037cdf17b.png', 'Vide-poche d''entrée « Teranga » — modèle 53 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 54
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 54',
      '684045cb-cf90-4edf-9481-71fc5158ef56',
      'Vide-poche d''entrée « Teranga » — modèle 54 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 54 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 54,
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
    VALUES (v_product_id, '/products/684045cb-cf90-4edf-9481-71fc5158ef56.png', 'Vide-poche d''entrée « Teranga » — modèle 54 MUSE', true, 0);
  END IF;

  -- BMI RY OBJECT
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'BMI RY OBJECT',
      '6c385814-fd15-4826-89d5-663de9c1a679',
      'BMI RY OBJECT — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'BMI RY OBJECT conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 55,
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
    VALUES (v_product_id, '/products/6c385814-fd15-4826-89d5-663de9c1a679.png', 'BMI RY OBJECT MUSE', true, 0);
  END IF;

  -- Mini déco murale Sénégal — modèle 3
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'mini-deco-murale-senegal';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Mini déco murale Sénégal — modèle 3',
      '6d63f9fe-4ec4-48e7-90fe-7996cadfc587',
      'Mini déco murale Sénégal — modèle 3 — collection MUSE, univers Mini déco murale Sénégal.',
      'Mini déco murale Sénégal — modèle 3 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Mini déco murale Sénégal ». Qualité premium, finitions soignées.',
      10000,
      'Sur mesure',
      '4-7 heures',
      'PLA mat multicolore',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["symbole","couleur","taille"]'::jsonb,
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
    VALUES (v_product_id, '/products/6d63f9fe-4ec4-48e7-90fe-7996cadfc587.png', 'Mini déco murale Sénégal — modèle 3 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 56
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 56',
      '6e3b7dad-3db1-448c-b3df-d2eb565f3041',
      'Vide-poche d''entrée « Teranga » — modèle 56 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 56 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 56,
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
    VALUES (v_product_id, '/products/6e3b7dad-3db1-448c-b3df-d2eb565f3041.png', 'Vide-poche d''entrée « Teranga » — modèle 56 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 57
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 57',
      '6f81e766-2c98-42eb-9963-914a452ba95e',
      'Vide-poche d''entrée « Teranga » — modèle 57 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 57 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 57,
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
    VALUES (v_product_id, '/products/6f81e766-2c98-42eb-9963-914a452ba95e.png', 'Vide-poche d''entrée « Teranga » — modèle 57 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 58
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 58',
      '701e7cad-2e6f-4adb-8782-031d68758ec0',
      'Vide-poche d''entrée « Teranga » — modèle 58 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 58 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 58,
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
    VALUES (v_product_id, '/products/701e7cad-2e6f-4adb-8782-031d68758ec0.png', 'Vide-poche d''entrée « Teranga » — modèle 58 MUSE', true, 0);
  END IF;

  -- Ey 1 FL 2 LIVING ROOM ORGANIZER
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Ey 1 FL 2 LIVING ROOM ORGANIZER',
      '71b28e42-aaf9-4014-8309-f33ab41826a9',
      'Ey 1 FL 2 LIVING ROOM ORGANIZER — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Ey 1 FL 2 LIVING ROOM ORGANIZER conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 59,
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
    VALUES (v_product_id, '/products/71b28e42-aaf9-4014-8309-f33ab41826a9.png', 'Ey 1 FL 2 LIVING ROOM ORGANIZER MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 60
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 60',
      '71c76ed6-42d8-44c7-8f23-de6c8ad51861',
      'Vide-poche d''entrée « Teranga » — modèle 60 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 60 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 60,
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
    VALUES (v_product_id, '/products/71c76ed6-42d8-44c7-8f23-de6c8ad51861.png', 'Vide-poche d''entrée « Teranga » — modèle 60 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 61
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 61',
      '724c4222-7896-40ad-a6b8-dc042cfbf636',
      'Vide-poche d''entrée « Teranga » — modèle 61 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 61 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 61,
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
    VALUES (v_product_id, '/products/724c4222-7896-40ad-a6b8-dc042cfbf636.png', 'Vide-poche d''entrée « Teranga » — modèle 61 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 62
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 62',
      '72e33712-6df9-4227-9143-416e82e126cb',
      'Vide-poche d''entrée « Teranga » — modèle 62 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 62 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 62,
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
    VALUES (v_product_id, '/products/72e33712-6df9-4227-9143-416e82e126cb.png', 'Vide-poche d''entrée « Teranga » — modèle 62 MUSE', true, 0);
  END IF;

  -- A Sculptural Organizer That A TP N N 4 Y
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'A Sculptural Organizer That A TP N N 4 Y',
      '72fc7323-8a59-4003-a325-3bef4a09107c',
      'A Sculptural Organizer That A TP N N 4 Y — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'A Sculptural Organizer That A TP N N 4 Y conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 63,
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
    VALUES (v_product_id, '/products/72fc7323-8a59-4003-a325-3bef4a09107c.png', 'A Sculptural Organizer That A TP N N 4 Y MUSE', true, 0);
  END IF;

  -- COFFEE TABLE ORGANIZER
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'COFFEE TABLE ORGANIZER',
      '737e1d1d-c32f-4daa-b007-a6a3d933ef29',
      'COFFEE TABLE ORGANIZER — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'COFFEE TABLE ORGANIZER conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 64,
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
    VALUES (v_product_id, '/products/737e1d1d-c32f-4daa-b007-a6a3d933ef29.png', 'COFFEE TABLE ORGANIZER MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 65
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 65',
      '7411cb82-60c5-4e0a-86f7-5dee795a9150',
      'Vide-poche d''entrée « Teranga » — modèle 65 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 65 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 65,
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
    VALUES (v_product_id, '/products/7411cb82-60c5-4e0a-86f7-5dee795a9150.png', 'Vide-poche d''entrée « Teranga » — modèle 65 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 66
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 66',
      '7610c090-6736-443b-9936-68fbb7cac601',
      'Vide-poche d''entrée « Teranga » — modèle 66 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 66 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 66,
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
    VALUES (v_product_id, '/products/7610c090-6736-443b-9936-68fbb7cac601.png', 'Vide-poche d''entrée « Teranga » — modèle 66 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 67
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 67',
      '76ac758b-74a5-45d8-b764-2e97b0d1d74d',
      'Vide-poche d''entrée « Teranga » — modèle 67 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 67 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 67,
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
    VALUES (v_product_id, '/products/76ac758b-74a5-45d8-b764-2e97b0d1d74d.png', 'Vide-poche d''entrée « Teranga » — modèle 67 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 68
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 68',
      '772df2fc-0358-4d6f-abb6-c9d64c003421',
      'Vide-poche d''entrée « Teranga » — modèle 68 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 68 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 68,
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
    VALUES (v_product_id, '/products/772df2fc-0358-4d6f-abb6-c9d64c003421.png', 'Vide-poche d''entrée « Teranga » — modèle 68 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 69
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 69',
      '79679bd7-d285-4eb2-9815-7d4716c494d4',
      'Vide-poche d''entrée « Teranga » — modèle 69 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 69 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 69,
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
    VALUES (v_product_id, '/products/79679bd7-d285-4eb2-9815-7d4716c494d4.png', 'Vide-poche d''entrée « Teranga » — modèle 69 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 70
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 70',
      '797055d8-1423-4406-9e0b-b5b0e895a600',
      'Vide-poche d''entrée « Teranga » — modèle 70 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 70 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 70,
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
    VALUES (v_product_id, '/products/797055d8-1423-4406-9e0b-b5b0e895a600.png', 'Vide-poche d''entrée « Teranga » — modèle 70 MUSE', true, 0);
  END IF;

  -- VANITY & NIGHTSTAND ORGANIZER
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VANITY & NIGHTSTAND ORGANIZER',
      '7b7133f7-1fea-4ff0-a513-250c2b96ec00',
      'VANITY & NIGHTSTAND ORGANIZER — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'VANITY & NIGHTSTAND ORGANIZER conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 71,
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
    VALUES (v_product_id, '/products/7b7133f7-1fea-4ff0-a513-250c2b96ec00.png', 'VANITY & NIGHTSTAND ORGANIZER MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 72
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 72',
      '7c7a5280-5662-43e9-b1c9-e37a9c986183',
      'Vide-poche d''entrée « Teranga » — modèle 72 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 72 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 72,
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
    VALUES (v_product_id, '/products/7c7a5280-5662-43e9-b1c9-e37a9c986183.png', 'Vide-poche d''entrée « Teranga » — modèle 72 MUSE', true, 0);
  END IF;

  -- Jove Fo ENTRYWAY ORGANIZER
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'boite-a-cles-murale';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Jove Fo ENTRYWAY ORGANIZER',
      '7ce97648-f8c0-4e23-aa3a-8aded94732bc',
      'Jove Fo ENTRYWAY ORGANIZER — collection MUSE, univers Boîte à clés murale.',
      'Jove Fo ENTRYWAY ORGANIZER conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Boîte à clés murale ». Qualité premium, finitions soignées.',
      10000,
      'Sur mesure',
      '4-6 heures',
      'PLA+ ou PETG',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["nom","couleur","logo discret"]'::jsonb,
      'available', 'published', true, 2,
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
    VALUES (v_product_id, '/products/7ce97648-f8c0-4e23-aa3a-8aded94732bc.png', 'Jove Fo ENTRYWAY ORGANIZER MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 73
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 73',
      '7db3328e-e1de-4918-be3b-0449e053d25c',
      'Vide-poche d''entrée « Teranga » — modèle 73 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 73 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 73,
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
    VALUES (v_product_id, '/products/7db3328e-e1de-4918-be3b-0449e053d25c.png', 'Vide-poche d''entrée « Teranga » — modèle 73 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 74
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 74',
      '7ec427f0-9563-485d-aaa9-0d83640e2352',
      'Vide-poche d''entrée « Teranga » — modèle 74 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 74 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 74,
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
    VALUES (v_product_id, '/products/7ec427f0-9563-485d-aaa9-0d83640e2352.png', 'Vide-poche d''entrée « Teranga » — modèle 74 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 75
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 75',
      '808ac9ed-e725-430b-ac6e-af6b42a3a054',
      'Vide-poche d''entrée « Teranga » — modèle 75 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 75 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 75,
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
    VALUES (v_product_id, '/products/808ac9ed-e725-430b-ac6e-af6b42a3a054.png', 'Vide-poche d''entrée « Teranga » — modèle 75 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 76
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 76',
      '84bda87e-9dac-4f7a-b39b-aa812d52fa3f',
      'Vide-poche d''entrée « Teranga » — modèle 76 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 76 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 76,
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
    VALUES (v_product_id, '/products/84bda87e-9dac-4f7a-b39b-aa812d52fa3f.png', 'Vide-poche d''entrée « Teranga » — modèle 76 MUSE', true, 0);
  END IF;

  -- Mini déco murale Sénégal — modèle 4
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'mini-deco-murale-senegal';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Mini déco murale Sénégal — modèle 4',
      '85819db2-7dcc-463d-b7e1-1e499b07003f',
      'Mini déco murale Sénégal — modèle 4 — collection MUSE, univers Mini déco murale Sénégal.',
      'Mini déco murale Sénégal — modèle 4 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Mini déco murale Sénégal ». Qualité premium, finitions soignées.',
      10000,
      'Sur mesure',
      '4-7 heures',
      'PLA mat multicolore',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["symbole","couleur","taille"]'::jsonb,
      'available', 'published', false, 4,
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
    VALUES (v_product_id, '/products/85819db2-7dcc-463d-b7e1-1e499b07003f.png', 'Mini déco murale Sénégal — modèle 4 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 77
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 77',
      '8591e1a1-052c-4691-a119-87a051468180',
      'Vide-poche d''entrée « Teranga » — modèle 77 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 77 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 77,
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
    VALUES (v_product_id, '/products/8591e1a1-052c-4691-a119-87a051468180.png', 'Vide-poche d''entrée « Teranga » — modèle 77 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 78
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 78',
      '867e9ed3-19fc-4035-aa1e-a20639f744d3',
      'Vide-poche d''entrée « Teranga » — modèle 78 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 78 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 78,
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
    VALUES (v_product_id, '/products/867e9ed3-19fc-4035-aa1e-a20639f744d3.png', 'Vide-poche d''entrée « Teranga » — modèle 78 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 79
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 79',
      '87a930a8-ed5f-4690-960a-2675996ad22a',
      'Vide-poche d''entrée « Teranga » — modèle 79 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 79 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 79,
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
    VALUES (v_product_id, '/products/87a930a8-ed5f-4690-960a-2675996ad22a.png', 'Vide-poche d''entrée « Teranga » — modèle 79 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 80
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 80',
      '897f4b4b-5cb5-4f65-b960-166aab3a8747',
      'Vide-poche d''entrée « Teranga » — modèle 80 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 80 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 80,
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
    VALUES (v_product_id, '/products/897f4b4b-5cb5-4f65-b960-166aab3a8747.png', 'Vide-poche d''entrée « Teranga » — modèle 80 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 81
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 81',
      '89f83c9e-97fb-4f65-b8b4-367c4621449d',
      'Vide-poche d''entrée « Teranga » — modèle 81 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 81 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 81,
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
    VALUES (v_product_id, '/products/89f83c9e-97fb-4f65-b8b4-367c4621449d.png', 'Vide-poche d''entrée « Teranga » — modèle 81 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 82
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 82',
      '8d2a271c-66b9-4b1e-b95f-f4c20dd0e216',
      'Vide-poche d''entrée « Teranga » — modèle 82 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 82 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 82,
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
    VALUES (v_product_id, '/products/8d2a271c-66b9-4b1e-b95f-f4c20dd0e216.png', 'Vide-poche d''entrée « Teranga » — modèle 82 MUSE', true, 0);
  END IF;

  -- Mini déco murale Sénégal — modèle 5
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'mini-deco-murale-senegal';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Mini déco murale Sénégal — modèle 5',
      '8de3a8ee-a533-49c3-b8fb-f74e29289d90',
      'Mini déco murale Sénégal — modèle 5 — collection MUSE, univers Mini déco murale Sénégal.',
      'Mini déco murale Sénégal — modèle 5 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Mini déco murale Sénégal ». Qualité premium, finitions soignées.',
      10000,
      'Sur mesure',
      '4-7 heures',
      'PLA mat multicolore',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["symbole","couleur","taille"]'::jsonb,
      'available', 'published', false, 5,
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
    VALUES (v_product_id, '/products/8de3a8ee-a533-49c3-b8fb-f74e29289d90.png', 'Mini déco murale Sénégal — modèle 5 MUSE', true, 0);
  END IF;

  -- COFFEE CORNER ORGANIZER
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'muse-kitchen';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'COFFEE CORNER ORGANIZER',
      '8e184616-6c41-40ac-b01c-62e6b7a71b4a',
      'COFFEE CORNER ORGANIZER — collection MUSE, univers MUSE Kitchen / Organisateurs cuisine.',
      'COFFEE CORNER ORGANIZER conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « MUSE Kitchen / Organisateurs cuisine ». Qualité premium, finitions soignées.',
      12000,
      'Sur mesure',
      '5-8 heures',
      'PETG ou ASA recommandé',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["couleur","logo MUSE","configuration"]'::jsonb,
      'available', 'published', false, 6,
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
    VALUES (v_product_id, '/products/8e184616-6c41-40ac-b01c-62e6b7a71b4a.png', 'COFFEE CORNER ORGANIZER MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 83
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 83',
      '8e606702-c3b2-4b1f-bf04-38bc9bdfd24d',
      'Vide-poche d''entrée « Teranga » — modèle 83 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 83 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 83,
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
    VALUES (v_product_id, '/products/8e606702-c3b2-4b1f-bf04-38bc9bdfd24d.png', 'Vide-poche d''entrée « Teranga » — modèle 83 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 84
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 84',
      '8e9df991-5404-4c6a-ade9-cb19e259bb94',
      'Vide-poche d''entrée « Teranga » — modèle 84 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 84 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 84,
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
    VALUES (v_product_id, '/products/8e9df991-5404-4c6a-ade9-cb19e259bb94.png', 'Vide-poche d''entrée « Teranga » — modèle 84 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 85
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 85',
      '8f2dd6ab-ce35-499a-8593-2fc9cb4cda5c',
      'Vide-poche d''entrée « Teranga » — modèle 85 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 85 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 85,
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
    VALUES (v_product_id, '/products/8f2dd6ab-ce35-499a-8593-2fc9cb4cda5c.png', 'Vide-poche d''entrée « Teranga » — modèle 85 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 86
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 86',
      '8fb8ee7d-87ea-460f-9f38-56c9da4e58ee',
      'Vide-poche d''entrée « Teranga » — modèle 86 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 86 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 86,
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
    VALUES (v_product_id, '/products/8fb8ee7d-87ea-460f-9f38-56c9da4e58ee.png', 'Vide-poche d''entrée « Teranga » — modèle 86 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 87
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 87',
      '8fc36753-9cc5-4a4f-8dda-dc4851d93479',
      'Vide-poche d''entrée « Teranga » — modèle 87 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 87 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 87,
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
    VALUES (v_product_id, '/products/8fc36753-9cc5-4a4f-8dda-dc4851d93479.png', 'Vide-poche d''entrée « Teranga » — modèle 87 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 88
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 88',
      '900bbe02-30cd-463b-ab6e-2d65075b5110',
      'Vide-poche d''entrée « Teranga » — modèle 88 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 88 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 88,
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
    VALUES (v_product_id, '/products/900bbe02-30cd-463b-ab6e-2d65075b5110.png', 'Vide-poche d''entrée « Teranga » — modèle 88 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 89
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 89',
      '91c140fc-9200-44bb-9b14-63e1b0f221e4',
      'Vide-poche d''entrée « Teranga » — modèle 89 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 89 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 89,
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
    VALUES (v_product_id, '/products/91c140fc-9200-44bb-9b14-63e1b0f221e4.png', 'Vide-poche d''entrée « Teranga » — modèle 89 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 90
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 90',
      '91eadfe6-5112-498d-a845-dbd1a042e2c6',
      'Vide-poche d''entrée « Teranga » — modèle 90 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 90 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 90,
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
    VALUES (v_product_id, '/products/91eadfe6-5112-498d-a845-dbd1a042e2c6.png', 'Vide-poche d''entrée « Teranga » — modèle 90 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 91
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 91',
      '92169e75-5489-48c8-a122-afc85d748406',
      'Vide-poche d''entrée « Teranga » — modèle 91 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 91 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 91,
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
    VALUES (v_product_id, '/products/92169e75-5489-48c8-a122-afc85d748406.png', 'Vide-poche d''entrée « Teranga » — modèle 91 MUSE', true, 0);
  END IF;

  -- Porte-moussor / porte-foulards mural — modèle 1
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'porte-moussor-foulards';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Porte-moussor / porte-foulards mural — modèle 1',
      '935c622f-5ccd-4154-bb16-c13d3297da03',
      'Porte-moussor / porte-foulards mural — modèle 1 — collection MUSE, univers Porte-moussor / porte-foulards mural.',
      'Porte-moussor / porte-foulards mural — modèle 1 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Porte-moussor / porte-foulards mural ». Qualité premium, finitions soignées.',
      10000,
      'Sur mesure',
      '4-6 heures',
      'PLA mat',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["couleur","motif"]'::jsonb,
      'available', 'published', true, 1,
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
    VALUES (v_product_id, '/products/935c622f-5ccd-4154-bb16-c13d3297da03.png', 'Porte-moussor / porte-foulards mural — modèle 1 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 92
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 92',
      '95e4bc36-204f-4be5-81b9-d00f62356092',
      'Vide-poche d''entrée « Teranga » — modèle 92 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 92 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 92,
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
    VALUES (v_product_id, '/products/95e4bc36-204f-4be5-81b9-d00f62356092.png', 'Vide-poche d''entrée « Teranga » — modèle 92 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 93
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 93',
      '9605307e-6dcd-4ff8-a852-9e55ca04d5ce',
      'Vide-poche d''entrée « Teranga » — modèle 93 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 93 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 93,
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
    VALUES (v_product_id, '/products/9605307e-6dcd-4ff8-a852-9e55ca04d5ce.png', 'Vide-poche d''entrée « Teranga » — modèle 93 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 94
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 94',
      '98bb90d8-7c18-41a3-994d-8f82b58b5adb',
      'Vide-poche d''entrée « Teranga » — modèle 94 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 94 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 94,
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
    VALUES (v_product_id, '/products/98bb90d8-7c18-41a3-994d-8f82b58b5adb.png', 'Vide-poche d''entrée « Teranga » — modèle 94 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 95
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 95',
      '9b333ee9-7dfc-4b8e-9852-0e513852d9cc',
      'Vide-poche d''entrée « Teranga » — modèle 95 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 95 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 95,
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
    VALUES (v_product_id, '/products/9b333ee9-7dfc-4b8e-9852-0e513852d9cc.png', 'Vide-poche d''entrée « Teranga » — modèle 95 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 96
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 96',
      '9b836607-44a1-46a3-baf4-c4bd214485bf',
      'Vide-poche d''entrée « Teranga » — modèle 96 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 96 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 96,
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
    VALUES (v_product_id, '/products/9b836607-44a1-46a3-baf4-c4bd214485bf.png', 'Vide-poche d''entrée « Teranga » — modèle 96 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 97
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 97',
      '9de9b67f-e0f4-457b-91dc-303ad11cfc3e',
      'Vide-poche d''entrée « Teranga » — modèle 97 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 97 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 97,
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
    VALUES (v_product_id, '/products/9de9b67f-e0f4-457b-91dc-303ad11cfc3e.png', 'Vide-poche d''entrée « Teranga » — modèle 97 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 98
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 98',
      '9f7145eb-8c11-419b-8403-ae42d7517231',
      'Vide-poche d''entrée « Teranga » — modèle 98 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 98 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 98,
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
    VALUES (v_product_id, '/products/9f7145eb-8c11-419b-8403-ae42d7517231.png', 'Vide-poche d''entrée « Teranga » — modèle 98 MUSE', true, 0);
  END IF;

  -- BEDSIDE ORGANIZER A LY
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'BEDSIDE ORGANIZER A LY',
      'a0088906-05b5-49b5-9882-dc3e456d3948',
      'BEDSIDE ORGANIZER A LY — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'BEDSIDE ORGANIZER A LY conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 99,
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
    VALUES (v_product_id, '/products/a0088906-05b5-49b5-9882-dc3e456d3948.png', 'BEDSIDE ORGANIZER A LY MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 100
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 100',
      'a011018a-c171-440d-8482-14b7a91ef168',
      'Vide-poche d''entrée « Teranga » — modèle 100 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 100 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 100,
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
    VALUES (v_product_id, '/products/a011018a-c171-440d-8482-14b7a91ef168.png', 'Vide-poche d''entrée « Teranga » — modèle 100 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 101
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 101',
      'a184538c-9616-4bee-8c4c-efdb07a12a54',
      'Vide-poche d''entrée « Teranga » — modèle 101 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 101 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 101,
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
    VALUES (v_product_id, '/products/a184538c-9616-4bee-8c4c-efdb07a12a54.png', 'Vide-poche d''entrée « Teranga » — modèle 101 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 102
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 102',
      'a19fa959-fb26-4cf9-946f-c8ba57aa2045',
      'Vide-poche d''entrée « Teranga » — modèle 102 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 102 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 102,
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
    VALUES (v_product_id, '/products/a19fa959-fb26-4cf9-946f-c8ba57aa2045.png', 'Vide-poche d''entrée « Teranga » — modèle 102 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 103
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 103',
      'a2a80360-15fb-47b2-b332-05f8c6e1940a',
      'Vide-poche d''entrée « Teranga » — modèle 103 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 103 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
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
    VALUES (v_product_id, '/products/a2a80360-15fb-47b2-b332-05f8c6e1940a.png', 'Vide-poche d''entrée « Teranga » — modèle 103 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 104
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 104',
      'a2b9112b-761b-4b67-8fec-b84df880d028',
      'Vide-poche d''entrée « Teranga » — modèle 104 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 104 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
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
    VALUES (v_product_id, '/products/a2b9112b-761b-4b67-8fec-b84df880d028.png', 'Vide-poche d''entrée « Teranga » — modèle 104 MUSE', true, 0);
  END IF;

  -- BF CFRVING & UTENSIL ORGANIZER
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'muse-kitchen';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'BF CFRVING & UTENSIL ORGANIZER',
      'a305ce2a-a358-4bd8-b0b3-686784c36006',
      'BF CFRVING & UTENSIL ORGANIZER — collection MUSE, univers MUSE Kitchen / Organisateurs cuisine.',
      'BF CFRVING & UTENSIL ORGANIZER conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « MUSE Kitchen / Organisateurs cuisine ». Qualité premium, finitions soignées.',
      12000,
      'Sur mesure',
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
    VALUES (v_product_id, '/products/a305ce2a-a358-4bd8-b0b3-686784c36006.png', 'BF CFRVING & UTENSIL ORGANIZER MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 105
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 105',
      'a366d601-9ec9-41a1-8212-6f69c382a39e',
      'Vide-poche d''entrée « Teranga » — modèle 105 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 105 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
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
    VALUES (v_product_id, '/products/a366d601-9ec9-41a1-8212-6f69c382a39e.png', 'Vide-poche d''entrée « Teranga » — modèle 105 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 106
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 106',
      'a3c526c3-ac31-47cc-aa77-fa767aceef73',
      'Vide-poche d''entrée « Teranga » — modèle 106 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 106 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
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
    VALUES (v_product_id, '/products/a3c526c3-ac31-47cc-aa77-fa767aceef73.png', 'Vide-poche d''entrée « Teranga » — modèle 106 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 107
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 107',
      'a4a9b546-0014-4dc7-a98c-c15cdec1e597',
      'Vide-poche d''entrée « Teranga » — modèle 107 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 107 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
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
    VALUES (v_product_id, '/products/a4a9b546-0014-4dc7-a98c-c15cdec1e597.png', 'Vide-poche d''entrée « Teranga » — modèle 107 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 108
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 108',
      'a5512a9e-4845-47e1-993f-843eec3df7af',
      'Vide-poche d''entrée « Teranga » — modèle 108 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 108 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
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
    VALUES (v_product_id, '/products/a5512a9e-4845-47e1-993f-843eec3df7af.png', 'Vide-poche d''entrée « Teranga » — modèle 108 MUSE', true, 0);
  END IF;

  -- ENTRY COLLECTION
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'boite-a-cles-murale';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'ENTRY COLLECTION',
      'a55ac68b-d034-451f-997b-04b1ee2e6ecd',
      'ENTRY COLLECTION — collection MUSE, univers Boîte à clés murale.',
      'ENTRY COLLECTION conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Boîte à clés murale ». Qualité premium, finitions soignées.',
      10000,
      'Sur mesure',
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
    VALUES (v_product_id, '/products/a55ac68b-d034-451f-997b-04b1ee2e6ecd.png', 'ENTRY COLLECTION MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 109
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 109',
      'aa7c6b02-b712-4c8b-b677-a2ade3da33f6',
      'Vide-poche d''entrée « Teranga » — modèle 109 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 109 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
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
    VALUES (v_product_id, '/products/aa7c6b02-b712-4c8b-b677-a2ade3da33f6.png', 'Vide-poche d''entrée « Teranga » — modèle 109 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 110
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 110',
      'ab1d4e83-2811-436b-a80f-bf74280a5e11',
      'Vide-poche d''entrée « Teranga » — modèle 110 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 110 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
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
    VALUES (v_product_id, '/products/ab1d4e83-2811-436b-a80f-bf74280a5e11.png', 'Vide-poche d''entrée « Teranga » — modèle 110 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 111
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 111',
      'ab9e2db7-a338-4bfd-9e8e-114d8d95aa11',
      'Vide-poche d''entrée « Teranga » — modèle 111 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 111 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
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
    VALUES (v_product_id, '/products/ab9e2db7-a338-4bfd-9e8e-114d8d95aa11.png', 'Vide-poche d''entrée « Teranga » — modèle 111 MUSE', true, 0);
  END IF;

  -- 1 7 PEINITRY COLLECTION
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '1 7 PEINITRY COLLECTION',
      'ac15af47-9483-4245-be1a-e7b81639cf3c',
      '1 7 PEINITRY COLLECTION — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      '1 7 PEINITRY COLLECTION conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
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
    VALUES (v_product_id, '/products/ac15af47-9483-4245-be1a-e7b81639cf3c.png', '1 7 PEINITRY COLLECTION MUSE', true, 0);
  END IF;

  -- BEDSIDE VALET ORGANIZER
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'BEDSIDE VALET ORGANIZER',
      'ae78975c-5146-40a5-be16-957a616ebe85',
      'BEDSIDE VALET ORGANIZER — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'BEDSIDE VALET ORGANIZER conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
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
    VALUES (v_product_id, '/products/ae78975c-5146-40a5-be16-957a616ebe85.png', 'BEDSIDE VALET ORGANIZER MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 114
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 114',
      'aeac0923-8444-4a9b-ba94-5089e2662a47',
      'Vide-poche d''entrée « Teranga » — modèle 114 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 114 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
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
    VALUES (v_product_id, '/products/aeac0923-8444-4a9b-ba94-5089e2662a47.png', 'Vide-poche d''entrée « Teranga » — modèle 114 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 115
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 115',
      'af63541c-e6eb-41c4-9634-d727f0726fce',
      'Vide-poche d''entrée « Teranga » — modèle 115 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 115 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
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
    VALUES (v_product_id, '/products/af63541c-e6eb-41c4-9634-d727f0726fce.png', 'Vide-poche d''entrée « Teranga » — modèle 115 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 116
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 116',
      'afbc33c6-bb54-41c1-8ca5-d6003c5cd4ab',
      'Vide-poche d''entrée « Teranga » — modèle 116 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 116 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
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
    VALUES (v_product_id, '/products/afbc33c6-bb54-41c1-8ca5-d6003c5cd4ab.png', 'Vide-poche d''entrée « Teranga » — modèle 116 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 117
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 117',
      'b0d30119-41fe-490a-8738-88ae86c20ca7',
      'Vide-poche d''entrée « Teranga » — modèle 117 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 117 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
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
    VALUES (v_product_id, '/products/b0d30119-41fe-490a-8738-88ae86c20ca7.png', 'Vide-poche d''entrée « Teranga » — modèle 117 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 118
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 118',
      'b1c39a0a-01e0-409c-b560-080e12953a42',
      'Vide-poche d''entrée « Teranga » — modèle 118 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 118 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
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
    VALUES (v_product_id, '/products/b1c39a0a-01e0-409c-b560-080e12953a42.png', 'Vide-poche d''entrée « Teranga » — modèle 118 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 119
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 119',
      'b2dd3074-9c51-4ad7-aac8-5f78977697a3',
      'Vide-poche d''entrée « Teranga » — modèle 119 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 119 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
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
    VALUES (v_product_id, '/products/b2dd3074-9c51-4ad7-aac8-5f78977697a3.png', 'Vide-poche d''entrée « Teranga » — modèle 119 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 120
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 120',
      'b34f15dd-a5e1-4995-9d99-491095db3553',
      'Vide-poche d''entrée « Teranga » — modèle 120 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 120 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
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
    VALUES (v_product_id, '/products/b34f15dd-a5e1-4995-9d99-491095db3553.png', 'Vide-poche d''entrée « Teranga » — modèle 120 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 121
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 121',
      'b38e82f6-233f-4ed6-81f9-8f3c0bb2c679',
      'Vide-poche d''entrée « Teranga » — modèle 121 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 121 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
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
    VALUES (v_product_id, '/products/b38e82f6-233f-4ed6-81f9-8f3c0bb2c679.png', 'Vide-poche d''entrée « Teranga » — modèle 121 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 122
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 122',
      'babf43a8-fd2a-4b46-b6da-d41720c83698',
      'Vide-poche d''entrée « Teranga » — modèle 122 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 122 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
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
    VALUES (v_product_id, '/products/babf43a8-fd2a-4b46-b6da-d41720c83698.png', 'Vide-poche d''entrée « Teranga » — modèle 122 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 123
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 123',
      'bcafd4d0-104b-434e-881c-062a741e8ec7',
      'Vide-poche d''entrée « Teranga » — modèle 123 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 123 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
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
    VALUES (v_product_id, '/products/bcafd4d0-104b-434e-881c-062a741e8ec7.png', 'Vide-poche d''entrée « Teranga » — modèle 123 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 124
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 124',
      'bd82a04f-c4ad-499d-abcb-9aaf5d0cd43c',
      'Vide-poche d''entrée « Teranga » — modèle 124 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 124 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
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
    VALUES (v_product_id, '/products/bd82a04f-c4ad-499d-abcb-9aaf5d0cd43c.png', 'Vide-poche d''entrée « Teranga » — modèle 124 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 125
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 125',
      'bf0fe373-435d-4101-bda3-b5e28e74770e',
      'Vide-poche d''entrée « Teranga » — modèle 125 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 125 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
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
    VALUES (v_product_id, '/products/bf0fe373-435d-4101-bda3-b5e28e74770e.png', 'Vide-poche d''entrée « Teranga » — modèle 125 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 126
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 126',
      'bf9ca937-ccf7-4002-8172-25a2f07f21c3',
      'Vide-poche d''entrée « Teranga » — modèle 126 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 126 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
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
    VALUES (v_product_id, '/products/bf9ca937-ccf7-4002-8172-25a2f07f21c3.png', 'Vide-poche d''entrée « Teranga » — modèle 126 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 127
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 127',
      'c366a081-8156-4759-bb7d-1ceba6114f80',
      'Vide-poche d''entrée « Teranga » — modèle 127 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 127 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
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
    VALUES (v_product_id, '/products/c366a081-8156-4759-bb7d-1ceba6114f80.png', 'Vide-poche d''entrée « Teranga » — modèle 127 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 128
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 128',
      'c37d55f1-434d-4af5-bb9f-ca04d9953359',
      'Vide-poche d''entrée « Teranga » — modèle 128 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 128 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
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
    VALUES (v_product_id, '/products/c37d55f1-434d-4af5-bb9f-ca04d9953359.png', 'Vide-poche d''entrée « Teranga » — modèle 128 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 129
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 129',
      'c3f0d579-c06c-41e2-a1b7-1d020ea8c4f9',
      'Vide-poche d''entrée « Teranga » — modèle 129 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 129 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
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
    VALUES (v_product_id, '/products/c3f0d579-c06c-41e2-a1b7-1d020ea8c4f9.png', 'Vide-poche d''entrée « Teranga » — modèle 129 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 130
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 130',
      'c703c001-df0e-41ec-b0c4-b5915972d50f',
      'Vide-poche d''entrée « Teranga » — modèle 130 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 130 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
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
    VALUES (v_product_id, '/products/c703c001-df0e-41ec-b0c4-b5915972d50f.png', 'Vide-poche d''entrée « Teranga » — modèle 130 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 131
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 131',
      'c77bc1fb-9aca-4e66-aa37-476088afbd3e',
      'Vide-poche d''entrée « Teranga » — modèle 131 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 131 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
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
    VALUES (v_product_id, '/products/c77bc1fb-9aca-4e66-aa37-476088afbd3e.png', 'Vide-poche d''entrée « Teranga » — modèle 131 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 132
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 132',
      'c850853b-9f49-47f2-9cf1-913aa40f7238',
      'Vide-poche d''entrée « Teranga » — modèle 132 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 132 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
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
    VALUES (v_product_id, '/products/c850853b-9f49-47f2-9cf1-913aa40f7238.png', 'Vide-poche d''entrée « Teranga » — modèle 132 MUSE', true, 0);
  END IF;

  -- Ca RIL & GLASSES ORGANIZER
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'muse-kitchen';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Ca RIL & GLASSES ORGANIZER',
      'c98d8d49-f055-49f6-bb2e-d1227b98534a',
      'Ca RIL & GLASSES ORGANIZER — collection MUSE, univers MUSE Kitchen / Organisateurs cuisine.',
      'Ca RIL & GLASSES ORGANIZER conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « MUSE Kitchen / Organisateurs cuisine ». Qualité premium, finitions soignées.',
      12000,
      'Sur mesure',
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
    VALUES (v_product_id, '/products/c98d8d49-f055-49f6-bb2e-d1227b98534a.png', 'Ca RIL & GLASSES ORGANIZER MUSE', true, 0);
  END IF;

  -- LIVING OBJECT
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'LIVING OBJECT',
      'cc059606-76f0-449d-bc8c-1adfb240fdd1',
      'LIVING OBJECT — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'LIVING OBJECT conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
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
    VALUES (v_product_id, '/products/cc059606-76f0-449d-bc8c-1adfb240fdd1.png', 'LIVING OBJECT MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 134
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 134',
      'cc4ca1dc-3230-4ba5-9dff-8e12ef359d36',
      'Vide-poche d''entrée « Teranga » — modèle 134 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 134 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
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
    VALUES (v_product_id, '/products/cc4ca1dc-3230-4ba5-9dff-8e12ef359d36.png', 'Vide-poche d''entrée « Teranga » — modèle 134 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 135
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 135',
      'cdf4ec48-990d-44c5-89ed-477374f1ad18',
      'Vide-poche d''entrée « Teranga » — modèle 135 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 135 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
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
    VALUES (v_product_id, '/products/cdf4ec48-990d-44c5-89ed-477374f1ad18.png', 'Vide-poche d''entrée « Teranga » — modèle 135 MUSE', true, 0);
  END IF;

  -- Vide-poche d'entrée « Teranga » — modèle 136
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Vide-poche d''entrée « Teranga » — modèle 136',
      'cee234a2-2627-4147-b51b-b24501d312a9',
      'Vide-poche d''entrée « Teranga » — modèle 136 — collection MUSE, univers Vide-poche d''entrée « Teranga ».',
      'Vide-poche d''entrée « Teranga » — modèle 136 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Vide-poche d''entrée « Teranga » ». Qualité premium, finitions soignées.',
      9000,
      'Sur mesure',
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
    VALUES (v_product_id, '/products/cee234a2-2627-4147-b51b-b24501d312a9.png', 'Vide-poche d''entrée « Teranga » — modèle 136 MUSE', true, 0);
  END IF;

  -- Supports QR boutique / Wave / Orange Money — modèle 3
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'supports-qr-paiement';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'Supports QR boutique / Wave / Orange Money — modèle 3',
      'cfac250a-62fa-4b8d-b9ad-b1381f9e1ba9',
      'Supports QR boutique / Wave / Orange Money — modèle 3 — collection MUSE, univers Supports QR boutique / Wave / Orange Money.',
      'Supports QR boutique / Wave / Orange Money — modèle 3 conçu et imprimé en 3D par MUSE. Pièce personnalisable (couleur, finition, texte) de l''univers « Supports QR boutique / Wave / Orange Money ». Qualité premium, finitions soignées.',
      7000,
      'Sur mesure',
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
    VALUES (v_product_id, '/products/cfac250a-62fa-4b8d-b9ad-b1381f9e1ba9.png', 'Supports QR boutique / Wave / Orange Money — modèle 3 MUSE', true, 0);
  END IF;

END $$;