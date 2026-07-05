-- Import automatique photos MUSE (partie)
-- Exécutez dans Supabase → SQL Editor

-- Partie 2/4 (40 produits)

DO $$
DECLARE
  v_universe_id UUID;
  v_product_id UUID;
BEGIN
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
END $$;
