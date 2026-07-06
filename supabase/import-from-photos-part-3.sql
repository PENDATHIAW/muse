-- Import automatique photos MUSE (partie)
-- Exécutez dans Supabase → SQL Editor, une partie à la fois
-- Partie 3/7 (40 produits)

DO $$
DECLARE
  v_universe_id UUID;
  v_product_id UUID;
BEGIN
  -- VIDE-POCHE TERANGA REF M57
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M57',
      '6e3b7dad-3db1-448c-b3df-d2eb565f3041',
      'Votre entrée mérite mieux qu''une pile de clés en vrac. VIDE-POCHE TERANGA REF M57 accueille votre quotidien avec la chaleur de la Teranga.',
      'VIDE-POCHE TERANGA REF M57 est pensé pour ce moment où l''on franchit la porte les mains pleines et l''esprit ailleurs. Imprimé en 3D par MUSE, il accueille clés, montre et petits trésors du quotidien avec une finition soignée. Inspiré de la Teranga sénégalaise — accueillir avec générosité —, il habille votre entrée sans l''encombrer. Couleur, initiales, message discret : on l''adapte à votre maison, pas l''inverse.',
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
      'available', 'published', false, 57,
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
    VALUES (v_product_id, '/products/6e3b7dad-3db1-448c-b3df-d2eb565f3041.png', 'VIDE-POCHE TERANGA REF M57 MUSE', true, 0);
  END IF;

  -- RANGE NATTE REF M12
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'salaah';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'RANGE NATTE REF M12',
      '6f81e766-2c98-42eb-9963-914a452ba95e',
      'Entre deux prières, RANGE NATTE REF M12 vous attend — beau, stable, personnalisable.',
      'Sobriété ne veut pas dire tristesse. RANGE NATTE REF M12 apporte chaleur et ordre à votre Salaah — support tasbih, range natte ou coin prière selon le modèle. Finition premium, personnalisation facile.',
      'Posez tasbih, natte ou accessoires de prière sur le support. Organisez votre coin prière avec élégance et pudeur.',
      'Inspiré des rituels de prière et de recueillement — des objets beaux, sobres et fonctionnels pour votre espace Salaah.',
      'Coin prière, chambre, salon discret, bureau de prière ou espace méditation.',
      10000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '4-6 heures',
      'PLA mat ou effet bois',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["couleur","motif discret","initiales"]'::jsonb,
      'available', 'published', false, 12,
      '["nouveauté","personnalisable","salaah"]'::jsonb
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
    VALUES (v_product_id, '/products/6f81e766-2c98-42eb-9963-914a452ba95e.png', 'RANGE NATTE REF M12 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M58
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M58',
      '701e7cad-2e6f-4adb-8782-031d68758ec0',
      'Rentrer chez soi, poser ses clés, respirer : VIDE-POCHE TERANGA REF M58 transforme ce geste banal en petit rituel d''accueil.',
      'On connaît tous cette table d''entrée qui devient dépotoir. VIDE-POCHE TERANGA REF M58 remet de l''ordre avec une touche de caractère : lignes modernes, matière premium, personnalisation MUSE. Chaque pièce est imprimée sur demande, prête à devenir le premier objet que vos invités remarquent — et le dernier que vous touchez en sortant le matin.',
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
      'available', 'published', false, 58,
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
    VALUES (v_product_id, '/products/701e7cad-2e6f-4adb-8782-031d68758ec0.png', 'VIDE-POCHE TERANGA REF M58 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M59
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M59',
      '706ec26a-6669-4ebf-982f-e4b11050f368',
      'Clés, montre, pièces, lunettes — VIDE-POCHE TERANGA REF M59 range tout ça avec élégance. Zéro chaos, cent pour cent Teranga.',
      'VIDE-POCHE TERANGA REF M59 ne se contente pas de ranger : il raconte une invitation à ralentir. Posez vos clés, gardez votre montre à portée de main, offrez à votre entrée la dignité qu''elle mérite. Finition mat ou effet pierre, palette MUSE (ivoire, sage, terracotta…), texte ou initiales sur demande. Un cadeau d''accueil qui a du sens.',
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
      'available', 'published', false, 59,
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
    VALUES (v_product_id, '/products/706ec26a-6669-4ebf-982f-e4b11050f368.png', 'VIDE-POCHE TERANGA REF M59 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M60
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M60',
      '70d3599f-6ea8-4b3d-9bab-d731edf1c8eb',
      'Le vide-poche qui ne fait pas « vide-poche de supermarché ». VIDE-POCHE TERANGA REF M60 : beau, utile, personnalisable.',
      'Entre le porte-manteau et le canapé, il manquait souvent l''objet juste. VIDE-POCHE TERANGA REF M60 comble ce vide avec humour et sophistication : assez grand pour être utile, assez beau pour rester visible. Impression 3D artisanale, personnalisation facile — parce que même les petits objets méritent le sur-mesure.',
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
      'available', 'published', false, 60,
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
    VALUES (v_product_id, '/products/70D3599F-6EA8-4B3D-9BAB-D731EDF1C8EB.png', 'VIDE-POCHE TERANGA REF M60 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M61
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M61',
      '70b50a96-7718-48e5-854b-1d54ff05f580',
      'Votre entrée mérite mieux qu''une pile de clés en vrac. VIDE-POCHE TERANGA REF M61 accueille votre quotidien avec la chaleur de la Teranga.',
      'VIDE-POCHE TERANGA REF M61 est pensé pour ce moment où l''on franchit la porte les mains pleines et l''esprit ailleurs. Imprimé en 3D par MUSE, il accueille clés, montre et petits trésors du quotidien avec une finition soignée. Inspiré de la Teranga sénégalaise — accueillir avec générosité —, il habille votre entrée sans l''encombrer. Couleur, initiales, message discret : on l''adapte à votre maison, pas l''inverse.',
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
      'available', 'published', false, 61,
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
    VALUES (v_product_id, '/products/70b50a96-7718-48e5-854b-1d54ff05f580.png', 'VIDE-POCHE TERANGA REF M61 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M62
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M62',
      '71b28e42-aaf9-4014-8309-f33ab41826a9',
      'Rentrer chez soi, poser ses clés, respirer : VIDE-POCHE TERANGA REF M62 transforme ce geste banal en petit rituel d''accueil.',
      'On connaît tous cette table d''entrée qui devient dépotoir. VIDE-POCHE TERANGA REF M62 remet de l''ordre avec une touche de caractère : lignes modernes, matière premium, personnalisation MUSE. Chaque pièce est imprimée sur demande, prête à devenir le premier objet que vos invités remarquent — et le dernier que vous touchez en sortant le matin.',
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
      'available', 'published', false, 62,
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
    VALUES (v_product_id, '/products/71b28e42-aaf9-4014-8309-f33ab41826a9.png', 'VIDE-POCHE TERANGA REF M62 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M63
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M63',
      '71c76ed6-42d8-44c7-8f23-de6c8ad51861',
      'Clés, montre, pièces, lunettes — VIDE-POCHE TERANGA REF M63 range tout ça avec élégance. Zéro chaos, cent pour cent Teranga.',
      'VIDE-POCHE TERANGA REF M63 ne se contente pas de ranger : il raconte une invitation à ralentir. Posez vos clés, gardez votre montre à portée de main, offrez à votre entrée la dignité qu''elle mérite. Finition mat ou effet pierre, palette MUSE (ivoire, sage, terracotta…), texte ou initiales sur demande. Un cadeau d''accueil qui a du sens.',
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
      'available', 'published', false, 63,
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
    VALUES (v_product_id, '/products/71c76ed6-42d8-44c7-8f23-de6c8ad51861.png', 'VIDE-POCHE TERANGA REF M63 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M64
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M64',
      '721f7208-9fcb-445b-b705-2b2d2a1595a2',
      'Le vide-poche qui ne fait pas « vide-poche de supermarché ». VIDE-POCHE TERANGA REF M64 : beau, utile, personnalisable.',
      'Entre le porte-manteau et le canapé, il manquait souvent l''objet juste. VIDE-POCHE TERANGA REF M64 comble ce vide avec humour et sophistication : assez grand pour être utile, assez beau pour rester visible. Impression 3D artisanale, personnalisation facile — parce que même les petits objets méritent le sur-mesure.',
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
      'available', 'published', false, 64,
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
    VALUES (v_product_id, '/products/721f7208-9fcb-445b-b705-2b2d2a1595a2.png', 'VIDE-POCHE TERANGA REF M64 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M65
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M65',
      '724c4222-7896-40ad-a6b8-dc042cfbf636',
      'Votre entrée mérite mieux qu''une pile de clés en vrac. VIDE-POCHE TERANGA REF M65 accueille votre quotidien avec la chaleur de la Teranga.',
      'VIDE-POCHE TERANGA REF M65 est pensé pour ce moment où l''on franchit la porte les mains pleines et l''esprit ailleurs. Imprimé en 3D par MUSE, il accueille clés, montre et petits trésors du quotidien avec une finition soignée. Inspiré de la Teranga sénégalaise — accueillir avec générosité —, il habille votre entrée sans l''encombrer. Couleur, initiales, message discret : on l''adapte à votre maison, pas l''inverse.',
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
      'available', 'published', false, 65,
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
    VALUES (v_product_id, '/products/724c4222-7896-40ad-a6b8-dc042cfbf636.png', 'VIDE-POCHE TERANGA REF M65 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M66
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M66',
      '72c20f5c-2316-46e1-9347-12e24b07419d-l0-001-06-07-2025-22-02-00',
      'Rentrer chez soi, poser ses clés, respirer : VIDE-POCHE TERANGA REF M66 transforme ce geste banal en petit rituel d''accueil.',
      'On connaît tous cette table d''entrée qui devient dépotoir. VIDE-POCHE TERANGA REF M66 remet de l''ordre avec une touche de caractère : lignes modernes, matière premium, personnalisation MUSE. Chaque pièce est imprimée sur demande, prête à devenir le premier objet que vos invités remarquent — et le dernier que vous touchez en sortant le matin.',
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
      'available', 'published', false, 66,
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
    VALUES (v_product_id, '/products/72C20F5C-2316-46E1-9347-12E24B07419D_L0_001-06_07_2025 22_02_00.png', 'VIDE-POCHE TERANGA REF M66 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M67
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M67',
      '72e33712-6df9-4227-9143-416e82e126cb',
      'Clés, montre, pièces, lunettes — VIDE-POCHE TERANGA REF M67 range tout ça avec élégance. Zéro chaos, cent pour cent Teranga.',
      'VIDE-POCHE TERANGA REF M67 ne se contente pas de ranger : il raconte une invitation à ralentir. Posez vos clés, gardez votre montre à portée de main, offrez à votre entrée la dignité qu''elle mérite. Finition mat ou effet pierre, palette MUSE (ivoire, sage, terracotta…), texte ou initiales sur demande. Un cadeau d''accueil qui a du sens.',
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
      'available', 'published', false, 67,
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
    VALUES (v_product_id, '/products/72e33712-6df9-4227-9143-416e82e126cb.png', 'VIDE-POCHE TERANGA REF M67 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M68
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M68',
      '72fc7323-8a59-4003-a325-3bef4a09107c',
      'Le vide-poche qui ne fait pas « vide-poche de supermarché ». VIDE-POCHE TERANGA REF M68 : beau, utile, personnalisable.',
      'Entre le porte-manteau et le canapé, il manquait souvent l''objet juste. VIDE-POCHE TERANGA REF M68 comble ce vide avec humour et sophistication : assez grand pour être utile, assez beau pour rester visible. Impression 3D artisanale, personnalisation facile — parce que même les petits objets méritent le sur-mesure.',
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
      'available', 'published', false, 68,
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
    VALUES (v_product_id, '/products/72fc7323-8a59-4003-a325-3bef4a09107c.png', 'VIDE-POCHE TERANGA REF M68 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M69
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M69',
      '7356386b-fab6-4ad5-95e7-bee9d76a6bb2',
      'Votre entrée mérite mieux qu''une pile de clés en vrac. VIDE-POCHE TERANGA REF M69 accueille votre quotidien avec la chaleur de la Teranga.',
      'VIDE-POCHE TERANGA REF M69 est pensé pour ce moment où l''on franchit la porte les mains pleines et l''esprit ailleurs. Imprimé en 3D par MUSE, il accueille clés, montre et petits trésors du quotidien avec une finition soignée. Inspiré de la Teranga sénégalaise — accueillir avec générosité —, il habille votre entrée sans l''encombrer. Couleur, initiales, message discret : on l''adapte à votre maison, pas l''inverse.',
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
      'available', 'published', false, 69,
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
    VALUES (v_product_id, '/products/7356386B-FAB6-4AD5-95E7-BEE9D76A6BB2.png', 'VIDE-POCHE TERANGA REF M69 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M70
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M70',
      '737e1d1d-c32f-4daa-b007-a6a3d933ef29',
      'Rentrer chez soi, poser ses clés, respirer : VIDE-POCHE TERANGA REF M70 transforme ce geste banal en petit rituel d''accueil.',
      'On connaît tous cette table d''entrée qui devient dépotoir. VIDE-POCHE TERANGA REF M70 remet de l''ordre avec une touche de caractère : lignes modernes, matière premium, personnalisation MUSE. Chaque pièce est imprimée sur demande, prête à devenir le premier objet que vos invités remarquent — et le dernier que vous touchez en sortant le matin.',
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
      'available', 'published', false, 70,
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
    VALUES (v_product_id, '/products/737e1d1d-c32f-4daa-b007-a6a3d933ef29.png', 'VIDE-POCHE TERANGA REF M70 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M71
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M71',
      '7411cb82-60c5-4e0a-86f7-5dee795a9150',
      'Clés, montre, pièces, lunettes — VIDE-POCHE TERANGA REF M71 range tout ça avec élégance. Zéro chaos, cent pour cent Teranga.',
      'VIDE-POCHE TERANGA REF M71 ne se contente pas de ranger : il raconte une invitation à ralentir. Posez vos clés, gardez votre montre à portée de main, offrez à votre entrée la dignité qu''elle mérite. Finition mat ou effet pierre, palette MUSE (ivoire, sage, terracotta…), texte ou initiales sur demande. Un cadeau d''accueil qui a du sens.',
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
      'available', 'published', false, 71,
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
    VALUES (v_product_id, '/products/7411cb82-60c5-4e0a-86f7-5dee795a9150.png', 'VIDE-POCHE TERANGA REF M71 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M72
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M72',
      '7610c090-6736-443b-9936-68fbb7cac601',
      'Le vide-poche qui ne fait pas « vide-poche de supermarché ». VIDE-POCHE TERANGA REF M72 : beau, utile, personnalisable.',
      'Entre le porte-manteau et le canapé, il manquait souvent l''objet juste. VIDE-POCHE TERANGA REF M72 comble ce vide avec humour et sophistication : assez grand pour être utile, assez beau pour rester visible. Impression 3D artisanale, personnalisation facile — parce que même les petits objets méritent le sur-mesure.',
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
      'available', 'published', false, 72,
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
    VALUES (v_product_id, '/products/7610c090-6736-443b-9936-68fbb7cac601.png', 'VIDE-POCHE TERANGA REF M72 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M73
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M73',
      '76ac758b-74a5-45d8-b764-2e97b0d1d74d',
      'Votre entrée mérite mieux qu''une pile de clés en vrac. VIDE-POCHE TERANGA REF M73 accueille votre quotidien avec la chaleur de la Teranga.',
      'VIDE-POCHE TERANGA REF M73 est pensé pour ce moment où l''on franchit la porte les mains pleines et l''esprit ailleurs. Imprimé en 3D par MUSE, il accueille clés, montre et petits trésors du quotidien avec une finition soignée. Inspiré de la Teranga sénégalaise — accueillir avec générosité —, il habille votre entrée sans l''encombrer. Couleur, initiales, message discret : on l''adapte à votre maison, pas l''inverse.',
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
      'available', 'published', false, 73,
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
    VALUES (v_product_id, '/products/76ac758b-74a5-45d8-b764-2e97b0d1d74d.png', 'VIDE-POCHE TERANGA REF M73 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M74
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M74',
      '772df2fc-0358-4d6f-abb6-c9d64c003421',
      'Rentrer chez soi, poser ses clés, respirer : VIDE-POCHE TERANGA REF M74 transforme ce geste banal en petit rituel d''accueil.',
      'On connaît tous cette table d''entrée qui devient dépotoir. VIDE-POCHE TERANGA REF M74 remet de l''ordre avec une touche de caractère : lignes modernes, matière premium, personnalisation MUSE. Chaque pièce est imprimée sur demande, prête à devenir le premier objet que vos invités remarquent — et le dernier que vous touchez en sortant le matin.',
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
      'available', 'published', false, 74,
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
    VALUES (v_product_id, '/products/772df2fc-0358-4d6f-abb6-c9d64c003421.png', 'VIDE-POCHE TERANGA REF M74 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M75
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M75',
      '79679bd7-d285-4eb2-9815-7d4716c494d4',
      'Clés, montre, pièces, lunettes — VIDE-POCHE TERANGA REF M75 range tout ça avec élégance. Zéro chaos, cent pour cent Teranga.',
      'VIDE-POCHE TERANGA REF M75 ne se contente pas de ranger : il raconte une invitation à ralentir. Posez vos clés, gardez votre montre à portée de main, offrez à votre entrée la dignité qu''elle mérite. Finition mat ou effet pierre, palette MUSE (ivoire, sage, terracotta…), texte ou initiales sur demande. Un cadeau d''accueil qui a du sens.',
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
      'available', 'published', false, 75,
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
    VALUES (v_product_id, '/products/79679bd7-d285-4eb2-9815-7d4716c494d4.png', 'VIDE-POCHE TERANGA REF M75 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M76
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M76',
      '797055d8-1423-4406-9e0b-b5b0e895a600',
      'Le vide-poche qui ne fait pas « vide-poche de supermarché ». VIDE-POCHE TERANGA REF M76 : beau, utile, personnalisable.',
      'Entre le porte-manteau et le canapé, il manquait souvent l''objet juste. VIDE-POCHE TERANGA REF M76 comble ce vide avec humour et sophistication : assez grand pour être utile, assez beau pour rester visible. Impression 3D artisanale, personnalisation facile — parce que même les petits objets méritent le sur-mesure.',
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
      'available', 'published', false, 76,
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
    VALUES (v_product_id, '/products/797055d8-1423-4406-9e0b-b5b0e895a600.png', 'VIDE-POCHE TERANGA REF M76 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M77
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M77',
      '7b7133f7-1fea-4ff0-a513-250c2b96ec00',
      'Votre entrée mérite mieux qu''une pile de clés en vrac. VIDE-POCHE TERANGA REF M77 accueille votre quotidien avec la chaleur de la Teranga.',
      'VIDE-POCHE TERANGA REF M77 est pensé pour ce moment où l''on franchit la porte les mains pleines et l''esprit ailleurs. Imprimé en 3D par MUSE, il accueille clés, montre et petits trésors du quotidien avec une finition soignée. Inspiré de la Teranga sénégalaise — accueillir avec générosité —, il habille votre entrée sans l''encombrer. Couleur, initiales, message discret : on l''adapte à votre maison, pas l''inverse.',
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
      'available', 'published', false, 77,
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
    VALUES (v_product_id, '/products/7b7133f7-1fea-4ff0-a513-250c2b96ec00.png', 'VIDE-POCHE TERANGA REF M77 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M78
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M78',
      '7c7a5280-5662-43e9-b1c9-e37a9c986183',
      'Rentrer chez soi, poser ses clés, respirer : VIDE-POCHE TERANGA REF M78 transforme ce geste banal en petit rituel d''accueil.',
      'On connaît tous cette table d''entrée qui devient dépotoir. VIDE-POCHE TERANGA REF M78 remet de l''ordre avec une touche de caractère : lignes modernes, matière premium, personnalisation MUSE. Chaque pièce est imprimée sur demande, prête à devenir le premier objet que vos invités remarquent — et le dernier que vous touchez en sortant le matin.',
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
      'available', 'published', false, 78,
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
    VALUES (v_product_id, '/products/7c7a5280-5662-43e9-b1c9-e37a9c986183.png', 'VIDE-POCHE TERANGA REF M78 MUSE', true, 0);
  END IF;

  -- BOÎTE À CLÉS REF M02
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'boite-a-cles-murale';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'BOÎTE À CLÉS REF M02',
      '7ce97648-f8c0-4e23-aa3a-8aded94732bc',
      'Entrée rangée, esprit léger : BOÎTE À CLÉS REF M02 fixe clés et badges au bon endroit.',
      'L''entrée dit beaucoup de chez qui l''on entre. BOÎTE À CLÉS REF M02 lui donne une voix calme et organisée : compartiments pratiques, finition premium, montage mural simple. Personnalisation MUSE pour une pièce qui vous ressemble.',
      'Accrochez la boîte près de la porte. Déposez clés, badges et petits objets en arrivant. Certains modèles incluent un crochet ou un vide-poche intégré.',
      'Née du besoin de ne plus chercher ses clés en sortant — une entrée organisée, esthétique et fonctionnelle.',
      'Entrée, couloir, prise murale à hauteur de main (1,40 m environ).',
      10000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '4-6 heures',
      'PLA+ ou PETG',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["nom","couleur","logo discret"]'::jsonb,
      'available', 'published', true, 2,
      '["nouveauté","personnalisable","boite a cles murale"]'::jsonb
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
    VALUES (v_product_id, '/products/7ce97648-f8c0-4e23-aa3a-8aded94732bc.png', 'BOÎTE À CLÉS REF M02 MUSE', true, 0);
  END IF;

  -- RANGE NATTE REF M13
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'salaah';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'RANGE NATTE REF M13',
      '7db3328e-e1de-4918-be3b-0449e053d25c',
      'Votre coin prière mérite autant de soin que votre salon. RANGE NATTE REF M13 — sobriété, beauté, recueillement.',
      'RANGE NATTE REF M13 est pensé pour accompagner vos moments de Salaah avec respect et esthétique. Imprimé en 3D par MUSE, il accueille tasbih, natte ou petits accessoires de prière avec une finition sobre et durable. Couleur, motif discret ou initiales : personnalisation MUSE incluse.',
      'Posez tasbih, natte ou accessoires de prière sur le support. Organisez votre coin prière avec élégance et pudeur.',
      'Inspiré des rituels de prière et de recueillement — des objets beaux, sobres et fonctionnels pour votre espace Salaah.',
      'Coin prière, chambre, salon discret, bureau de prière ou espace méditation.',
      10000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '4-6 heures',
      'PLA mat ou effet bois',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["couleur","motif discret","initiales"]'::jsonb,
      'available', 'published', false, 13,
      '["nouveauté","personnalisable","salaah"]'::jsonb
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
    VALUES (v_product_id, '/products/7db3328e-e1de-4918-be3b-0449e053d25c.png', 'RANGE NATTE REF M13 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M79
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M79',
      '7ec427f0-9563-485d-aaa9-0d83640e2352',
      'Clés, montre, pièces, lunettes — VIDE-POCHE TERANGA REF M79 range tout ça avec élégance. Zéro chaos, cent pour cent Teranga.',
      'VIDE-POCHE TERANGA REF M79 ne se contente pas de ranger : il raconte une invitation à ralentir. Posez vos clés, gardez votre montre à portée de main, offrez à votre entrée la dignité qu''elle mérite. Finition mat ou effet pierre, palette MUSE (ivoire, sage, terracotta…), texte ou initiales sur demande. Un cadeau d''accueil qui a du sens.',
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
      'available', 'published', false, 79,
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
    VALUES (v_product_id, '/products/7ec427f0-9563-485d-aaa9-0d83640e2352.png', 'VIDE-POCHE TERANGA REF M79 MUSE', true, 0);
  END IF;

  -- COIN PRIÈRE REF M14
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'salaah';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'COIN PRIÈRE REF M14',
      '808ac9ed-e725-430b-ac6e-af6b42a3a054',
      'COIN PRIÈRE REF M14 : l''objet Salaah qui structure votre rituel avec élégance et pudeur.',
      'Un espace de prière harmonieux change la qualité du recueillement. COIN PRIÈRE REF M14 structure votre coin Salaah sans ostentation — lignes épurées, matériaux soignés, usage quotidien. Bureau de prière, chambre ou salon discret.',
      'Posez tasbih, natte ou accessoires de prière sur le support. Organisez votre coin prière avec élégance et pudeur.',
      'Inspiré des rituels de prière et de recueillement — des objets beaux, sobres et fonctionnels pour votre espace Salaah.',
      'Coin prière, chambre, salon discret, bureau de prière ou espace méditation.',
      10000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '4-6 heures',
      'PLA mat ou effet bois',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["couleur","motif discret","initiales"]'::jsonb,
      'available', 'published', false, 14,
      '["nouveauté","personnalisable","salaah"]'::jsonb
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
    VALUES (v_product_id, '/products/808ac9ed-e725-430b-ac6e-af6b42a3a054.png', 'COIN PRIÈRE REF M14 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M80
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M80',
      '8358444d-0373-4a41-a3b1-52a1ae36d31c',
      'Le vide-poche qui ne fait pas « vide-poche de supermarché ». VIDE-POCHE TERANGA REF M80 : beau, utile, personnalisable.',
      'Entre le porte-manteau et le canapé, il manquait souvent l''objet juste. VIDE-POCHE TERANGA REF M80 comble ce vide avec humour et sophistication : assez grand pour être utile, assez beau pour rester visible. Impression 3D artisanale, personnalisation facile — parce que même les petits objets méritent le sur-mesure.',
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
      'available', 'published', false, 80,
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
    VALUES (v_product_id, '/products/8358444d-0373-4a41-a3b1-52a1ae36d31c.png', 'VIDE-POCHE TERANGA REF M80 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M81
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M81',
      '843866b4-26bf-4321-876c-a1cfe0bf3fd2',
      'Votre entrée mérite mieux qu''une pile de clés en vrac. VIDE-POCHE TERANGA REF M81 accueille votre quotidien avec la chaleur de la Teranga.',
      'VIDE-POCHE TERANGA REF M81 est pensé pour ce moment où l''on franchit la porte les mains pleines et l''esprit ailleurs. Imprimé en 3D par MUSE, il accueille clés, montre et petits trésors du quotidien avec une finition soignée. Inspiré de la Teranga sénégalaise — accueillir avec générosité —, il habille votre entrée sans l''encombrer. Couleur, initiales, message discret : on l''adapte à votre maison, pas l''inverse.',
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
      'available', 'published', false, 81,
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
    VALUES (v_product_id, '/products/843866b4-26bf-4321-876c-a1cfe0bf3fd2.png', 'VIDE-POCHE TERANGA REF M81 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M82
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M82',
      '84bda87e-9dac-4f7a-b39b-aa812d52fa3f-2',
      'Rentrer chez soi, poser ses clés, respirer : VIDE-POCHE TERANGA REF M82 transforme ce geste banal en petit rituel d''accueil.',
      'On connaît tous cette table d''entrée qui devient dépotoir. VIDE-POCHE TERANGA REF M82 remet de l''ordre avec une touche de caractère : lignes modernes, matière premium, personnalisation MUSE. Chaque pièce est imprimée sur demande, prête à devenir le premier objet que vos invités remarquent — et le dernier que vous touchez en sortant le matin.',
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
      'available', 'published', false, 82,
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
    VALUES (v_product_id, '/products/84bda87e-9dac-4f7a-b39b-aa812d52fa3f-2.png', 'VIDE-POCHE TERANGA REF M82 MUSE', true, 0);
  END IF;

  -- RANGE NATTE REF M15
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'salaah';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'RANGE NATTE REF M15',
      '84bda87e-9dac-4f7a-b39b-aa812d52fa3f',
      'Tasbih, natte ou accessoires — RANGE NATTE REF M15 leur offre enfin une place digne.',
      'RANGE NATTE REF M15 transforme un geste simple en rituel soigné. Posez, respirez, reprenez : chaque détail est pensé pour durer et embellir votre pratique. Signé MUSE, imprimé sur commande.',
      'Posez tasbih, natte ou accessoires de prière sur le support. Organisez votre coin prière avec élégance et pudeur.',
      'Inspiré des rituels de prière et de recueillement — des objets beaux, sobres et fonctionnels pour votre espace Salaah.',
      'Coin prière, chambre, salon discret, bureau de prière ou espace méditation.',
      10000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '4-6 heures',
      'PLA mat ou effet bois',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["couleur","motif discret","initiales"]'::jsonb,
      'available', 'published', false, 15,
      '["nouveauté","personnalisable","salaah"]'::jsonb
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
    VALUES (v_product_id, '/products/84bda87e-9dac-4f7a-b39b-aa812d52fa3f.png', 'RANGE NATTE REF M15 MUSE', true, 0);
  END IF;

  -- DÉCO MURALE REF M04
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'mini-deco-murale-senegal';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'DÉCO MURALE REF M04',
      '85819db2-7dcc-463d-b7e1-1e499b07003f',
      'Un mur un peu nu ? DÉCO MURALE REF M04 lui offre une âme sénégalaise, en 3D et avec caractère.',
      'Offrir ou s''offrir un morceau de Sénégal : DÉCO MURALE REF M04 le fait avec élégance. Pièce unique, finition premium, personnalisation MUSE pour coller à votre espace et à votre sensibilité.',
      'Accrochez ou posez la pièce comme élément décoratif. Peut être offerte en souvenir ou cadeau.',
      'Hommage aux symboles, couleurs et motifs du Sénégal — une touche culturelle et chaleureuse.',
      'Mur du salon, entrée, chambre ou espace bureau.',
      10000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '4-7 heures',
      'PLA mat multicolore',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["symbole","couleur","taille"]'::jsonb,
      'available', 'published', false, 4,
      '["nouveauté","personnalisable","mini deco murale senegal"]'::jsonb
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
    VALUES (v_product_id, '/products/85819db2-7dcc-463d-b7e1-1e499b07003f.png', 'DÉCO MURALE REF M04 MUSE', true, 0);
  END IF;

  -- SUPPORT TASBIH REF M16
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'salaah';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'SUPPORT TASBIH REF M16',
      '8591e1a1-052c-4691-a119-87a051468180',
      'Entre deux prières, SUPPORT TASBIH REF M16 vous attend — beau, stable, personnalisable.',
      'Sobriété ne veut pas dire tristesse. SUPPORT TASBIH REF M16 apporte chaleur et ordre à votre Salaah — support tasbih, range natte ou coin prière selon le modèle. Finition premium, personnalisation facile.',
      'Posez tasbih, natte ou accessoires de prière sur le support. Organisez votre coin prière avec élégance et pudeur.',
      'Inspiré des rituels de prière et de recueillement — des objets beaux, sobres et fonctionnels pour votre espace Salaah.',
      'Coin prière, chambre, salon discret, bureau de prière ou espace méditation.',
      10000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '4-6 heures',
      'PLA mat ou effet bois',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["couleur","motif discret","initiales"]'::jsonb,
      'available', 'published', false, 16,
      '["nouveauté","personnalisable","salaah"]'::jsonb
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
    VALUES (v_product_id, '/products/8591e1a1-052c-4691-a119-87a051468180.png', 'SUPPORT TASBIH REF M16 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M83
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M83',
      '867e9ed3-19fc-4035-aa1e-a20639f744d3',
      'Clés, montre, pièces, lunettes — VIDE-POCHE TERANGA REF M83 range tout ça avec élégance. Zéro chaos, cent pour cent Teranga.',
      'VIDE-POCHE TERANGA REF M83 ne se contente pas de ranger : il raconte une invitation à ralentir. Posez vos clés, gardez votre montre à portée de main, offrez à votre entrée la dignité qu''elle mérite. Finition mat ou effet pierre, palette MUSE (ivoire, sage, terracotta…), texte ou initiales sur demande. Un cadeau d''accueil qui a du sens.',
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
      'available', 'published', false, 83,
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
    VALUES (v_product_id, '/products/867e9ed3-19fc-4035-aa1e-a20639f744d3.png', 'VIDE-POCHE TERANGA REF M83 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M84
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M84',
      '87a930a8-ed5f-4690-960a-2675996ad22a',
      'Le vide-poche qui ne fait pas « vide-poche de supermarché ». VIDE-POCHE TERANGA REF M84 : beau, utile, personnalisable.',
      'Entre le porte-manteau et le canapé, il manquait souvent l''objet juste. VIDE-POCHE TERANGA REF M84 comble ce vide avec humour et sophistication : assez grand pour être utile, assez beau pour rester visible. Impression 3D artisanale, personnalisation facile — parce que même les petits objets méritent le sur-mesure.',
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
      'available', 'published', false, 84,
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
    VALUES (v_product_id, '/products/87a930a8-ed5f-4690-960a-2675996ad22a.png', 'VIDE-POCHE TERANGA REF M84 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M85
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M85',
      '88403425-8050-4bca-97b3-6318678822d5',
      'Votre entrée mérite mieux qu''une pile de clés en vrac. VIDE-POCHE TERANGA REF M85 accueille votre quotidien avec la chaleur de la Teranga.',
      'VIDE-POCHE TERANGA REF M85 est pensé pour ce moment où l''on franchit la porte les mains pleines et l''esprit ailleurs. Imprimé en 3D par MUSE, il accueille clés, montre et petits trésors du quotidien avec une finition soignée. Inspiré de la Teranga sénégalaise — accueillir avec générosité —, il habille votre entrée sans l''encombrer. Couleur, initiales, message discret : on l''adapte à votre maison, pas l''inverse.',
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
      'available', 'published', false, 85,
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
    VALUES (v_product_id, '/products/88403425-8050-4bca-97b3-6318678822d5.png', 'VIDE-POCHE TERANGA REF M85 MUSE', true, 0);
  END IF;

  -- SUPPORT TASBIH REF M17
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'salaah';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'SUPPORT TASBIH REF M17',
      '897f4b4b-5cb5-4f65-b960-166aab3a8747',
      'Votre coin prière mérite autant de soin que votre salon. SUPPORT TASBIH REF M17 — sobriété, beauté, recueillement.',
      'SUPPORT TASBIH REF M17 est pensé pour accompagner vos moments de Salaah avec respect et esthétique. Imprimé en 3D par MUSE, il accueille tasbih, natte ou petits accessoires de prière avec une finition sobre et durable. Couleur, motif discret ou initiales : personnalisation MUSE incluse.',
      'Posez tasbih, natte ou accessoires de prière sur le support. Organisez votre coin prière avec élégance et pudeur.',
      'Inspiré des rituels de prière et de recueillement — des objets beaux, sobres et fonctionnels pour votre espace Salaah.',
      'Coin prière, chambre, salon discret, bureau de prière ou espace méditation.',
      10000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '4-6 heures',
      'PLA mat ou effet bois',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["couleur","motif discret","initiales"]'::jsonb,
      'available', 'published', false, 17,
      '["nouveauté","personnalisable","salaah"]'::jsonb
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
    VALUES (v_product_id, '/products/897f4b4b-5cb5-4f65-b960-166aab3a8747.png', 'SUPPORT TASBIH REF M17 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M86
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M86',
      '89f83c9e-97fb-4f65-b8b4-367c4621449d',
      'Rentrer chez soi, poser ses clés, respirer : VIDE-POCHE TERANGA REF M86 transforme ce geste banal en petit rituel d''accueil.',
      'On connaît tous cette table d''entrée qui devient dépotoir. VIDE-POCHE TERANGA REF M86 remet de l''ordre avec une touche de caractère : lignes modernes, matière premium, personnalisation MUSE. Chaque pièce est imprimée sur demande, prête à devenir le premier objet que vos invités remarquent — et le dernier que vous touchez en sortant le matin.',
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
      'available', 'published', false, 86,
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
    VALUES (v_product_id, '/products/89f83c9e-97fb-4f65-b8b4-367c4621449d.png', 'VIDE-POCHE TERANGA REF M86 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M87
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M87',
      '8d2a271c-66b9-4b1e-b95f-f4c20dd0e216',
      'Clés, montre, pièces, lunettes — VIDE-POCHE TERANGA REF M87 range tout ça avec élégance. Zéro chaos, cent pour cent Teranga.',
      'VIDE-POCHE TERANGA REF M87 ne se contente pas de ranger : il raconte une invitation à ralentir. Posez vos clés, gardez votre montre à portée de main, offrez à votre entrée la dignité qu''elle mérite. Finition mat ou effet pierre, palette MUSE (ivoire, sage, terracotta…), texte ou initiales sur demande. Un cadeau d''accueil qui a du sens.',
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
      'available', 'published', false, 87,
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
    VALUES (v_product_id, '/products/8d2a271c-66b9-4b1e-b95f-f4c20dd0e216.png', 'VIDE-POCHE TERANGA REF M87 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M88
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M88',
      '8dc03836-df36-4a32-87ec-b91ef7955865',
      'Le vide-poche qui ne fait pas « vide-poche de supermarché ». VIDE-POCHE TERANGA REF M88 : beau, utile, personnalisable.',
      'Entre le porte-manteau et le canapé, il manquait souvent l''objet juste. VIDE-POCHE TERANGA REF M88 comble ce vide avec humour et sophistication : assez grand pour être utile, assez beau pour rester visible. Impression 3D artisanale, personnalisation facile — parce que même les petits objets méritent le sur-mesure.',
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
      'available', 'published', false, 88,
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
    VALUES (v_product_id, '/products/8dc03836-df36-4a32-87ec-b91ef7955865.png', 'VIDE-POCHE TERANGA REF M88 MUSE', true, 0);
  END IF;
END $$;
