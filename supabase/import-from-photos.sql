-- Import automatique photos MUSE
-- Exécutez dans Supabase → SQL Editor

DO $$
DECLARE
  v_universe_id UUID;
  v_product_id UUID;
BEGIN
  -- 041e83b9 7b28 443f B28e 4f601b679fcb
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '041e83b9 7b28 443f B28e 4f601b679fcb',
      '041e83b9-7b28-443f-b28e-4f601b679fcb',
      '041e83b9 7b28 443f B28e 4f601b679fcb — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '041e83b9 7b28 443f B28e 4f601b679fcb est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/041e83b9-7b28-443f-b28e-4f601b679fcb.png', '041e83b9 7b28 443f B28e 4f601b679fcb MUSE', true, 0);
  END IF;

  -- 073c62dd 6152 42ca Ae44 3126f844d0ed
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '073c62dd 6152 42ca Ae44 3126f844d0ed',
      '073c62dd-6152-42ca-ae44-3126f844d0ed',
      '073c62dd 6152 42ca Ae44 3126f844d0ed — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '073c62dd 6152 42ca Ae44 3126f844d0ed est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/073c62dd-6152-42ca-ae44-3126f844d0ed.png', '073c62dd 6152 42ca Ae44 3126f844d0ed MUSE', true, 0);
  END IF;

  -- 0acd14a7 Edee 4835 91b9 827940eee419
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '0acd14a7 Edee 4835 91b9 827940eee419',
      '0acd14a7-edee-4835-91b9-827940eee419',
      '0acd14a7 Edee 4835 91b9 827940eee419 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '0acd14a7 Edee 4835 91b9 827940eee419 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/0acd14a7-edee-4835-91b9-827940eee419.png', '0acd14a7 Edee 4835 91b9 827940eee419 MUSE', true, 0);
  END IF;

  -- 0ddcd20a 32eb 494d 818b 740331ae89a0
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '0ddcd20a 32eb 494d 818b 740331ae89a0',
      '0ddcd20a-32eb-494d-818b-740331ae89a0',
      '0ddcd20a 32eb 494d 818b 740331ae89a0 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '0ddcd20a 32eb 494d 818b 740331ae89a0 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/0ddcd20a-32eb-494d-818b-740331ae89a0.png', '0ddcd20a 32eb 494d 818b 740331ae89a0 MUSE', true, 0);
  END IF;

  -- 0e45841b C406 46ff B016 2082d57770d4
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '0e45841b C406 46ff B016 2082d57770d4',
      '0e45841b-c406-46ff-b016-2082d57770d4',
      '0e45841b C406 46ff B016 2082d57770d4 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '0e45841b C406 46ff B016 2082d57770d4 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/0e45841b-c406-46ff-b016-2082d57770d4.png', '0e45841b C406 46ff B016 2082d57770d4 MUSE', true, 0);
  END IF;

  -- 0fba0202 0653 45eb 8c1d 974b08274d53
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '0fba0202 0653 45eb 8c1d 974b08274d53',
      '0fba0202-0653-45eb-8c1d-974b08274d53',
      '0fba0202 0653 45eb 8c1d 974b08274d53 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '0fba0202 0653 45eb 8c1d 974b08274d53 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/0fba0202-0653-45eb-8c1d-974b08274d53.png', '0fba0202 0653 45eb 8c1d 974b08274d53 MUSE', true, 0);
  END IF;

  -- 111bd4c1 55de 4e6b 9938 602cec04cd00
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'muse-kitchen';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '111bd4c1 55de 4e6b 9938 602cec04cd00',
      '111bd4c1-55de-4e6b-9938-602cec04cd00',
      '111bd4c1 55de 4e6b 9938 602cec04cd00 — objet personnalisable MUSE, univers « MUSE Kitchen / Organisateurs cuisine ».',
      '111bd4c1 55de 4e6b 9938 602cec04cd00 est conçu et imprimé en 3D par MUSE dans l''univers « MUSE Kitchen / Organisateurs cuisine ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      12000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/111bd4c1-55de-4e6b-9938-602cec04cd00.png', '111bd4c1 55de 4e6b 9938 602cec04cd00 MUSE', true, 0);
  END IF;

  -- 1346f3bb 2b57 4d9f 9e2d 51797e11bb78
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '1346f3bb 2b57 4d9f 9e2d 51797e11bb78',
      '1346f3bb-2b57-4d9f-9e2d-51797e11bb78',
      '1346f3bb 2b57 4d9f 9e2d 51797e11bb78 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '1346f3bb 2b57 4d9f 9e2d 51797e11bb78 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/1346f3bb-2b57-4d9f-9e2d-51797e11bb78.png', '1346f3bb 2b57 4d9f 9e2d 51797e11bb78 MUSE', true, 0);
  END IF;

  -- 15a0820e E669 4c4d 9c84 51cd133a0c0f
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '15a0820e E669 4c4d 9c84 51cd133a0c0f',
      '15a0820e-e669-4c4d-9c84-51cd133a0c0f',
      '15a0820e E669 4c4d 9c84 51cd133a0c0f — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '15a0820e E669 4c4d 9c84 51cd133a0c0f est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/15a0820e-e669-4c4d-9c84-51cd133a0c0f.png', '15a0820e E669 4c4d 9c84 51cd133a0c0f MUSE', true, 0);
  END IF;

  -- 1a007e80 9d3d 4751 B882 6b5b63dcb733
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'support-bijoux-coiffeuse';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '1a007e80 9d3d 4751 B882 6b5b63dcb733',
      '1a007e80-9d3d-4751-b882-6b5b63dcb733',
      '1a007e80 9d3d 4751 B882 6b5b63dcb733 — objet personnalisable MUSE, univers « Support bijoux de coiffeuse ».',
      '1a007e80 9d3d 4751 B882 6b5b63dcb733 est conçu et imprimé en 3D par MUSE dans l''univers « Support bijoux de coiffeuse ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      12000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/1a007e80-9d3d-4751-b882-6b5b63dcb733.png', '1a007e80 9d3d 4751 B882 6b5b63dcb733 MUSE', true, 0);
  END IF;

  -- 1a4cd869 5e17 4689 Bb01 Fd44d50bc2b8
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '1a4cd869 5e17 4689 Bb01 Fd44d50bc2b8',
      '1a4cd869-5e17-4689-bb01-fd44d50bc2b8',
      '1a4cd869 5e17 4689 Bb01 Fd44d50bc2b8 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '1a4cd869 5e17 4689 Bb01 Fd44d50bc2b8 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/1a4cd869-5e17-4689-bb01-fd44d50bc2b8.png', '1a4cd869 5e17 4689 Bb01 Fd44d50bc2b8 MUSE', true, 0);
  END IF;

  -- 1bedd536 5f6d 4786 B101 056f1571cab7
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '1bedd536 5f6d 4786 B101 056f1571cab7',
      '1bedd536-5f6d-4786-b101-056f1571cab7',
      '1bedd536 5f6d 4786 B101 056f1571cab7 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '1bedd536 5f6d 4786 B101 056f1571cab7 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/1bedd536-5f6d-4786-b101-056f1571cab7.png', '1bedd536 5f6d 4786 B101 056f1571cab7 MUSE', true, 0);
  END IF;

  -- 1cfb5cb4 Db54 4739 8f2f 3a6aabfcc4cd
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '1cfb5cb4 Db54 4739 8f2f 3a6aabfcc4cd',
      '1cfb5cb4-db54-4739-8f2f-3a6aabfcc4cd',
      '1cfb5cb4 Db54 4739 8f2f 3a6aabfcc4cd — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '1cfb5cb4 Db54 4739 8f2f 3a6aabfcc4cd est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/1cfb5cb4-db54-4739-8f2f-3a6aabfcc4cd.png', '1cfb5cb4 Db54 4739 8f2f 3a6aabfcc4cd MUSE', true, 0);
  END IF;

  -- 1e140b2e 5656 4675 B52e 6de9d718a50c
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'supports-qr-paiement';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '1e140b2e 5656 4675 B52e 6de9d718a50c',
      '1e140b2e-5656-4675-b52e-6de9d718a50c',
      '1e140b2e 5656 4675 B52e 6de9d718a50c — objet personnalisable MUSE, univers « Supports QR boutique / Wave / Orange Money ».',
      '1e140b2e 5656 4675 B52e 6de9d718a50c est conçu et imprimé en 3D par MUSE dans l''univers « Supports QR boutique / Wave / Orange Money ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      7000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/1e140b2e-5656-4675-b52e-6de9d718a50c.png', '1e140b2e 5656 4675 B52e 6de9d718a50c MUSE', true, 0);
  END IF;

  -- 1f0b23e7 9f05 4bc7 A95c 3e5d3963cf06
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '1f0b23e7 9f05 4bc7 A95c 3e5d3963cf06',
      '1f0b23e7-9f05-4bc7-a95c-3e5d3963cf06',
      '1f0b23e7 9f05 4bc7 A95c 3e5d3963cf06 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '1f0b23e7 9f05 4bc7 A95c 3e5d3963cf06 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/1f0b23e7-9f05-4bc7-a95c-3e5d3963cf06.png', '1f0b23e7 9f05 4bc7 A95c 3e5d3963cf06 MUSE', true, 0);
  END IF;

  -- 2075d708 8839 4081 9b32 A1e9c3e9700b
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '2075d708 8839 4081 9b32 A1e9c3e9700b',
      '2075d708-8839-4081-9b32-a1e9c3e9700b',
      '2075d708 8839 4081 9b32 A1e9c3e9700b — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '2075d708 8839 4081 9b32 A1e9c3e9700b est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/2075d708-8839-4081-9b32-a1e9c3e9700b.png', '2075d708 8839 4081 9b32 A1e9c3e9700b MUSE', true, 0);
  END IF;

  -- 21e37ce8 6c82 4b14 B1e9 8509eaec8bdc
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '21e37ce8 6c82 4b14 B1e9 8509eaec8bdc',
      '21e37ce8-6c82-4b14-b1e9-8509eaec8bdc',
      '21e37ce8 6c82 4b14 B1e9 8509eaec8bdc — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '21e37ce8 6c82 4b14 B1e9 8509eaec8bdc est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/21e37ce8-6c82-4b14-b1e9-8509eaec8bdc.png', '21e37ce8 6c82 4b14 B1e9 8509eaec8bdc MUSE', true, 0);
  END IF;

  -- 242765f9 Fc7d 4909 Aa0b B67c66dc9a04
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'mini-deco-murale-senegal';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '242765f9 Fc7d 4909 Aa0b B67c66dc9a04',
      '242765f9-fc7d-4909-aa0b-b67c66dc9a04',
      '242765f9 Fc7d 4909 Aa0b B67c66dc9a04 — objet personnalisable MUSE, univers « Mini déco murale Sénégal ».',
      '242765f9 Fc7d 4909 Aa0b B67c66dc9a04 est conçu et imprimé en 3D par MUSE dans l''univers « Mini déco murale Sénégal ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      10000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/242765f9-fc7d-4909-aa0b-b67c66dc9a04.png', '242765f9 Fc7d 4909 Aa0b B67c66dc9a04 MUSE', true, 0);
  END IF;

  -- 25dee405 6dd3 4154 Bdc9 Aa16247dfb98
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '25dee405 6dd3 4154 Bdc9 Aa16247dfb98',
      '25dee405-6dd3-4154-bdc9-aa16247dfb98',
      '25dee405 6dd3 4154 Bdc9 Aa16247dfb98 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '25dee405 6dd3 4154 Bdc9 Aa16247dfb98 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/25dee405-6dd3-4154-bdc9-aa16247dfb98.png', '25dee405 6dd3 4154 Bdc9 Aa16247dfb98 MUSE', true, 0);
  END IF;

  -- 268f1631 Fd4c 4012 8451 1d4f3e2a21e7
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '268f1631 Fd4c 4012 8451 1d4f3e2a21e7',
      '268f1631-fd4c-4012-8451-1d4f3e2a21e7',
      '268f1631 Fd4c 4012 8451 1d4f3e2a21e7 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '268f1631 Fd4c 4012 8451 1d4f3e2a21e7 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/268f1631-fd4c-4012-8451-1d4f3e2a21e7.png', '268f1631 Fd4c 4012 8451 1d4f3e2a21e7 MUSE', true, 0);
  END IF;

  -- 290b28bd A15b 4b72 8b28 299f3de8abb2
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '290b28bd A15b 4b72 8b28 299f3de8abb2',
      '290b28bd-a15b-4b72-8b28-299f3de8abb2',
      '290b28bd A15b 4b72 8b28 299f3de8abb2 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '290b28bd A15b 4b72 8b28 299f3de8abb2 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/290b28bd-a15b-4b72-8b28-299f3de8abb2.png', '290b28bd A15b 4b72 8b28 299f3de8abb2 MUSE', true, 0);
  END IF;

  -- 2988ba56 051a 4276 Adeb 9162b85b36a5
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'muse-kitchen';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '2988ba56 051a 4276 Adeb 9162b85b36a5',
      '2988ba56-051a-4276-adeb-9162b85b36a5',
      '2988ba56 051a 4276 Adeb 9162b85b36a5 — objet personnalisable MUSE, univers « MUSE Kitchen / Organisateurs cuisine ».',
      '2988ba56 051a 4276 Adeb 9162b85b36a5 est conçu et imprimé en 3D par MUSE dans l''univers « MUSE Kitchen / Organisateurs cuisine ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      12000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/2988ba56-051a-4276-adeb-9162b85b36a5.png', '2988ba56 051a 4276 Adeb 9162b85b36a5 MUSE', true, 0);
  END IF;

  -- 2a676412 2db1 4b8e 8efe B0da9d1f8bac
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '2a676412 2db1 4b8e 8efe B0da9d1f8bac',
      '2a676412-2db1-4b8e-8efe-b0da9d1f8bac',
      '2a676412 2db1 4b8e 8efe B0da9d1f8bac — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '2a676412 2db1 4b8e 8efe B0da9d1f8bac est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/2a676412-2db1-4b8e-8efe-b0da9d1f8bac.png', '2a676412 2db1 4b8e 8efe B0da9d1f8bac MUSE', true, 0);
  END IF;

  -- 2bb50489 F1a2 4793 Af05 9979caffb5c3
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '2bb50489 F1a2 4793 Af05 9979caffb5c3',
      '2bb50489-f1a2-4793-af05-9979caffb5c3',
      '2bb50489 F1a2 4793 Af05 9979caffb5c3 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '2bb50489 F1a2 4793 Af05 9979caffb5c3 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/2bb50489-f1a2-4793-af05-9979caffb5c3.png', '2bb50489 F1a2 4793 Af05 9979caffb5c3 MUSE', true, 0);
  END IF;

  -- 2ea6406a 793d 494f 9420 588a4b90bf0c
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'muse-kitchen';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '2ea6406a 793d 494f 9420 588a4b90bf0c',
      '2ea6406a-793d-494f-9420-588a4b90bf0c',
      '2ea6406a 793d 494f 9420 588a4b90bf0c — objet personnalisable MUSE, univers « MUSE Kitchen / Organisateurs cuisine ».',
      '2ea6406a 793d 494f 9420 588a4b90bf0c est conçu et imprimé en 3D par MUSE dans l''univers « MUSE Kitchen / Organisateurs cuisine ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      12000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/2ea6406a-793d-494f-9420-588a4b90bf0c.png', '2ea6406a 793d 494f 9420 588a4b90bf0c MUSE', true, 0);
  END IF;

  -- 319774fd D4a4 40d1 8c8f 792dd7a826e5
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '319774fd D4a4 40d1 8c8f 792dd7a826e5',
      '319774fd-d4a4-40d1-8c8f-792dd7a826e5',
      '319774fd D4a4 40d1 8c8f 792dd7a826e5 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '319774fd D4a4 40d1 8c8f 792dd7a826e5 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/319774fd-d4a4-40d1-8c8f-792dd7a826e5.png', '319774fd D4a4 40d1 8c8f 792dd7a826e5 MUSE', true, 0);
  END IF;

  -- 3261cbd8 830f 4d86 Ae61 9dd27b0a79dc
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '3261cbd8 830f 4d86 Ae61 9dd27b0a79dc',
      '3261cbd8-830f-4d86-ae61-9dd27b0a79dc',
      '3261cbd8 830f 4d86 Ae61 9dd27b0a79dc — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '3261cbd8 830f 4d86 Ae61 9dd27b0a79dc est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/3261cbd8-830f-4d86-ae61-9dd27b0a79dc.png', '3261cbd8 830f 4d86 Ae61 9dd27b0a79dc MUSE', true, 0);
  END IF;

  -- 3409794b A37b 46ba 9309 C976278d45bd
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'support-bijoux-coiffeuse';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '3409794b A37b 46ba 9309 C976278d45bd',
      '3409794b-a37b-46ba-9309-c976278d45bd',
      '3409794b A37b 46ba 9309 C976278d45bd — objet personnalisable MUSE, univers « Support bijoux de coiffeuse ».',
      '3409794b A37b 46ba 9309 C976278d45bd est conçu et imprimé en 3D par MUSE dans l''univers « Support bijoux de coiffeuse ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      12000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/3409794b-a37b-46ba-9309-c976278d45bd.png', '3409794b A37b 46ba 9309 C976278d45bd MUSE', true, 0);
  END IF;

  -- 34ce5036 160d 41f1 88e7 14cc0e8738fb
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '34ce5036 160d 41f1 88e7 14cc0e8738fb',
      '34ce5036-160d-41f1-88e7-14cc0e8738fb',
      '34ce5036 160d 41f1 88e7 14cc0e8738fb — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '34ce5036 160d 41f1 88e7 14cc0e8738fb est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/34ce5036-160d-41f1-88e7-14cc0e8738fb.png', '34ce5036 160d 41f1 88e7 14cc0e8738fb MUSE', true, 0);
  END IF;

  -- 3754cc1b E544 42c5 991c 675b4054a3b4
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '3754cc1b E544 42c5 991c 675b4054a3b4',
      '3754cc1b-e544-42c5-991c-675b4054a3b4',
      '3754cc1b E544 42c5 991c 675b4054a3b4 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '3754cc1b E544 42c5 991c 675b4054a3b4 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/3754cc1b-e544-42c5-991c-675b4054a3b4.png', '3754cc1b E544 42c5 991c 675b4054a3b4 MUSE', true, 0);
  END IF;

  -- 3805ca06 C788 4f55 8c28 F6732a6b18af
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '3805ca06 C788 4f55 8c28 F6732a6b18af',
      '3805ca06-c788-4f55-8c28-f6732a6b18af',
      '3805ca06 C788 4f55 8c28 F6732a6b18af — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '3805ca06 C788 4f55 8c28 F6732a6b18af est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/3805ca06-c788-4f55-8c28-f6732a6b18af.png', '3805ca06 C788 4f55 8c28 F6732a6b18af MUSE', true, 0);
  END IF;

  -- 393bb64e Cc7f 4b79 B9aa 69174ef68399
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '393bb64e Cc7f 4b79 B9aa 69174ef68399',
      '393bb64e-cc7f-4b79-b9aa-69174ef68399',
      '393bb64e Cc7f 4b79 B9aa 69174ef68399 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '393bb64e Cc7f 4b79 B9aa 69174ef68399 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/393bb64e-cc7f-4b79-b9aa-69174ef68399.png', '393bb64e Cc7f 4b79 B9aa 69174ef68399 MUSE', true, 0);
  END IF;

  -- 3a974963 994b 49e0 A453 Ea3017c8e88e
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '3a974963 994b 49e0 A453 Ea3017c8e88e',
      '3a974963-994b-49e0-a453-ea3017c8e88e',
      '3a974963 994b 49e0 A453 Ea3017c8e88e — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '3a974963 994b 49e0 A453 Ea3017c8e88e est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/3a974963-994b-49e0-a453-ea3017c8e88e.png', '3a974963 994b 49e0 A453 Ea3017c8e88e MUSE', true, 0);
  END IF;

  -- 3aa7ce75 1e08 46d8 8135 1bbf1c3f4bac
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '3aa7ce75 1e08 46d8 8135 1bbf1c3f4bac',
      '3aa7ce75-1e08-46d8-8135-1bbf1c3f4bac',
      '3aa7ce75 1e08 46d8 8135 1bbf1c3f4bac — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '3aa7ce75 1e08 46d8 8135 1bbf1c3f4bac est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/3aa7ce75-1e08-46d8-8135-1bbf1c3f4bac.png', '3aa7ce75 1e08 46d8 8135 1bbf1c3f4bac MUSE', true, 0);
  END IF;

  -- 3fd6c3cb 893d 44d3 B208 Cc599ce892e0
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '3fd6c3cb 893d 44d3 B208 Cc599ce892e0',
      '3fd6c3cb-893d-44d3-b208-cc599ce892e0',
      '3fd6c3cb 893d 44d3 B208 Cc599ce892e0 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '3fd6c3cb 893d 44d3 B208 Cc599ce892e0 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/3fd6c3cb-893d-44d3-b208-cc599ce892e0.png', '3fd6c3cb 893d 44d3 B208 Cc599ce892e0 MUSE', true, 0);
  END IF;

  -- 406bb427 B3cc 428d 8bfb B59023cdf558
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '406bb427 B3cc 428d 8bfb B59023cdf558',
      '406bb427-b3cc-428d-8bfb-b59023cdf558',
      '406bb427 B3cc 428d 8bfb B59023cdf558 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '406bb427 B3cc 428d 8bfb B59023cdf558 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/406bb427-b3cc-428d-8bfb-b59023cdf558.png', '406bb427 B3cc 428d 8bfb B59023cdf558 MUSE', true, 0);
  END IF;

  -- 4090092d F3f8 4db9 Aa23 97f6c0106bac
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'boite-a-cles-murale';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '4090092d F3f8 4db9 Aa23 97f6c0106bac',
      '4090092d-f3f8-4db9-aa23-97f6c0106bac',
      '4090092d F3f8 4db9 Aa23 97f6c0106bac — objet personnalisable MUSE, univers « Boîte à clés murale ».',
      '4090092d F3f8 4db9 Aa23 97f6c0106bac est conçu et imprimé en 3D par MUSE dans l''univers « Boîte à clés murale ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      10000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/4090092d-f3f8-4db9-aa23-97f6c0106bac.png', '4090092d F3f8 4db9 Aa23 97f6c0106bac MUSE', true, 0);
  END IF;

  -- 40958511 78ef 43fc 82eb C4439842555f
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '40958511 78ef 43fc 82eb C4439842555f',
      '40958511-78ef-43fc-82eb-c4439842555f',
      '40958511 78ef 43fc 82eb C4439842555f — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '40958511 78ef 43fc 82eb C4439842555f est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/40958511-78ef-43fc-82eb-c4439842555f.png', '40958511 78ef 43fc 82eb C4439842555f MUSE', true, 0);
  END IF;

  -- 4226855b A2d2 435d 8ee8 264de9ec5922
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'muse-kitchen';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '4226855b A2d2 435d 8ee8 264de9ec5922',
      '4226855b-a2d2-435d-8ee8-264de9ec5922',
      '4226855b A2d2 435d 8ee8 264de9ec5922 — objet personnalisable MUSE, univers « MUSE Kitchen / Organisateurs cuisine ».',
      '4226855b A2d2 435d 8ee8 264de9ec5922 est conçu et imprimé en 3D par MUSE dans l''univers « MUSE Kitchen / Organisateurs cuisine ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      12000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/4226855b-a2d2-435d-8ee8-264de9ec5922.png', '4226855b A2d2 435d 8ee8 264de9ec5922 MUSE', true, 0);
  END IF;

  -- 425af7e7 44d1 45eb 9af1 8dbf9fc32a15
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '425af7e7 44d1 45eb 9af1 8dbf9fc32a15',
      '425af7e7-44d1-45eb-9af1-8dbf9fc32a15',
      '425af7e7 44d1 45eb 9af1 8dbf9fc32a15 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '425af7e7 44d1 45eb 9af1 8dbf9fc32a15 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/425af7e7-44d1-45eb-9af1-8dbf9fc32a15.png', '425af7e7 44d1 45eb 9af1 8dbf9fc32a15 MUSE', true, 0);
  END IF;

  -- 465828cf 14a0 4e8d Ac97 926050d5160e
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'muse-kitchen';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '465828cf 14a0 4e8d Ac97 926050d5160e',
      '465828cf-14a0-4e8d-ac97-926050d5160e',
      '465828cf 14a0 4e8d Ac97 926050d5160e — objet personnalisable MUSE, univers « MUSE Kitchen / Organisateurs cuisine ».',
      '465828cf 14a0 4e8d Ac97 926050d5160e est conçu et imprimé en 3D par MUSE dans l''univers « MUSE Kitchen / Organisateurs cuisine ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      12000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/465828cf-14a0-4e8d-ac97-926050d5160e.png', '465828cf 14a0 4e8d Ac97 926050d5160e MUSE', true, 0);
  END IF;

  -- 46f996d7 9a09 4d08 8f3d 91d08b737ceb
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '46f996d7 9a09 4d08 8f3d 91d08b737ceb',
      '46f996d7-9a09-4d08-8f3d-91d08b737ceb',
      '46f996d7 9a09 4d08 8f3d 91d08b737ceb — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '46f996d7 9a09 4d08 8f3d 91d08b737ceb est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/46f996d7-9a09-4d08-8f3d-91d08b737ceb.png', '46f996d7 9a09 4d08 8f3d 91d08b737ceb MUSE', true, 0);
  END IF;

  -- 477d3822 29e0 4a19 Aeec 30a57991cddd
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '477d3822 29e0 4a19 Aeec 30a57991cddd',
      '477d3822-29e0-4a19-aeec-30a57991cddd',
      '477d3822 29e0 4a19 Aeec 30a57991cddd — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '477d3822 29e0 4a19 Aeec 30a57991cddd est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/477d3822-29e0-4a19-aeec-30a57991cddd.png', '477d3822 29e0 4a19 Aeec 30a57991cddd MUSE', true, 0);
  END IF;

  -- 4865d9ef D2a4 4a8b B73f 1781076c768f
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '4865d9ef D2a4 4a8b B73f 1781076c768f',
      '4865d9ef-d2a4-4a8b-b73f-1781076c768f',
      '4865d9ef D2a4 4a8b B73f 1781076c768f — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '4865d9ef D2a4 4a8b B73f 1781076c768f est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/4865d9ef-d2a4-4a8b-b73f-1781076c768f.png', '4865d9ef D2a4 4a8b B73f 1781076c768f MUSE', true, 0);
  END IF;

  -- 49106b4d Cd4b 4caf Ba3c 1adfc7cb2442
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '49106b4d Cd4b 4caf Ba3c 1adfc7cb2442',
      '49106b4d-cd4b-4caf-ba3c-1adfc7cb2442',
      '49106b4d Cd4b 4caf Ba3c 1adfc7cb2442 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '49106b4d Cd4b 4caf Ba3c 1adfc7cb2442 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/49106b4d-cd4b-4caf-ba3c-1adfc7cb2442.png', '49106b4d Cd4b 4caf Ba3c 1adfc7cb2442 MUSE', true, 0);
  END IF;

  -- 492429f0 A42c 4511 990c 932e60e86757
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '492429f0 A42c 4511 990c 932e60e86757',
      '492429f0-a42c-4511-990c-932e60e86757',
      '492429f0 A42c 4511 990c 932e60e86757 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '492429f0 A42c 4511 990c 932e60e86757 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/492429f0-a42c-4511-990c-932e60e86757.png', '492429f0 A42c 4511 990c 932e60e86757 MUSE', true, 0);
  END IF;

  -- 4a0acf3a 74aa 498d B195 A1525acc8826
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'mini-deco-murale-senegal';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '4a0acf3a 74aa 498d B195 A1525acc8826',
      '4a0acf3a-74aa-498d-b195-a1525acc8826',
      '4a0acf3a 74aa 498d B195 A1525acc8826 — objet personnalisable MUSE, univers « Mini déco murale Sénégal ».',
      '4a0acf3a 74aa 498d B195 A1525acc8826 est conçu et imprimé en 3D par MUSE dans l''univers « Mini déco murale Sénégal ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      10000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/4a0acf3a-74aa-498d-b195-a1525acc8826.png', '4a0acf3a 74aa 498d B195 A1525acc8826 MUSE', true, 0);
  END IF;

  -- 4ea5518b D972 4636 9a7c 112582388c9d
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '4ea5518b D972 4636 9a7c 112582388c9d',
      '4ea5518b-d972-4636-9a7c-112582388c9d',
      '4ea5518b D972 4636 9a7c 112582388c9d — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '4ea5518b D972 4636 9a7c 112582388c9d est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/4ea5518b-d972-4636-9a7c-112582388c9d.png', '4ea5518b D972 4636 9a7c 112582388c9d MUSE', true, 0);
  END IF;

  -- 53fb0795 F056 4c7a Bfc3 E3edcaff2280
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '53fb0795 F056 4c7a Bfc3 E3edcaff2280',
      '53fb0795-f056-4c7a-bfc3-e3edcaff2280',
      '53fb0795 F056 4c7a Bfc3 E3edcaff2280 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '53fb0795 F056 4c7a Bfc3 E3edcaff2280 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/53fb0795-f056-4c7a-bfc3-e3edcaff2280.png', '53fb0795 F056 4c7a Bfc3 E3edcaff2280 MUSE', true, 0);
  END IF;

  -- 54951c40 33a0 4590 B396 D4d8782263c6
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '54951c40 33a0 4590 B396 D4d8782263c6',
      '54951c40-33a0-4590-b396-d4d8782263c6',
      '54951c40 33a0 4590 B396 D4d8782263c6 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '54951c40 33a0 4590 B396 D4d8782263c6 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/54951c40-33a0-4590-b396-d4d8782263c6.png', '54951c40 33a0 4590 B396 D4d8782263c6 MUSE', true, 0);
  END IF;

  -- 56e9be07 A72c 4871 9ed8 0cae3fe65781
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '56e9be07 A72c 4871 9ed8 0cae3fe65781',
      '56e9be07-a72c-4871-9ed8-0cae3fe65781',
      '56e9be07 A72c 4871 9ed8 0cae3fe65781 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '56e9be07 A72c 4871 9ed8 0cae3fe65781 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/56e9be07-a72c-4871-9ed8-0cae3fe65781.png', '56e9be07 A72c 4871 9ed8 0cae3fe65781 MUSE', true, 0);
  END IF;

  -- 56f0e63c 6934 4d52 Af16 91d8d73ef32b
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '56f0e63c 6934 4d52 Af16 91d8d73ef32b',
      '56f0e63c-6934-4d52-af16-91d8d73ef32b',
      '56f0e63c 6934 4d52 Af16 91d8d73ef32b — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '56f0e63c 6934 4d52 Af16 91d8d73ef32b est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/56f0e63c-6934-4d52-af16-91d8d73ef32b.png', '56f0e63c 6934 4d52 Af16 91d8d73ef32b MUSE', true, 0);
  END IF;

  -- 58f189c9 3f6f 456b 8344 F8ecf25dc5bd
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '58f189c9 3f6f 456b 8344 F8ecf25dc5bd',
      '58f189c9-3f6f-456b-8344-f8ecf25dc5bd',
      '58f189c9 3f6f 456b 8344 F8ecf25dc5bd — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '58f189c9 3f6f 456b 8344 F8ecf25dc5bd est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/58f189c9-3f6f-456b-8344-f8ecf25dc5bd.png', '58f189c9 3f6f 456b 8344 F8ecf25dc5bd MUSE', true, 0);
  END IF;

  -- 5a9726f6 1a57 4eb8 A0ba F706e4964ebe
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '5a9726f6 1a57 4eb8 A0ba F706e4964ebe',
      '5a9726f6-1a57-4eb8-a0ba-f706e4964ebe',
      '5a9726f6 1a57 4eb8 A0ba F706e4964ebe — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '5a9726f6 1a57 4eb8 A0ba F706e4964ebe est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/5a9726f6-1a57-4eb8-a0ba-f706e4964ebe.png', '5a9726f6 1a57 4eb8 A0ba F706e4964ebe MUSE', true, 0);
  END IF;

  -- 5b3df704 1e48 4ec1 Be11 950eab7ad873
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '5b3df704 1e48 4ec1 Be11 950eab7ad873',
      '5b3df704-1e48-4ec1-be11-950eab7ad873',
      '5b3df704 1e48 4ec1 Be11 950eab7ad873 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '5b3df704 1e48 4ec1 Be11 950eab7ad873 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/5b3df704-1e48-4ec1-be11-950eab7ad873.png', '5b3df704 1e48 4ec1 Be11 950eab7ad873 MUSE', true, 0);
  END IF;

  -- 5b9ce444 17e8 4d0a 90a3 277a85b48b2f
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '5b9ce444 17e8 4d0a 90a3 277a85b48b2f',
      '5b9ce444-17e8-4d0a-90a3-277a85b48b2f',
      '5b9ce444 17e8 4d0a 90a3 277a85b48b2f — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '5b9ce444 17e8 4d0a 90a3 277a85b48b2f est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/5b9ce444-17e8-4d0a-90a3-277a85b48b2f.png', '5b9ce444 17e8 4d0a 90a3 277a85b48b2f MUSE', true, 0);
  END IF;

  -- 5bf061a9 000d 425e 83f1 9f6cef4af25a
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '5bf061a9 000d 425e 83f1 9f6cef4af25a',
      '5bf061a9-000d-425e-83f1-9f6cef4af25a',
      '5bf061a9 000d 425e 83f1 9f6cef4af25a — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '5bf061a9 000d 425e 83f1 9f6cef4af25a est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/5bf061a9-000d-425e-83f1-9f6cef4af25a.png', '5bf061a9 000d 425e 83f1 9f6cef4af25a MUSE', true, 0);
  END IF;

  -- 5c4cef1e Ac79 4e10 9226 0199b9b90b55
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '5c4cef1e Ac79 4e10 9226 0199b9b90b55',
      '5c4cef1e-ac79-4e10-9226-0199b9b90b55',
      '5c4cef1e Ac79 4e10 9226 0199b9b90b55 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '5c4cef1e Ac79 4e10 9226 0199b9b90b55 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/5c4cef1e-ac79-4e10-9226-0199b9b90b55.png', '5c4cef1e Ac79 4e10 9226 0199b9b90b55 MUSE', true, 0);
  END IF;

  -- 5fe2299c 2058 45f1 953b A5188cc3cbde
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '5fe2299c 2058 45f1 953b A5188cc3cbde',
      '5fe2299c-2058-45f1-953b-a5188cc3cbde',
      '5fe2299c 2058 45f1 953b A5188cc3cbde — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '5fe2299c 2058 45f1 953b A5188cc3cbde est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/5fe2299c-2058-45f1-953b-a5188cc3cbde.png', '5fe2299c 2058 45f1 953b A5188cc3cbde MUSE', true, 0);
  END IF;

  -- 60160835 9fbe 4e59 A713 D919c6bd5c41
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '60160835 9fbe 4e59 A713 D919c6bd5c41',
      '60160835-9fbe-4e59-a713-d919c6bd5c41',
      '60160835 9fbe 4e59 A713 D919c6bd5c41 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '60160835 9fbe 4e59 A713 D919c6bd5c41 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/60160835-9fbe-4e59-a713-d919c6bd5c41.png', '60160835 9fbe 4e59 A713 D919c6bd5c41 MUSE', true, 0);
  END IF;

  -- 638565cc 3fbe 4742 8025 2168256555d5
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '638565cc 3fbe 4742 8025 2168256555d5',
      '638565cc-3fbe-4742-8025-2168256555d5',
      '638565cc 3fbe 4742 8025 2168256555d5 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '638565cc 3fbe 4742 8025 2168256555d5 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/638565cc-3fbe-4742-8025-2168256555d5.png', '638565cc 3fbe 4742 8025 2168256555d5 MUSE', true, 0);
  END IF;

  -- 649f2ced Ce67 4d02 Bbdb 2122c77ae275
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '649f2ced Ce67 4d02 Bbdb 2122c77ae275',
      '649f2ced-ce67-4d02-bbdb-2122c77ae275',
      '649f2ced Ce67 4d02 Bbdb 2122c77ae275 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '649f2ced Ce67 4d02 Bbdb 2122c77ae275 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/649f2ced-ce67-4d02-bbdb-2122c77ae275.png', '649f2ced Ce67 4d02 Bbdb 2122c77ae275 MUSE', true, 0);
  END IF;

  -- 653c4bf4 7d0a 4d45 9676 4c8a37d75a0e
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'supports-qr-paiement';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '653c4bf4 7d0a 4d45 9676 4c8a37d75a0e',
      '653c4bf4-7d0a-4d45-9676-4c8a37d75a0e',
      '653c4bf4 7d0a 4d45 9676 4c8a37d75a0e — objet personnalisable MUSE, univers « Supports QR boutique / Wave / Orange Money ».',
      '653c4bf4 7d0a 4d45 9676 4c8a37d75a0e est conçu et imprimé en 3D par MUSE dans l''univers « Supports QR boutique / Wave / Orange Money ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      7000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/653c4bf4-7d0a-4d45-9676-4c8a37d75a0e.png', '653c4bf4 7d0a 4d45 9676 4c8a37d75a0e MUSE', true, 0);
  END IF;

  -- 66b26fe6 Ccf5 460b 8902 44d9bd58c5f6
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '66b26fe6 Ccf5 460b 8902 44d9bd58c5f6',
      '66b26fe6-ccf5-460b-8902-44d9bd58c5f6',
      '66b26fe6 Ccf5 460b 8902 44d9bd58c5f6 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '66b26fe6 Ccf5 460b 8902 44d9bd58c5f6 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/66b26fe6-ccf5-460b-8902-44d9bd58c5f6.png', '66b26fe6 Ccf5 460b 8902 44d9bd58c5f6 MUSE', true, 0);
  END IF;

  -- 670436f4 E5dc 41ee A12c 0f5037cdf17b
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '670436f4 E5dc 41ee A12c 0f5037cdf17b',
      '670436f4-e5dc-41ee-a12c-0f5037cdf17b',
      '670436f4 E5dc 41ee A12c 0f5037cdf17b — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '670436f4 E5dc 41ee A12c 0f5037cdf17b est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/670436f4-e5dc-41ee-a12c-0f5037cdf17b.png', '670436f4 E5dc 41ee A12c 0f5037cdf17b MUSE', true, 0);
  END IF;

  -- 684045cb Cf90 4edf 9481 71fc5158ef56
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '684045cb Cf90 4edf 9481 71fc5158ef56',
      '684045cb-cf90-4edf-9481-71fc5158ef56',
      '684045cb Cf90 4edf 9481 71fc5158ef56 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '684045cb Cf90 4edf 9481 71fc5158ef56 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/684045cb-cf90-4edf-9481-71fc5158ef56.png', '684045cb Cf90 4edf 9481 71fc5158ef56 MUSE', true, 0);
  END IF;

  -- 6c385814 Fd15 4826 89d5 663de9c1a679
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '6c385814 Fd15 4826 89d5 663de9c1a679',
      '6c385814-fd15-4826-89d5-663de9c1a679',
      '6c385814 Fd15 4826 89d5 663de9c1a679 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '6c385814 Fd15 4826 89d5 663de9c1a679 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/6c385814-fd15-4826-89d5-663de9c1a679.png', '6c385814 Fd15 4826 89d5 663de9c1a679 MUSE', true, 0);
  END IF;

  -- 6d63f9fe 4ec4 48e7 90fe 7996cadfc587
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'mini-deco-murale-senegal';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '6d63f9fe 4ec4 48e7 90fe 7996cadfc587',
      '6d63f9fe-4ec4-48e7-90fe-7996cadfc587',
      '6d63f9fe 4ec4 48e7 90fe 7996cadfc587 — objet personnalisable MUSE, univers « Mini déco murale Sénégal ».',
      '6d63f9fe 4ec4 48e7 90fe 7996cadfc587 est conçu et imprimé en 3D par MUSE dans l''univers « Mini déco murale Sénégal ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      10000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/6d63f9fe-4ec4-48e7-90fe-7996cadfc587.png', '6d63f9fe 4ec4 48e7 90fe 7996cadfc587 MUSE', true, 0);
  END IF;

  -- 6e3b7dad 3db1 448c B3df D2eb565f3041
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '6e3b7dad 3db1 448c B3df D2eb565f3041',
      '6e3b7dad-3db1-448c-b3df-d2eb565f3041',
      '6e3b7dad 3db1 448c B3df D2eb565f3041 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '6e3b7dad 3db1 448c B3df D2eb565f3041 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/6e3b7dad-3db1-448c-b3df-d2eb565f3041.png', '6e3b7dad 3db1 448c B3df D2eb565f3041 MUSE', true, 0);
  END IF;

  -- 6f81e766 2c98 42eb 9963 914a452ba95e
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '6f81e766 2c98 42eb 9963 914a452ba95e',
      '6f81e766-2c98-42eb-9963-914a452ba95e',
      '6f81e766 2c98 42eb 9963 914a452ba95e — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '6f81e766 2c98 42eb 9963 914a452ba95e est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/6f81e766-2c98-42eb-9963-914a452ba95e.png', '6f81e766 2c98 42eb 9963 914a452ba95e MUSE', true, 0);
  END IF;

  -- 701e7cad 2e6f 4adb 8782 031d68758ec0
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '701e7cad 2e6f 4adb 8782 031d68758ec0',
      '701e7cad-2e6f-4adb-8782-031d68758ec0',
      '701e7cad 2e6f 4adb 8782 031d68758ec0 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '701e7cad 2e6f 4adb 8782 031d68758ec0 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/701e7cad-2e6f-4adb-8782-031d68758ec0.png', '701e7cad 2e6f 4adb 8782 031d68758ec0 MUSE', true, 0);
  END IF;

  -- 71b28e42 Aaf9 4014 8309 F33ab41826a9
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '71b28e42 Aaf9 4014 8309 F33ab41826a9',
      '71b28e42-aaf9-4014-8309-f33ab41826a9',
      '71b28e42 Aaf9 4014 8309 F33ab41826a9 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '71b28e42 Aaf9 4014 8309 F33ab41826a9 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/71b28e42-aaf9-4014-8309-f33ab41826a9.png', '71b28e42 Aaf9 4014 8309 F33ab41826a9 MUSE', true, 0);
  END IF;

  -- 71c76ed6 42d8 44c7 8f23 De6c8ad51861
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '71c76ed6 42d8 44c7 8f23 De6c8ad51861',
      '71c76ed6-42d8-44c7-8f23-de6c8ad51861',
      '71c76ed6 42d8 44c7 8f23 De6c8ad51861 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '71c76ed6 42d8 44c7 8f23 De6c8ad51861 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/71c76ed6-42d8-44c7-8f23-de6c8ad51861.png', '71c76ed6 42d8 44c7 8f23 De6c8ad51861 MUSE', true, 0);
  END IF;

  -- 724c4222 7896 40ad A6b8 Dc042cfbf636
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '724c4222 7896 40ad A6b8 Dc042cfbf636',
      '724c4222-7896-40ad-a6b8-dc042cfbf636',
      '724c4222 7896 40ad A6b8 Dc042cfbf636 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '724c4222 7896 40ad A6b8 Dc042cfbf636 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/724c4222-7896-40ad-a6b8-dc042cfbf636.png', '724c4222 7896 40ad A6b8 Dc042cfbf636 MUSE', true, 0);
  END IF;

  -- 72e33712 6df9 4227 9143 416e82e126cb
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '72e33712 6df9 4227 9143 416e82e126cb',
      '72e33712-6df9-4227-9143-416e82e126cb',
      '72e33712 6df9 4227 9143 416e82e126cb — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '72e33712 6df9 4227 9143 416e82e126cb est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/72e33712-6df9-4227-9143-416e82e126cb.png', '72e33712 6df9 4227 9143 416e82e126cb MUSE', true, 0);
  END IF;

  -- 72fc7323 8a59 4003 A325 3bef4a09107c
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '72fc7323 8a59 4003 A325 3bef4a09107c',
      '72fc7323-8a59-4003-a325-3bef4a09107c',
      '72fc7323 8a59 4003 A325 3bef4a09107c — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '72fc7323 8a59 4003 A325 3bef4a09107c est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/72fc7323-8a59-4003-a325-3bef4a09107c.png', '72fc7323 8a59 4003 A325 3bef4a09107c MUSE', true, 0);
  END IF;

  -- 737e1d1d C32f 4daa B007 A6a3d933ef29
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '737e1d1d C32f 4daa B007 A6a3d933ef29',
      '737e1d1d-c32f-4daa-b007-a6a3d933ef29',
      '737e1d1d C32f 4daa B007 A6a3d933ef29 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '737e1d1d C32f 4daa B007 A6a3d933ef29 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/737e1d1d-c32f-4daa-b007-a6a3d933ef29.png', '737e1d1d C32f 4daa B007 A6a3d933ef29 MUSE', true, 0);
  END IF;

  -- 7411cb82 60c5 4e0a 86f7 5dee795a9150
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '7411cb82 60c5 4e0a 86f7 5dee795a9150',
      '7411cb82-60c5-4e0a-86f7-5dee795a9150',
      '7411cb82 60c5 4e0a 86f7 5dee795a9150 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '7411cb82 60c5 4e0a 86f7 5dee795a9150 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/7411cb82-60c5-4e0a-86f7-5dee795a9150.png', '7411cb82 60c5 4e0a 86f7 5dee795a9150 MUSE', true, 0);
  END IF;

  -- 7610c090 6736 443b 9936 68fbb7cac601
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '7610c090 6736 443b 9936 68fbb7cac601',
      '7610c090-6736-443b-9936-68fbb7cac601',
      '7610c090 6736 443b 9936 68fbb7cac601 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '7610c090 6736 443b 9936 68fbb7cac601 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/7610c090-6736-443b-9936-68fbb7cac601.png', '7610c090 6736 443b 9936 68fbb7cac601 MUSE', true, 0);
  END IF;

  -- 76ac758b 74a5 45d8 B764 2e97b0d1d74d
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '76ac758b 74a5 45d8 B764 2e97b0d1d74d',
      '76ac758b-74a5-45d8-b764-2e97b0d1d74d',
      '76ac758b 74a5 45d8 B764 2e97b0d1d74d — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '76ac758b 74a5 45d8 B764 2e97b0d1d74d est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/76ac758b-74a5-45d8-b764-2e97b0d1d74d.png', '76ac758b 74a5 45d8 B764 2e97b0d1d74d MUSE', true, 0);
  END IF;

  -- 772df2fc 0358 4d6f Abb6 C9d64c003421
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '772df2fc 0358 4d6f Abb6 C9d64c003421',
      '772df2fc-0358-4d6f-abb6-c9d64c003421',
      '772df2fc 0358 4d6f Abb6 C9d64c003421 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '772df2fc 0358 4d6f Abb6 C9d64c003421 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/772df2fc-0358-4d6f-abb6-c9d64c003421.png', '772df2fc 0358 4d6f Abb6 C9d64c003421 MUSE', true, 0);
  END IF;

  -- 79679bd7 D285 4eb2 9815 7d4716c494d4
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '79679bd7 D285 4eb2 9815 7d4716c494d4',
      '79679bd7-d285-4eb2-9815-7d4716c494d4',
      '79679bd7 D285 4eb2 9815 7d4716c494d4 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '79679bd7 D285 4eb2 9815 7d4716c494d4 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/79679bd7-d285-4eb2-9815-7d4716c494d4.png', '79679bd7 D285 4eb2 9815 7d4716c494d4 MUSE', true, 0);
  END IF;

  -- 797055d8 1423 4406 9e0b B5b0e895a600
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '797055d8 1423 4406 9e0b B5b0e895a600',
      '797055d8-1423-4406-9e0b-b5b0e895a600',
      '797055d8 1423 4406 9e0b B5b0e895a600 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '797055d8 1423 4406 9e0b B5b0e895a600 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/797055d8-1423-4406-9e0b-b5b0e895a600.png', '797055d8 1423 4406 9e0b B5b0e895a600 MUSE', true, 0);
  END IF;

  -- 7b7133f7 1fea 4ff0 A513 250c2b96ec00
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '7b7133f7 1fea 4ff0 A513 250c2b96ec00',
      '7b7133f7-1fea-4ff0-a513-250c2b96ec00',
      '7b7133f7 1fea 4ff0 A513 250c2b96ec00 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '7b7133f7 1fea 4ff0 A513 250c2b96ec00 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/7b7133f7-1fea-4ff0-a513-250c2b96ec00.png', '7b7133f7 1fea 4ff0 A513 250c2b96ec00 MUSE', true, 0);
  END IF;

  -- 7c7a5280 5662 43e9 B1c9 E37a9c986183
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '7c7a5280 5662 43e9 B1c9 E37a9c986183',
      '7c7a5280-5662-43e9-b1c9-e37a9c986183',
      '7c7a5280 5662 43e9 B1c9 E37a9c986183 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '7c7a5280 5662 43e9 B1c9 E37a9c986183 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/7c7a5280-5662-43e9-b1c9-e37a9c986183.png', '7c7a5280 5662 43e9 B1c9 E37a9c986183 MUSE', true, 0);
  END IF;

  -- 7ce97648 F8c0 4e23 Aa3a 8aded94732bc
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'boite-a-cles-murale';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '7ce97648 F8c0 4e23 Aa3a 8aded94732bc',
      '7ce97648-f8c0-4e23-aa3a-8aded94732bc',
      '7ce97648 F8c0 4e23 Aa3a 8aded94732bc — objet personnalisable MUSE, univers « Boîte à clés murale ».',
      '7ce97648 F8c0 4e23 Aa3a 8aded94732bc est conçu et imprimé en 3D par MUSE dans l''univers « Boîte à clés murale ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      10000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/7ce97648-f8c0-4e23-aa3a-8aded94732bc.png', '7ce97648 F8c0 4e23 Aa3a 8aded94732bc MUSE', true, 0);
  END IF;

  -- 7db3328e E1de 4918 Be3b 0449e053d25c
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '7db3328e E1de 4918 Be3b 0449e053d25c',
      '7db3328e-e1de-4918-be3b-0449e053d25c',
      '7db3328e E1de 4918 Be3b 0449e053d25c — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '7db3328e E1de 4918 Be3b 0449e053d25c est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/7db3328e-e1de-4918-be3b-0449e053d25c.png', '7db3328e E1de 4918 Be3b 0449e053d25c MUSE', true, 0);
  END IF;

  -- 7ec427f0 9563 485d Aaa9 0d83640e2352
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '7ec427f0 9563 485d Aaa9 0d83640e2352',
      '7ec427f0-9563-485d-aaa9-0d83640e2352',
      '7ec427f0 9563 485d Aaa9 0d83640e2352 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '7ec427f0 9563 485d Aaa9 0d83640e2352 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/7ec427f0-9563-485d-aaa9-0d83640e2352.png', '7ec427f0 9563 485d Aaa9 0d83640e2352 MUSE', true, 0);
  END IF;

  -- 808ac9ed E725 430b Ac6e Af6b42a3a054
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '808ac9ed E725 430b Ac6e Af6b42a3a054',
      '808ac9ed-e725-430b-ac6e-af6b42a3a054',
      '808ac9ed E725 430b Ac6e Af6b42a3a054 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '808ac9ed E725 430b Ac6e Af6b42a3a054 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/808ac9ed-e725-430b-ac6e-af6b42a3a054.png', '808ac9ed E725 430b Ac6e Af6b42a3a054 MUSE', true, 0);
  END IF;

  -- 84bda87e 9dac 4f7a B39b Aa812d52fa3f
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '84bda87e 9dac 4f7a B39b Aa812d52fa3f',
      '84bda87e-9dac-4f7a-b39b-aa812d52fa3f',
      '84bda87e 9dac 4f7a B39b Aa812d52fa3f — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '84bda87e 9dac 4f7a B39b Aa812d52fa3f est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/84bda87e-9dac-4f7a-b39b-aa812d52fa3f.png', '84bda87e 9dac 4f7a B39b Aa812d52fa3f MUSE', true, 0);
  END IF;

  -- 85819db2 7dcc 463d B7e1 1e499b07003f
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'mini-deco-murale-senegal';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '85819db2 7dcc 463d B7e1 1e499b07003f',
      '85819db2-7dcc-463d-b7e1-1e499b07003f',
      '85819db2 7dcc 463d B7e1 1e499b07003f — objet personnalisable MUSE, univers « Mini déco murale Sénégal ».',
      '85819db2 7dcc 463d B7e1 1e499b07003f est conçu et imprimé en 3D par MUSE dans l''univers « Mini déco murale Sénégal ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      10000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/85819db2-7dcc-463d-b7e1-1e499b07003f.png', '85819db2 7dcc 463d B7e1 1e499b07003f MUSE', true, 0);
  END IF;

  -- 8591e1a1 052c 4691 A119 87a051468180
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '8591e1a1 052c 4691 A119 87a051468180',
      '8591e1a1-052c-4691-a119-87a051468180',
      '8591e1a1 052c 4691 A119 87a051468180 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '8591e1a1 052c 4691 A119 87a051468180 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/8591e1a1-052c-4691-a119-87a051468180.png', '8591e1a1 052c 4691 A119 87a051468180 MUSE', true, 0);
  END IF;

  -- 867e9ed3 19fc 4035 Aa1e A20639f744d3
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '867e9ed3 19fc 4035 Aa1e A20639f744d3',
      '867e9ed3-19fc-4035-aa1e-a20639f744d3',
      '867e9ed3 19fc 4035 Aa1e A20639f744d3 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '867e9ed3 19fc 4035 Aa1e A20639f744d3 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/867e9ed3-19fc-4035-aa1e-a20639f744d3.png', '867e9ed3 19fc 4035 Aa1e A20639f744d3 MUSE', true, 0);
  END IF;

  -- 87a930a8 Ed5f 4690 960a 2675996ad22a
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '87a930a8 Ed5f 4690 960a 2675996ad22a',
      '87a930a8-ed5f-4690-960a-2675996ad22a',
      '87a930a8 Ed5f 4690 960a 2675996ad22a — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '87a930a8 Ed5f 4690 960a 2675996ad22a est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/87a930a8-ed5f-4690-960a-2675996ad22a.png', '87a930a8 Ed5f 4690 960a 2675996ad22a MUSE', true, 0);
  END IF;

  -- 897f4b4b 5cb5 4f65 B960 166aab3a8747
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '897f4b4b 5cb5 4f65 B960 166aab3a8747',
      '897f4b4b-5cb5-4f65-b960-166aab3a8747',
      '897f4b4b 5cb5 4f65 B960 166aab3a8747 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '897f4b4b 5cb5 4f65 B960 166aab3a8747 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/897f4b4b-5cb5-4f65-b960-166aab3a8747.png', '897f4b4b 5cb5 4f65 B960 166aab3a8747 MUSE', true, 0);
  END IF;

  -- 89f83c9e 97fb 4f65 B8b4 367c4621449d
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '89f83c9e 97fb 4f65 B8b4 367c4621449d',
      '89f83c9e-97fb-4f65-b8b4-367c4621449d',
      '89f83c9e 97fb 4f65 B8b4 367c4621449d — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '89f83c9e 97fb 4f65 B8b4 367c4621449d est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/89f83c9e-97fb-4f65-b8b4-367c4621449d.png', '89f83c9e 97fb 4f65 B8b4 367c4621449d MUSE', true, 0);
  END IF;

  -- 8d2a271c 66b9 4b1e B95f F4c20dd0e216
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '8d2a271c 66b9 4b1e B95f F4c20dd0e216',
      '8d2a271c-66b9-4b1e-b95f-f4c20dd0e216',
      '8d2a271c 66b9 4b1e B95f F4c20dd0e216 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '8d2a271c 66b9 4b1e B95f F4c20dd0e216 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/8d2a271c-66b9-4b1e-b95f-f4c20dd0e216.png', '8d2a271c 66b9 4b1e B95f F4c20dd0e216 MUSE', true, 0);
  END IF;

  -- 8de3a8ee A533 49c3 B8fb F74e29289d90
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'mini-deco-murale-senegal';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '8de3a8ee A533 49c3 B8fb F74e29289d90',
      '8de3a8ee-a533-49c3-b8fb-f74e29289d90',
      '8de3a8ee A533 49c3 B8fb F74e29289d90 — objet personnalisable MUSE, univers « Mini déco murale Sénégal ».',
      '8de3a8ee A533 49c3 B8fb F74e29289d90 est conçu et imprimé en 3D par MUSE dans l''univers « Mini déco murale Sénégal ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      10000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/8de3a8ee-a533-49c3-b8fb-f74e29289d90.png', '8de3a8ee A533 49c3 B8fb F74e29289d90 MUSE', true, 0);
  END IF;

  -- 8e184616 6c41 40ac B01c 62e6b7a71b4a
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'muse-kitchen';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '8e184616 6c41 40ac B01c 62e6b7a71b4a',
      '8e184616-6c41-40ac-b01c-62e6b7a71b4a',
      '8e184616 6c41 40ac B01c 62e6b7a71b4a — objet personnalisable MUSE, univers « MUSE Kitchen / Organisateurs cuisine ».',
      '8e184616 6c41 40ac B01c 62e6b7a71b4a est conçu et imprimé en 3D par MUSE dans l''univers « MUSE Kitchen / Organisateurs cuisine ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      12000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/8e184616-6c41-40ac-b01c-62e6b7a71b4a.png', '8e184616 6c41 40ac B01c 62e6b7a71b4a MUSE', true, 0);
  END IF;

  -- 8e606702 C3b2 4b1f Bf04 38bc9bdfd24d
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '8e606702 C3b2 4b1f Bf04 38bc9bdfd24d',
      '8e606702-c3b2-4b1f-bf04-38bc9bdfd24d',
      '8e606702 C3b2 4b1f Bf04 38bc9bdfd24d — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '8e606702 C3b2 4b1f Bf04 38bc9bdfd24d est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/8e606702-c3b2-4b1f-bf04-38bc9bdfd24d.png', '8e606702 C3b2 4b1f Bf04 38bc9bdfd24d MUSE', true, 0);
  END IF;

  -- 8e9df991 5404 4c6a Ade9 Cb19e259bb94
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '8e9df991 5404 4c6a Ade9 Cb19e259bb94',
      '8e9df991-5404-4c6a-ade9-cb19e259bb94',
      '8e9df991 5404 4c6a Ade9 Cb19e259bb94 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '8e9df991 5404 4c6a Ade9 Cb19e259bb94 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/8e9df991-5404-4c6a-ade9-cb19e259bb94.png', '8e9df991 5404 4c6a Ade9 Cb19e259bb94 MUSE', true, 0);
  END IF;

  -- 8f2dd6ab Ce35 499a 8593 2fc9cb4cda5c
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '8f2dd6ab Ce35 499a 8593 2fc9cb4cda5c',
      '8f2dd6ab-ce35-499a-8593-2fc9cb4cda5c',
      '8f2dd6ab Ce35 499a 8593 2fc9cb4cda5c — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '8f2dd6ab Ce35 499a 8593 2fc9cb4cda5c est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/8f2dd6ab-ce35-499a-8593-2fc9cb4cda5c.png', '8f2dd6ab Ce35 499a 8593 2fc9cb4cda5c MUSE', true, 0);
  END IF;

  -- 8fb8ee7d 87ea 460f 9f38 56c9da4e58ee
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '8fb8ee7d 87ea 460f 9f38 56c9da4e58ee',
      '8fb8ee7d-87ea-460f-9f38-56c9da4e58ee',
      '8fb8ee7d 87ea 460f 9f38 56c9da4e58ee — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '8fb8ee7d 87ea 460f 9f38 56c9da4e58ee est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/8fb8ee7d-87ea-460f-9f38-56c9da4e58ee.png', '8fb8ee7d 87ea 460f 9f38 56c9da4e58ee MUSE', true, 0);
  END IF;

  -- 8fc36753 9cc5 4a4f 8dda Dc4851d93479
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '8fc36753 9cc5 4a4f 8dda Dc4851d93479',
      '8fc36753-9cc5-4a4f-8dda-dc4851d93479',
      '8fc36753 9cc5 4a4f 8dda Dc4851d93479 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '8fc36753 9cc5 4a4f 8dda Dc4851d93479 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/8fc36753-9cc5-4a4f-8dda-dc4851d93479.png', '8fc36753 9cc5 4a4f 8dda Dc4851d93479 MUSE', true, 0);
  END IF;

  -- 900bbe02 30cd 463b Ab6e 2d65075b5110
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '900bbe02 30cd 463b Ab6e 2d65075b5110',
      '900bbe02-30cd-463b-ab6e-2d65075b5110',
      '900bbe02 30cd 463b Ab6e 2d65075b5110 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '900bbe02 30cd 463b Ab6e 2d65075b5110 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/900bbe02-30cd-463b-ab6e-2d65075b5110.png', '900bbe02 30cd 463b Ab6e 2d65075b5110 MUSE', true, 0);
  END IF;

  -- 91c140fc 9200 44bb 9b14 63e1b0f221e4
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '91c140fc 9200 44bb 9b14 63e1b0f221e4',
      '91c140fc-9200-44bb-9b14-63e1b0f221e4',
      '91c140fc 9200 44bb 9b14 63e1b0f221e4 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '91c140fc 9200 44bb 9b14 63e1b0f221e4 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/91c140fc-9200-44bb-9b14-63e1b0f221e4.png', '91c140fc 9200 44bb 9b14 63e1b0f221e4 MUSE', true, 0);
  END IF;

  -- 91eadfe6 5112 498d A845 Dbd1a042e2c6
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '91eadfe6 5112 498d A845 Dbd1a042e2c6',
      '91eadfe6-5112-498d-a845-dbd1a042e2c6',
      '91eadfe6 5112 498d A845 Dbd1a042e2c6 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '91eadfe6 5112 498d A845 Dbd1a042e2c6 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/91eadfe6-5112-498d-a845-dbd1a042e2c6.png', '91eadfe6 5112 498d A845 Dbd1a042e2c6 MUSE', true, 0);
  END IF;

  -- 92169e75 5489 48c8 A122 Afc85d748406
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '92169e75 5489 48c8 A122 Afc85d748406',
      '92169e75-5489-48c8-a122-afc85d748406',
      '92169e75 5489 48c8 A122 Afc85d748406 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '92169e75 5489 48c8 A122 Afc85d748406 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/92169e75-5489-48c8-a122-afc85d748406.png', '92169e75 5489 48c8 A122 Afc85d748406 MUSE', true, 0);
  END IF;

  -- 935c622f 5ccd 4154 Bb16 C13d3297da03
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'porte-moussor-foulards';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '935c622f 5ccd 4154 Bb16 C13d3297da03',
      '935c622f-5ccd-4154-bb16-c13d3297da03',
      '935c622f 5ccd 4154 Bb16 C13d3297da03 — objet personnalisable MUSE, univers « Porte-moussor / porte-foulards mural ».',
      '935c622f 5ccd 4154 Bb16 C13d3297da03 est conçu et imprimé en 3D par MUSE dans l''univers « Porte-moussor / porte-foulards mural ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      10000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/935c622f-5ccd-4154-bb16-c13d3297da03.png', '935c622f 5ccd 4154 Bb16 C13d3297da03 MUSE', true, 0);
  END IF;

  -- 95e4bc36 204f 4be5 81b9 D00f62356092
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '95e4bc36 204f 4be5 81b9 D00f62356092',
      '95e4bc36-204f-4be5-81b9-d00f62356092',
      '95e4bc36 204f 4be5 81b9 D00f62356092 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '95e4bc36 204f 4be5 81b9 D00f62356092 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/95e4bc36-204f-4be5-81b9-d00f62356092.png', '95e4bc36 204f 4be5 81b9 D00f62356092 MUSE', true, 0);
  END IF;

  -- 9605307e 6dcd 4ff8 A852 9e55ca04d5ce
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '9605307e 6dcd 4ff8 A852 9e55ca04d5ce',
      '9605307e-6dcd-4ff8-a852-9e55ca04d5ce',
      '9605307e 6dcd 4ff8 A852 9e55ca04d5ce — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '9605307e 6dcd 4ff8 A852 9e55ca04d5ce est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/9605307e-6dcd-4ff8-a852-9e55ca04d5ce.png', '9605307e 6dcd 4ff8 A852 9e55ca04d5ce MUSE', true, 0);
  END IF;

  -- 98bb90d8 7c18 41a3 994d 8f82b58b5adb
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '98bb90d8 7c18 41a3 994d 8f82b58b5adb',
      '98bb90d8-7c18-41a3-994d-8f82b58b5adb',
      '98bb90d8 7c18 41a3 994d 8f82b58b5adb — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '98bb90d8 7c18 41a3 994d 8f82b58b5adb est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/98bb90d8-7c18-41a3-994d-8f82b58b5adb.png', '98bb90d8 7c18 41a3 994d 8f82b58b5adb MUSE', true, 0);
  END IF;

  -- 9b333ee9 7dfc 4b8e 9852 0e513852d9cc
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '9b333ee9 7dfc 4b8e 9852 0e513852d9cc',
      '9b333ee9-7dfc-4b8e-9852-0e513852d9cc',
      '9b333ee9 7dfc 4b8e 9852 0e513852d9cc — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '9b333ee9 7dfc 4b8e 9852 0e513852d9cc est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/9b333ee9-7dfc-4b8e-9852-0e513852d9cc.png', '9b333ee9 7dfc 4b8e 9852 0e513852d9cc MUSE', true, 0);
  END IF;

  -- 9b836607 44a1 46a3 Baf4 C4bd214485bf
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '9b836607 44a1 46a3 Baf4 C4bd214485bf',
      '9b836607-44a1-46a3-baf4-c4bd214485bf',
      '9b836607 44a1 46a3 Baf4 C4bd214485bf — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '9b836607 44a1 46a3 Baf4 C4bd214485bf est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/9b836607-44a1-46a3-baf4-c4bd214485bf.png', '9b836607 44a1 46a3 Baf4 C4bd214485bf MUSE', true, 0);
  END IF;

  -- 9de9b67f E0f4 457b 91dc 303ad11cfc3e
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '9de9b67f E0f4 457b 91dc 303ad11cfc3e',
      '9de9b67f-e0f4-457b-91dc-303ad11cfc3e',
      '9de9b67f E0f4 457b 91dc 303ad11cfc3e — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '9de9b67f E0f4 457b 91dc 303ad11cfc3e est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/9de9b67f-e0f4-457b-91dc-303ad11cfc3e.png', '9de9b67f E0f4 457b 91dc 303ad11cfc3e MUSE', true, 0);
  END IF;

  -- 9f7145eb 8c11 419b 8403 Ae42d7517231
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      '9f7145eb 8c11 419b 8403 Ae42d7517231',
      '9f7145eb-8c11-419b-8403-ae42d7517231',
      '9f7145eb 8c11 419b 8403 Ae42d7517231 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      '9f7145eb 8c11 419b 8403 Ae42d7517231 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/9f7145eb-8c11-419b-8403-ae42d7517231.png', '9f7145eb 8c11 419b 8403 Ae42d7517231 MUSE', true, 0);
  END IF;

  -- A0088906 05b5 49b5 9882 Dc3e456d3948
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'A0088906 05b5 49b5 9882 Dc3e456d3948',
      'a0088906-05b5-49b5-9882-dc3e456d3948',
      'A0088906 05b5 49b5 9882 Dc3e456d3948 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      'A0088906 05b5 49b5 9882 Dc3e456d3948 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/a0088906-05b5-49b5-9882-dc3e456d3948.png', 'A0088906 05b5 49b5 9882 Dc3e456d3948 MUSE', true, 0);
  END IF;

  -- A011018a C171 440d 8482 14b7a91ef168
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'A011018a C171 440d 8482 14b7a91ef168',
      'a011018a-c171-440d-8482-14b7a91ef168',
      'A011018a C171 440d 8482 14b7a91ef168 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      'A011018a C171 440d 8482 14b7a91ef168 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/a011018a-c171-440d-8482-14b7a91ef168.png', 'A011018a C171 440d 8482 14b7a91ef168 MUSE', true, 0);
  END IF;

  -- A184538c 9616 4bee 8c4c Efdb07a12a54
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'A184538c 9616 4bee 8c4c Efdb07a12a54',
      'a184538c-9616-4bee-8c4c-efdb07a12a54',
      'A184538c 9616 4bee 8c4c Efdb07a12a54 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      'A184538c 9616 4bee 8c4c Efdb07a12a54 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/a184538c-9616-4bee-8c4c-efdb07a12a54.png', 'A184538c 9616 4bee 8c4c Efdb07a12a54 MUSE', true, 0);
  END IF;

  -- A19fa959 Fb26 4cf9 946f C8ba57aa2045
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'A19fa959 Fb26 4cf9 946f C8ba57aa2045',
      'a19fa959-fb26-4cf9-946f-c8ba57aa2045',
      'A19fa959 Fb26 4cf9 946f C8ba57aa2045 — objet personnalisable MUSE, univers « Vide-poche d''entrée « Teranga » ».',
      'A19fa959 Fb26 4cf9 946f C8ba57aa2045 est conçu et imprimé en 3D par MUSE dans l''univers « Vide-poche d''entrée « Teranga » ». Finitions soignées, matériaux adaptés à l''usage, personnalisation possible (couleur, texte, initiales).',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
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
    VALUES (v_product_id, '/products/a19fa959-fb26-4cf9-946f-c8ba57aa2045.png', 'A19fa959 Fb26 4cf9 946f C8ba57aa2045 MUSE', true, 0);
  END IF;

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