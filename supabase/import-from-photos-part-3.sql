-- Import automatique photos MUSE (partie)
-- Exécutez dans Supabase → SQL Editor

-- Partie 3/4 (40 produits)

DO $$
DECLARE
  v_universe_id UUID;
  v_product_id UUID;
BEGIN
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
END $$;
