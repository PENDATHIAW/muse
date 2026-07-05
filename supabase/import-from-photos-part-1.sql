-- Import automatique photos MUSE (partie)
-- Exécutez dans Supabase → SQL Editor

-- Partie 1/4 (40 produits)

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
END $$;
