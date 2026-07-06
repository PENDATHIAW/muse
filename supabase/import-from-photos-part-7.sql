-- Import automatique photos MUSE (partie)
-- Exécutez dans Supabase → SQL Editor, une partie à la fois
-- Partie 7/7 (14 produits)

DO $$
DECLARE
  v_universe_id UUID;
  v_product_id UUID;
BEGIN
  -- VIDE-POCHE TERANGA REF M193
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M193',
      'ec8acb7d-0499-4a02-940d-08957f446ed0',
      'Votre entrée mérite mieux qu''une pile de clés en vrac. VIDE-POCHE TERANGA REF M193 accueille votre quotidien avec la chaleur de la Teranga.',
      'VIDE-POCHE TERANGA REF M193 est pensé pour ce moment où l''on franchit la porte les mains pleines et l''esprit ailleurs. Imprimé en 3D par MUSE, il accueille clés, montre et petits trésors du quotidien avec une finition soignée. Inspiré de la Teranga sénégalaise — accueillir avec générosité —, il habille votre entrée sans l''encombrer. Couleur, initiales, message discret : on l''adapte à votre maison, pas l''inverse.',
      'Déposez clés, montre, bijoux, pièces ou lunettes au retour à la maison. Parfait comme petit cadeau d''accueil ou de table.',
      'Inspiré par la Teranga sénégalaise : accueillir, ranger, et offrir un bel objet dès l''entrée de la maison.',
      'Console d''entrée, table de chevet, bureau, réception d''hôtel ou comptoir de boutique.',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 193,
      '["nouveauté","personnalisable","vide poche teranga"]'::jsonb
    ) ON CONFLICT (slug) DO UPDATE SET
      name = EXCLUDED.name,
      short_description = EXCLUDED.short_description,
      long_description = EXCLUDED.long_description,
      usage = EXCLUDED.usage,
      inspiration = EXCLUDED.inspiration,
      placement = EXCLUDED.placement,
      price = EXCLUDED.price,
      universe_id = EXCLUDED.universe_id
    RETURNING id INTO v_product_id;
    DELETE FROM public.product_images WHERE product_id = v_product_id;
    INSERT INTO public.product_images (product_id, image_url, alt_text, is_main, display_order)
    VALUES (v_product_id, '/products/ec8acb7d-0499-4a02-940d-08957f446ed0.png', 'VIDE-POCHE TERANGA REF M193 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M194
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M194',
      'ecf92ec3-cd89-4ee7-9cad-2d280c9a8430',
      'Rentrer chez soi, poser ses clés, respirer : VIDE-POCHE TERANGA REF M194 transforme ce geste banal en petit rituel d''accueil.',
      'On connaît tous cette table d''entrée qui devient dépotoir. VIDE-POCHE TERANGA REF M194 remet de l''ordre avec une touche de caractère : lignes modernes, matière premium, personnalisation MUSE. Chaque pièce est imprimée sur demande, prête à devenir le premier objet que vos invités remarquent — et le dernier que vous touchez en sortant le matin.',
      'Déposez clés, montre, bijoux, pièces ou lunettes au retour à la maison. Parfait comme petit cadeau d''accueil ou de table.',
      'Inspiré par la Teranga sénégalaise : accueillir, ranger, et offrir un bel objet dès l''entrée de la maison.',
      'Console d''entrée, table de chevet, bureau, réception d''hôtel ou comptoir de boutique.',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 194,
      '["nouveauté","personnalisable","vide poche teranga"]'::jsonb
    ) ON CONFLICT (slug) DO UPDATE SET
      name = EXCLUDED.name,
      short_description = EXCLUDED.short_description,
      long_description = EXCLUDED.long_description,
      usage = EXCLUDED.usage,
      inspiration = EXCLUDED.inspiration,
      placement = EXCLUDED.placement,
      price = EXCLUDED.price,
      universe_id = EXCLUDED.universe_id
    RETURNING id INTO v_product_id;
    DELETE FROM public.product_images WHERE product_id = v_product_id;
    INSERT INTO public.product_images (product_id, image_url, alt_text, is_main, display_order)
    VALUES (v_product_id, '/products/ecf92ec3-cd89-4ee7-9cad-2d280c9a8430.png', 'VIDE-POCHE TERANGA REF M194 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M195
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M195',
      'ef36fbc4-cbc0-4795-926c-8877ae0c8079',
      'Clés, montre, pièces, lunettes — VIDE-POCHE TERANGA REF M195 range tout ça avec élégance. Zéro chaos, cent pour cent Teranga.',
      'VIDE-POCHE TERANGA REF M195 ne se contente pas de ranger : il raconte une invitation à ralentir. Posez vos clés, gardez votre montre à portée de main, offrez à votre entrée la dignité qu''elle mérite. Finition mat ou effet pierre, palette MUSE (ivoire, sage, terracotta…), texte ou initiales sur demande. Un cadeau d''accueil qui a du sens.',
      'Déposez clés, montre, bijoux, pièces ou lunettes au retour à la maison. Parfait comme petit cadeau d''accueil ou de table.',
      'Inspiré par la Teranga sénégalaise : accueillir, ranger, et offrir un bel objet dès l''entrée de la maison.',
      'Console d''entrée, table de chevet, bureau, réception d''hôtel ou comptoir de boutique.',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 195,
      '["nouveauté","personnalisable","vide poche teranga"]'::jsonb
    ) ON CONFLICT (slug) DO UPDATE SET
      name = EXCLUDED.name,
      short_description = EXCLUDED.short_description,
      long_description = EXCLUDED.long_description,
      usage = EXCLUDED.usage,
      inspiration = EXCLUDED.inspiration,
      placement = EXCLUDED.placement,
      price = EXCLUDED.price,
      universe_id = EXCLUDED.universe_id
    RETURNING id INTO v_product_id;
    DELETE FROM public.product_images WHERE product_id = v_product_id;
    INSERT INTO public.product_images (product_id, image_url, alt_text, is_main, display_order)
    VALUES (v_product_id, '/products/ef36fbc4-cbc0-4795-926c-8877ae0c8079.png', 'VIDE-POCHE TERANGA REF M195 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M196
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M196',
      'ef669908-d41d-4eb4-b56a-f2912709e419',
      'Le vide-poche qui ne fait pas « vide-poche de supermarché ». VIDE-POCHE TERANGA REF M196 : beau, utile, personnalisable.',
      'Entre le porte-manteau et le canapé, il manquait souvent l''objet juste. VIDE-POCHE TERANGA REF M196 comble ce vide avec humour et sophistication : assez grand pour être utile, assez beau pour rester visible. Impression 3D artisanale, personnalisation facile — parce que même les petits objets méritent le sur-mesure.',
      'Déposez clés, montre, bijoux, pièces ou lunettes au retour à la maison. Parfait comme petit cadeau d''accueil ou de table.',
      'Inspiré par la Teranga sénégalaise : accueillir, ranger, et offrir un bel objet dès l''entrée de la maison.',
      'Console d''entrée, table de chevet, bureau, réception d''hôtel ou comptoir de boutique.',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 196,
      '["nouveauté","personnalisable","vide poche teranga"]'::jsonb
    ) ON CONFLICT (slug) DO UPDATE SET
      name = EXCLUDED.name,
      short_description = EXCLUDED.short_description,
      long_description = EXCLUDED.long_description,
      usage = EXCLUDED.usage,
      inspiration = EXCLUDED.inspiration,
      placement = EXCLUDED.placement,
      price = EXCLUDED.price,
      universe_id = EXCLUDED.universe_id
    RETURNING id INTO v_product_id;
    DELETE FROM public.product_images WHERE product_id = v_product_id;
    INSERT INTO public.product_images (product_id, image_url, alt_text, is_main, display_order)
    VALUES (v_product_id, '/products/ef669908-d41d-4eb4-b56a-f2912709e419.png', 'VIDE-POCHE TERANGA REF M196 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M197
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M197',
      'ef99dfc1-d420-4f74-b884-bc785a19fe37',
      'Votre entrée mérite mieux qu''une pile de clés en vrac. VIDE-POCHE TERANGA REF M197 accueille votre quotidien avec la chaleur de la Teranga.',
      'VIDE-POCHE TERANGA REF M197 est pensé pour ce moment où l''on franchit la porte les mains pleines et l''esprit ailleurs. Imprimé en 3D par MUSE, il accueille clés, montre et petits trésors du quotidien avec une finition soignée. Inspiré de la Teranga sénégalaise — accueillir avec générosité —, il habille votre entrée sans l''encombrer. Couleur, initiales, message discret : on l''adapte à votre maison, pas l''inverse.',
      'Déposez clés, montre, bijoux, pièces ou lunettes au retour à la maison. Parfait comme petit cadeau d''accueil ou de table.',
      'Inspiré par la Teranga sénégalaise : accueillir, ranger, et offrir un bel objet dès l''entrée de la maison.',
      'Console d''entrée, table de chevet, bureau, réception d''hôtel ou comptoir de boutique.',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 197,
      '["nouveauté","personnalisable","vide poche teranga"]'::jsonb
    ) ON CONFLICT (slug) DO UPDATE SET
      name = EXCLUDED.name,
      short_description = EXCLUDED.short_description,
      long_description = EXCLUDED.long_description,
      usage = EXCLUDED.usage,
      inspiration = EXCLUDED.inspiration,
      placement = EXCLUDED.placement,
      price = EXCLUDED.price,
      universe_id = EXCLUDED.universe_id
    RETURNING id INTO v_product_id;
    DELETE FROM public.product_images WHERE product_id = v_product_id;
    INSERT INTO public.product_images (product_id, image_url, alt_text, is_main, display_order)
    VALUES (v_product_id, '/products/ef99dfc1-d420-4f74-b884-bc785a19fe37.png', 'VIDE-POCHE TERANGA REF M197 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M198
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M198',
      'f378c648-bf2b-446a-b7b6-512b2b17b8e6',
      'Rentrer chez soi, poser ses clés, respirer : VIDE-POCHE TERANGA REF M198 transforme ce geste banal en petit rituel d''accueil.',
      'On connaît tous cette table d''entrée qui devient dépotoir. VIDE-POCHE TERANGA REF M198 remet de l''ordre avec une touche de caractère : lignes modernes, matière premium, personnalisation MUSE. Chaque pièce est imprimée sur demande, prête à devenir le premier objet que vos invités remarquent — et le dernier que vous touchez en sortant le matin.',
      'Déposez clés, montre, bijoux, pièces ou lunettes au retour à la maison. Parfait comme petit cadeau d''accueil ou de table.',
      'Inspiré par la Teranga sénégalaise : accueillir, ranger, et offrir un bel objet dès l''entrée de la maison.',
      'Console d''entrée, table de chevet, bureau, réception d''hôtel ou comptoir de boutique.',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 198,
      '["nouveauté","personnalisable","vide poche teranga"]'::jsonb
    ) ON CONFLICT (slug) DO UPDATE SET
      name = EXCLUDED.name,
      short_description = EXCLUDED.short_description,
      long_description = EXCLUDED.long_description,
      usage = EXCLUDED.usage,
      inspiration = EXCLUDED.inspiration,
      placement = EXCLUDED.placement,
      price = EXCLUDED.price,
      universe_id = EXCLUDED.universe_id
    RETURNING id INTO v_product_id;
    DELETE FROM public.product_images WHERE product_id = v_product_id;
    INSERT INTO public.product_images (product_id, image_url, alt_text, is_main, display_order)
    VALUES (v_product_id, '/products/f378c648-bf2b-446a-b7b6-512b2b17b8e6.png', 'VIDE-POCHE TERANGA REF M198 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M199
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M199',
      'f7010974-9a50-41b0-b069-ba3250da360c',
      'Clés, montre, pièces, lunettes — VIDE-POCHE TERANGA REF M199 range tout ça avec élégance. Zéro chaos, cent pour cent Teranga.',
      'VIDE-POCHE TERANGA REF M199 ne se contente pas de ranger : il raconte une invitation à ralentir. Posez vos clés, gardez votre montre à portée de main, offrez à votre entrée la dignité qu''elle mérite. Finition mat ou effet pierre, palette MUSE (ivoire, sage, terracotta…), texte ou initiales sur demande. Un cadeau d''accueil qui a du sens.',
      'Déposez clés, montre, bijoux, pièces ou lunettes au retour à la maison. Parfait comme petit cadeau d''accueil ou de table.',
      'Inspiré par la Teranga sénégalaise : accueillir, ranger, et offrir un bel objet dès l''entrée de la maison.',
      'Console d''entrée, table de chevet, bureau, réception d''hôtel ou comptoir de boutique.',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 199,
      '["nouveauté","personnalisable","vide poche teranga"]'::jsonb
    ) ON CONFLICT (slug) DO UPDATE SET
      name = EXCLUDED.name,
      short_description = EXCLUDED.short_description,
      long_description = EXCLUDED.long_description,
      usage = EXCLUDED.usage,
      inspiration = EXCLUDED.inspiration,
      placement = EXCLUDED.placement,
      price = EXCLUDED.price,
      universe_id = EXCLUDED.universe_id
    RETURNING id INTO v_product_id;
    DELETE FROM public.product_images WHERE product_id = v_product_id;
    INSERT INTO public.product_images (product_id, image_url, alt_text, is_main, display_order)
    VALUES (v_product_id, '/products/f7010974-9a50-41b0-b069-ba3250da360c.png', 'VIDE-POCHE TERANGA REF M199 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M200
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M200',
      'f8deda15-fbe8-4059-87ca-4d0b8832853a',
      'Le vide-poche qui ne fait pas « vide-poche de supermarché ». VIDE-POCHE TERANGA REF M200 : beau, utile, personnalisable.',
      'Entre le porte-manteau et le canapé, il manquait souvent l''objet juste. VIDE-POCHE TERANGA REF M200 comble ce vide avec humour et sophistication : assez grand pour être utile, assez beau pour rester visible. Impression 3D artisanale, personnalisation facile — parce que même les petits objets méritent le sur-mesure.',
      'Déposez clés, montre, bijoux, pièces ou lunettes au retour à la maison. Parfait comme petit cadeau d''accueil ou de table.',
      'Inspiré par la Teranga sénégalaise : accueillir, ranger, et offrir un bel objet dès l''entrée de la maison.',
      'Console d''entrée, table de chevet, bureau, réception d''hôtel ou comptoir de boutique.',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 200,
      '["nouveauté","personnalisable","vide poche teranga"]'::jsonb
    ) ON CONFLICT (slug) DO UPDATE SET
      name = EXCLUDED.name,
      short_description = EXCLUDED.short_description,
      long_description = EXCLUDED.long_description,
      usage = EXCLUDED.usage,
      inspiration = EXCLUDED.inspiration,
      placement = EXCLUDED.placement,
      price = EXCLUDED.price,
      universe_id = EXCLUDED.universe_id
    RETURNING id INTO v_product_id;
    DELETE FROM public.product_images WHERE product_id = v_product_id;
    INSERT INTO public.product_images (product_id, image_url, alt_text, is_main, display_order)
    VALUES (v_product_id, '/products/f8deda15-fbe8-4059-87ca-4d0b8832853a.png', 'VIDE-POCHE TERANGA REF M200 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M201
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M201',
      'f9801050-ba74-487e-91bb-07da32318049',
      'Votre entrée mérite mieux qu''une pile de clés en vrac. VIDE-POCHE TERANGA REF M201 accueille votre quotidien avec la chaleur de la Teranga.',
      'VIDE-POCHE TERANGA REF M201 est pensé pour ce moment où l''on franchit la porte les mains pleines et l''esprit ailleurs. Imprimé en 3D par MUSE, il accueille clés, montre et petits trésors du quotidien avec une finition soignée. Inspiré de la Teranga sénégalaise — accueillir avec générosité —, il habille votre entrée sans l''encombrer. Couleur, initiales, message discret : on l''adapte à votre maison, pas l''inverse.',
      'Déposez clés, montre, bijoux, pièces ou lunettes au retour à la maison. Parfait comme petit cadeau d''accueil ou de table.',
      'Inspiré par la Teranga sénégalaise : accueillir, ranger, et offrir un bel objet dès l''entrée de la maison.',
      'Console d''entrée, table de chevet, bureau, réception d''hôtel ou comptoir de boutique.',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 201,
      '["nouveauté","personnalisable","vide poche teranga"]'::jsonb
    ) ON CONFLICT (slug) DO UPDATE SET
      name = EXCLUDED.name,
      short_description = EXCLUDED.short_description,
      long_description = EXCLUDED.long_description,
      usage = EXCLUDED.usage,
      inspiration = EXCLUDED.inspiration,
      placement = EXCLUDED.placement,
      price = EXCLUDED.price,
      universe_id = EXCLUDED.universe_id
    RETURNING id INTO v_product_id;
    DELETE FROM public.product_images WHERE product_id = v_product_id;
    INSERT INTO public.product_images (product_id, image_url, alt_text, is_main, display_order)
    VALUES (v_product_id, '/products/f9801050-ba74-487e-91bb-07da32318049.png', 'VIDE-POCHE TERANGA REF M201 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M202
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M202',
      'fc8ad439-960f-477d-b2e7-49cf75a563ef',
      'Rentrer chez soi, poser ses clés, respirer : VIDE-POCHE TERANGA REF M202 transforme ce geste banal en petit rituel d''accueil.',
      'On connaît tous cette table d''entrée qui devient dépotoir. VIDE-POCHE TERANGA REF M202 remet de l''ordre avec une touche de caractère : lignes modernes, matière premium, personnalisation MUSE. Chaque pièce est imprimée sur demande, prête à devenir le premier objet que vos invités remarquent — et le dernier que vous touchez en sortant le matin.',
      'Déposez clés, montre, bijoux, pièces ou lunettes au retour à la maison. Parfait comme petit cadeau d''accueil ou de table.',
      'Inspiré par la Teranga sénégalaise : accueillir, ranger, et offrir un bel objet dès l''entrée de la maison.',
      'Console d''entrée, table de chevet, bureau, réception d''hôtel ou comptoir de boutique.',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 202,
      '["nouveauté","personnalisable","vide poche teranga"]'::jsonb
    ) ON CONFLICT (slug) DO UPDATE SET
      name = EXCLUDED.name,
      short_description = EXCLUDED.short_description,
      long_description = EXCLUDED.long_description,
      usage = EXCLUDED.usage,
      inspiration = EXCLUDED.inspiration,
      placement = EXCLUDED.placement,
      price = EXCLUDED.price,
      universe_id = EXCLUDED.universe_id
    RETURNING id INTO v_product_id;
    DELETE FROM public.product_images WHERE product_id = v_product_id;
    INSERT INTO public.product_images (product_id, image_url, alt_text, is_main, display_order)
    VALUES (v_product_id, '/products/fc8ad439-960f-477d-b2e7-49cf75a563ef.png', 'VIDE-POCHE TERANGA REF M202 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M203
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M203',
      'fde13dcd-4222-4ae0-a717-e3f7dd45e4b4',
      'Clés, montre, pièces, lunettes — VIDE-POCHE TERANGA REF M203 range tout ça avec élégance. Zéro chaos, cent pour cent Teranga.',
      'VIDE-POCHE TERANGA REF M203 ne se contente pas de ranger : il raconte une invitation à ralentir. Posez vos clés, gardez votre montre à portée de main, offrez à votre entrée la dignité qu''elle mérite. Finition mat ou effet pierre, palette MUSE (ivoire, sage, terracotta…), texte ou initiales sur demande. Un cadeau d''accueil qui a du sens.',
      'Déposez clés, montre, bijoux, pièces ou lunettes au retour à la maison. Parfait comme petit cadeau d''accueil ou de table.',
      'Inspiré par la Teranga sénégalaise : accueillir, ranger, et offrir un bel objet dès l''entrée de la maison.',
      'Console d''entrée, table de chevet, bureau, réception d''hôtel ou comptoir de boutique.',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 203,
      '["nouveauté","personnalisable","vide poche teranga"]'::jsonb
    ) ON CONFLICT (slug) DO UPDATE SET
      name = EXCLUDED.name,
      short_description = EXCLUDED.short_description,
      long_description = EXCLUDED.long_description,
      usage = EXCLUDED.usage,
      inspiration = EXCLUDED.inspiration,
      placement = EXCLUDED.placement,
      price = EXCLUDED.price,
      universe_id = EXCLUDED.universe_id
    RETURNING id INTO v_product_id;
    DELETE FROM public.product_images WHERE product_id = v_product_id;
    INSERT INTO public.product_images (product_id, image_url, alt_text, is_main, display_order)
    VALUES (v_product_id, '/products/fde13dcd-4222-4ae0-a717-e3f7dd45e4b4.png', 'VIDE-POCHE TERANGA REF M203 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M204
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M204',
      'fec94251-3516-4dac-a259-6c3232b75a80',
      'Le vide-poche qui ne fait pas « vide-poche de supermarché ». VIDE-POCHE TERANGA REF M204 : beau, utile, personnalisable.',
      'Entre le porte-manteau et le canapé, il manquait souvent l''objet juste. VIDE-POCHE TERANGA REF M204 comble ce vide avec humour et sophistication : assez grand pour être utile, assez beau pour rester visible. Impression 3D artisanale, personnalisation facile — parce que même les petits objets méritent le sur-mesure.',
      'Déposez clés, montre, bijoux, pièces ou lunettes au retour à la maison. Parfait comme petit cadeau d''accueil ou de table.',
      'Inspiré par la Teranga sénégalaise : accueillir, ranger, et offrir un bel objet dès l''entrée de la maison.',
      'Console d''entrée, table de chevet, bureau, réception d''hôtel ou comptoir de boutique.',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 204,
      '["nouveauté","personnalisable","vide poche teranga"]'::jsonb
    ) ON CONFLICT (slug) DO UPDATE SET
      name = EXCLUDED.name,
      short_description = EXCLUDED.short_description,
      long_description = EXCLUDED.long_description,
      usage = EXCLUDED.usage,
      inspiration = EXCLUDED.inspiration,
      placement = EXCLUDED.placement,
      price = EXCLUDED.price,
      universe_id = EXCLUDED.universe_id
    RETURNING id INTO v_product_id;
    DELETE FROM public.product_images WHERE product_id = v_product_id;
    INSERT INTO public.product_images (product_id, image_url, alt_text, is_main, display_order)
    VALUES (v_product_id, '/products/fec94251-3516-4dac-a259-6c3232b75a80.png', 'VIDE-POCHE TERANGA REF M204 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M205
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M205',
      'ff4f8c96-56f0-4ae5-a9bc-299d3db6af31',
      'Votre entrée mérite mieux qu''une pile de clés en vrac. VIDE-POCHE TERANGA REF M205 accueille votre quotidien avec la chaleur de la Teranga.',
      'VIDE-POCHE TERANGA REF M205 est pensé pour ce moment où l''on franchit la porte les mains pleines et l''esprit ailleurs. Imprimé en 3D par MUSE, il accueille clés, montre et petits trésors du quotidien avec une finition soignée. Inspiré de la Teranga sénégalaise — accueillir avec générosité —, il habille votre entrée sans l''encombrer. Couleur, initiales, message discret : on l''adapte à votre maison, pas l''inverse.',
      'Déposez clés, montre, bijoux, pièces ou lunettes au retour à la maison. Parfait comme petit cadeau d''accueil ou de table.',
      'Inspiré par la Teranga sénégalaise : accueillir, ranger, et offrir un bel objet dès l''entrée de la maison.',
      'Console d''entrée, table de chevet, bureau, réception d''hôtel ou comptoir de boutique.',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 205,
      '["nouveauté","personnalisable","vide poche teranga"]'::jsonb
    ) ON CONFLICT (slug) DO UPDATE SET
      name = EXCLUDED.name,
      short_description = EXCLUDED.short_description,
      long_description = EXCLUDED.long_description,
      usage = EXCLUDED.usage,
      inspiration = EXCLUDED.inspiration,
      placement = EXCLUDED.placement,
      price = EXCLUDED.price,
      universe_id = EXCLUDED.universe_id
    RETURNING id INTO v_product_id;
    DELETE FROM public.product_images WHERE product_id = v_product_id;
    INSERT INTO public.product_images (product_id, image_url, alt_text, is_main, display_order)
    VALUES (v_product_id, '/products/ff4f8c96-56f0-4ae5-a9bc-299d3db6af31.png', 'VIDE-POCHE TERANGA REF M205 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M206
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M206',
      'ffdb91c5-3280-481d-9cf0-bdffd7373ca3',
      'Rentrer chez soi, poser ses clés, respirer : VIDE-POCHE TERANGA REF M206 transforme ce geste banal en petit rituel d''accueil.',
      'On connaît tous cette table d''entrée qui devient dépotoir. VIDE-POCHE TERANGA REF M206 remet de l''ordre avec une touche de caractère : lignes modernes, matière premium, personnalisation MUSE. Chaque pièce est imprimée sur demande, prête à devenir le premier objet que vos invités remarquent — et le dernier que vous touchez en sortant le matin.',
      'Déposez clés, montre, bijoux, pièces ou lunettes au retour à la maison. Parfait comme petit cadeau d''accueil ou de table.',
      'Inspiré par la Teranga sénégalaise : accueillir, ranger, et offrir un bel objet dès l''entrée de la maison.',
      'Console d''entrée, table de chevet, bureau, réception d''hôtel ou comptoir de boutique.',
      9000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '3-5 heures',
      'PLA mat ou effet pierre',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["mot Teranga","couleur","initiales"]'::jsonb,
      'available', 'published', false, 206,
      '["nouveauté","personnalisable","vide poche teranga"]'::jsonb
    ) ON CONFLICT (slug) DO UPDATE SET
      name = EXCLUDED.name,
      short_description = EXCLUDED.short_description,
      long_description = EXCLUDED.long_description,
      usage = EXCLUDED.usage,
      inspiration = EXCLUDED.inspiration,
      placement = EXCLUDED.placement,
      price = EXCLUDED.price,
      universe_id = EXCLUDED.universe_id
    RETURNING id INTO v_product_id;
    DELETE FROM public.product_images WHERE product_id = v_product_id;
    INSERT INTO public.product_images (product_id, image_url, alt_text, is_main, display_order)
    VALUES (v_product_id, '/products/ffdb91c5-3280-481d-9cf0-bdffd7373ca3.png', 'VIDE-POCHE TERANGA REF M206 MUSE', true, 0);
  END IF;
END $$;
