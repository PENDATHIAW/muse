-- Import automatique photos MUSE (partie)
-- Exécutez dans Supabase → SQL Editor, une partie à la fois
-- Partie 4/7 (40 produits)

DO $$
DECLARE
  v_universe_id UUID;
  v_product_id UUID;
BEGIN
  -- DÉCO MURALE REF M05
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'mini-deco-murale-senegal';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'DÉCO MURALE REF M05',
      '8de3a8ee-a533-49c3-b8fb-f74e29289d90',
      'Une touche de Sénégal sur votre mur — DÉCO MURALE REF M05 raconte une histoire sans un mot.',
      'DÉCO MURALE REF M05 est un hommage aux couleurs et symboles du Sénégal, réinterprété en impression 3D contemporaine. Chaque pièce MUSE est une invitation à célébrer son heritage avec modernité — salon, entrée, chambre ou bureau. Symbole, couleur et taille personnalisables.',
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
      'available', 'published', false, 5,
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
    VALUES (v_product_id, '/products/8de3a8ee-a533-49c3-b8fb-f74e29289d90.png', 'DÉCO MURALE REF M05 MUSE', true, 0);
  END IF;

  -- ORGANISATEUR CUISINE REF M06
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'muse-kitchen';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'ORGANISATEUR CUISINE REF M06',
      '8e184616-6c41-40ac-b01c-62e6b7a71b4a',
      'Fini la pagaille autour de l''évier : ORGANISATEUR CUISINE REF M06 organise spatules, cuillères et éponges avec style.',
      'Spatule qui traîne, cuillère qui roule, éponge qui ne sait plus où vivre… ORGANISATEUR CUISINE REF M06 remet de la clarté dans le chaos culinaire. Design épuré, impression 3D précise, matériaux choisis pour durer près de l''évier. Un organisateur mural qui ne ressemble pas à du plastique bas de gamme.',
      'Fixez au mur ou posez sur le plan de travail. Rangez spatules, cuillères, éponges ou condiments selon le modèle.',
      'Inspirée des cuisines organisées — libérer le plan de travail tout en gardant ustensiles à portée de main.',
      'Cuisine, crédence murale, plan de travail près de l''évier ou coin préparation.',
      12000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '5-8 heures',
      'PETG ou ASA recommandé',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["couleur","logo MUSE","configuration"]'::jsonb,
      'available', 'published', false, 6,
      '["nouveauté","personnalisable","muse kitchen"]'::jsonb
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
    VALUES (v_product_id, '/products/8e184616-6c41-40ac-b01c-62e6b7a71b4a.png', 'ORGANISATEUR CUISINE REF M06 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M89
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M89',
      '8e606702-c3b2-4b1f-bf04-38bc9bdfd24d',
      'Votre entrée mérite mieux qu''une pile de clés en vrac. VIDE-POCHE TERANGA REF M89 accueille votre quotidien avec la chaleur de la Teranga.',
      'VIDE-POCHE TERANGA REF M89 est pensé pour ce moment où l''on franchit la porte les mains pleines et l''esprit ailleurs. Imprimé en 3D par MUSE, il accueille clés, montre et petits trésors du quotidien avec une finition soignée. Inspiré de la Teranga sénégalaise — accueillir avec générosité —, il habille votre entrée sans l''encombrer. Couleur, initiales, message discret : on l''adapte à votre maison, pas l''inverse.',
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
      'available', 'published', false, 89,
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
    VALUES (v_product_id, '/products/8e606702-c3b2-4b1f-bf04-38bc9bdfd24d.png', 'VIDE-POCHE TERANGA REF M89 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M90
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M90',
      '8e9df991-5404-4c6a-ade9-cb19e259bb94',
      'Rentrer chez soi, poser ses clés, respirer : VIDE-POCHE TERANGA REF M90 transforme ce geste banal en petit rituel d''accueil.',
      'On connaît tous cette table d''entrée qui devient dépotoir. VIDE-POCHE TERANGA REF M90 remet de l''ordre avec une touche de caractère : lignes modernes, matière premium, personnalisation MUSE. Chaque pièce est imprimée sur demande, prête à devenir le premier objet que vos invités remarquent — et le dernier que vous touchez en sortant le matin.',
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
      'available', 'published', false, 90,
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
    VALUES (v_product_id, '/products/8e9df991-5404-4c6a-ade9-cb19e259bb94.png', 'VIDE-POCHE TERANGA REF M90 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M91
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M91',
      '8f2dd6ab-ce35-499a-8593-2fc9cb4cda5c',
      'Clés, montre, pièces, lunettes — VIDE-POCHE TERANGA REF M91 range tout ça avec élégance. Zéro chaos, cent pour cent Teranga.',
      'VIDE-POCHE TERANGA REF M91 ne se contente pas de ranger : il raconte une invitation à ralentir. Posez vos clés, gardez votre montre à portée de main, offrez à votre entrée la dignité qu''elle mérite. Finition mat ou effet pierre, palette MUSE (ivoire, sage, terracotta…), texte ou initiales sur demande. Un cadeau d''accueil qui a du sens.',
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
      'available', 'published', false, 91,
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
    VALUES (v_product_id, '/products/8f2dd6ab-ce35-499a-8593-2fc9cb4cda5c.png', 'VIDE-POCHE TERANGA REF M91 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M92
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M92',
      '8fb8ee7d-87ea-460f-9f38-56c9da4e58ee',
      'Le vide-poche qui ne fait pas « vide-poche de supermarché ». VIDE-POCHE TERANGA REF M92 : beau, utile, personnalisable.',
      'Entre le porte-manteau et le canapé, il manquait souvent l''objet juste. VIDE-POCHE TERANGA REF M92 comble ce vide avec humour et sophistication : assez grand pour être utile, assez beau pour rester visible. Impression 3D artisanale, personnalisation facile — parce que même les petits objets méritent le sur-mesure.',
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
      'available', 'published', false, 92,
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
    VALUES (v_product_id, '/products/8fb8ee7d-87ea-460f-9f38-56c9da4e58ee.png', 'VIDE-POCHE TERANGA REF M92 MUSE', true, 0);
  END IF;

  -- COIN PRIÈRE REF M18
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'salaah';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'COIN PRIÈRE REF M18',
      '8fc36753-9cc5-4a4f-8dda-dc4851d93479',
      'COIN PRIÈRE REF M18 : l''objet Salaah qui structure votre rituel avec élégance et pudeur.',
      'Un espace de prière harmonieux change la qualité du recueillement. COIN PRIÈRE REF M18 structure votre coin Salaah sans ostentation — lignes épurées, matériaux soignés, usage quotidien. Bureau de prière, chambre ou salon discret.',
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
      'available', 'published', false, 18,
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
    VALUES (v_product_id, '/products/8fc36753-9cc5-4a4f-8dda-dc4851d93479.png', 'COIN PRIÈRE REF M18 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M93
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M93',
      '900bbe02-30cd-463b-ab6e-2d65075b5110',
      'Votre entrée mérite mieux qu''une pile de clés en vrac. VIDE-POCHE TERANGA REF M93 accueille votre quotidien avec la chaleur de la Teranga.',
      'VIDE-POCHE TERANGA REF M93 est pensé pour ce moment où l''on franchit la porte les mains pleines et l''esprit ailleurs. Imprimé en 3D par MUSE, il accueille clés, montre et petits trésors du quotidien avec une finition soignée. Inspiré de la Teranga sénégalaise — accueillir avec générosité —, il habille votre entrée sans l''encombrer. Couleur, initiales, message discret : on l''adapte à votre maison, pas l''inverse.',
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
      'available', 'published', false, 93,
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
    VALUES (v_product_id, '/products/900bbe02-30cd-463b-ab6e-2d65075b5110.png', 'VIDE-POCHE TERANGA REF M93 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M94
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M94',
      '91c140fc-9200-44bb-9b14-63e1b0f221e4',
      'Rentrer chez soi, poser ses clés, respirer : VIDE-POCHE TERANGA REF M94 transforme ce geste banal en petit rituel d''accueil.',
      'On connaît tous cette table d''entrée qui devient dépotoir. VIDE-POCHE TERANGA REF M94 remet de l''ordre avec une touche de caractère : lignes modernes, matière premium, personnalisation MUSE. Chaque pièce est imprimée sur demande, prête à devenir le premier objet que vos invités remarquent — et le dernier que vous touchez en sortant le matin.',
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
      'available', 'published', false, 94,
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
    VALUES (v_product_id, '/products/91c140fc-9200-44bb-9b14-63e1b0f221e4.png', 'VIDE-POCHE TERANGA REF M94 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M95
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M95',
      '91eadfe6-5112-498d-a845-dbd1a042e2c6',
      'Clés, montre, pièces, lunettes — VIDE-POCHE TERANGA REF M95 range tout ça avec élégance. Zéro chaos, cent pour cent Teranga.',
      'VIDE-POCHE TERANGA REF M95 ne se contente pas de ranger : il raconte une invitation à ralentir. Posez vos clés, gardez votre montre à portée de main, offrez à votre entrée la dignité qu''elle mérite. Finition mat ou effet pierre, palette MUSE (ivoire, sage, terracotta…), texte ou initiales sur demande. Un cadeau d''accueil qui a du sens.',
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
      'available', 'published', false, 95,
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
    VALUES (v_product_id, '/products/91eadfe6-5112-498d-a845-dbd1a042e2c6.png', 'VIDE-POCHE TERANGA REF M95 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M96
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M96',
      '92169e75-5489-48c8-a122-afc85d748406',
      'Le vide-poche qui ne fait pas « vide-poche de supermarché ». VIDE-POCHE TERANGA REF M96 : beau, utile, personnalisable.',
      'Entre le porte-manteau et le canapé, il manquait souvent l''objet juste. VIDE-POCHE TERANGA REF M96 comble ce vide avec humour et sophistication : assez grand pour être utile, assez beau pour rester visible. Impression 3D artisanale, personnalisation facile — parce que même les petits objets méritent le sur-mesure.',
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
      'available', 'published', false, 96,
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
    VALUES (v_product_id, '/products/92169e75-5489-48c8-a122-afc85d748406.png', 'VIDE-POCHE TERANGA REF M96 MUSE', true, 0);
  END IF;

  -- PORTE MOUSSOR REF M01
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'porte-moussor-foulards';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'PORTE MOUSSOR REF M01',
      '935c622f-5ccd-4154-bb16-c13d3297da03',
      'Votre moussor mérite d''être vu, pas entassé. PORTE MOUSSOR REF M01 le met en valeur — muralement.',
      'PORTE MOUSSOR REF M01 est pensé pour mettre en scène moussors, foulards et accessoires textiles sans les froisser ni les cacher. Imprimé en 3D par MUSE avec une finition mat élégante, il s''intègre chambre, dressing ou entrée. Couleur et motif personnalisables.',
      'Accrochez moussor, foulard ou petit sac. Garde les tissus visibles, ordonnés et à portée de main.',
      'Inspiré des porte-foulards muraux discrets pour mettre en valeur moussors, écharpes et accessoires textiles.',
      'Chambre, dressing, entrée ou mur près du miroir.',
      10000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '4-6 heures',
      'PLA mat',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["couleur","motif"]'::jsonb,
      'available', 'published', true, 1,
      '["nouveauté","personnalisable","porte moussor foulards"]'::jsonb
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
    VALUES (v_product_id, '/products/935c622f-5ccd-4154-bb16-c13d3297da03.png', 'PORTE MOUSSOR REF M01 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M97
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M97',
      '95e4bc36-204f-4be5-81b9-d00f62356092',
      'Votre entrée mérite mieux qu''une pile de clés en vrac. VIDE-POCHE TERANGA REF M97 accueille votre quotidien avec la chaleur de la Teranga.',
      'VIDE-POCHE TERANGA REF M97 est pensé pour ce moment où l''on franchit la porte les mains pleines et l''esprit ailleurs. Imprimé en 3D par MUSE, il accueille clés, montre et petits trésors du quotidien avec une finition soignée. Inspiré de la Teranga sénégalaise — accueillir avec générosité —, il habille votre entrée sans l''encombrer. Couleur, initiales, message discret : on l''adapte à votre maison, pas l''inverse.',
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
      'available', 'published', false, 97,
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
    VALUES (v_product_id, '/products/95e4bc36-204f-4be5-81b9-d00f62356092.png', 'VIDE-POCHE TERANGA REF M97 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M98
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M98',
      '9605307e-6dcd-4ff8-a852-9e55ca04d5ce',
      'Rentrer chez soi, poser ses clés, respirer : VIDE-POCHE TERANGA REF M98 transforme ce geste banal en petit rituel d''accueil.',
      'On connaît tous cette table d''entrée qui devient dépotoir. VIDE-POCHE TERANGA REF M98 remet de l''ordre avec une touche de caractère : lignes modernes, matière premium, personnalisation MUSE. Chaque pièce est imprimée sur demande, prête à devenir le premier objet que vos invités remarquent — et le dernier que vous touchez en sortant le matin.',
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
      'available', 'published', false, 98,
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
    VALUES (v_product_id, '/products/9605307e-6dcd-4ff8-a852-9e55ca04d5ce.png', 'VIDE-POCHE TERANGA REF M98 MUSE', true, 0);
  END IF;

  -- COIN PRIÈRE REF M19
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'salaah';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'COIN PRIÈRE REF M19',
      '98bb90d8-7c18-41a3-994d-8f82b58b5adb',
      'Tasbih, natte ou accessoires — COIN PRIÈRE REF M19 leur offre enfin une place digne.',
      'COIN PRIÈRE REF M19 transforme un geste simple en rituel soigné. Posez, respirez, reprenez : chaque détail est pensé pour durer et embellir votre pratique. Signé MUSE, imprimé sur commande.',
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
      'available', 'published', false, 19,
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
    VALUES (v_product_id, '/products/98bb90d8-7c18-41a3-994d-8f82b58b5adb.png', 'COIN PRIÈRE REF M19 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M99
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M99',
      '9d3bcce0-2ddc-4eb1-a1a8-644331d6277d',
      'Clés, montre, pièces, lunettes — VIDE-POCHE TERANGA REF M99 range tout ça avec élégance. Zéro chaos, cent pour cent Teranga.',
      'VIDE-POCHE TERANGA REF M99 ne se contente pas de ranger : il raconte une invitation à ralentir. Posez vos clés, gardez votre montre à portée de main, offrez à votre entrée la dignité qu''elle mérite. Finition mat ou effet pierre, palette MUSE (ivoire, sage, terracotta…), texte ou initiales sur demande. Un cadeau d''accueil qui a du sens.',
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
      'available', 'published', false, 99,
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
    VALUES (v_product_id, '/products/9D3BCCE0-2DDC-4EB1-A1A8-644331D6277D.png', 'VIDE-POCHE TERANGA REF M99 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M100
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M100',
      '9b333ee9-7dfc-4b8e-9852-0e513852d9cc',
      'Le vide-poche qui ne fait pas « vide-poche de supermarché ». VIDE-POCHE TERANGA REF M100 : beau, utile, personnalisable.',
      'Entre le porte-manteau et le canapé, il manquait souvent l''objet juste. VIDE-POCHE TERANGA REF M100 comble ce vide avec humour et sophistication : assez grand pour être utile, assez beau pour rester visible. Impression 3D artisanale, personnalisation facile — parce que même les petits objets méritent le sur-mesure.',
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
      'available', 'published', false, 100,
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
    VALUES (v_product_id, '/products/9b333ee9-7dfc-4b8e-9852-0e513852d9cc.png', 'VIDE-POCHE TERANGA REF M100 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M101
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M101',
      '9b3dc47c-c92d-4f84-b712-c4d4f0cf7637',
      'Votre entrée mérite mieux qu''une pile de clés en vrac. VIDE-POCHE TERANGA REF M101 accueille votre quotidien avec la chaleur de la Teranga.',
      'VIDE-POCHE TERANGA REF M101 est pensé pour ce moment où l''on franchit la porte les mains pleines et l''esprit ailleurs. Imprimé en 3D par MUSE, il accueille clés, montre et petits trésors du quotidien avec une finition soignée. Inspiré de la Teranga sénégalaise — accueillir avec générosité —, il habille votre entrée sans l''encombrer. Couleur, initiales, message discret : on l''adapte à votre maison, pas l''inverse.',
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
      'available', 'published', false, 101,
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
    VALUES (v_product_id, '/products/9b3dc47c-c92d-4f84-b712-c4d4f0cf7637.png', 'VIDE-POCHE TERANGA REF M101 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M102
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M102',
      '9b836607-44a1-46a3-baf4-c4bd214485bf',
      'Rentrer chez soi, poser ses clés, respirer : VIDE-POCHE TERANGA REF M102 transforme ce geste banal en petit rituel d''accueil.',
      'On connaît tous cette table d''entrée qui devient dépotoir. VIDE-POCHE TERANGA REF M102 remet de l''ordre avec une touche de caractère : lignes modernes, matière premium, personnalisation MUSE. Chaque pièce est imprimée sur demande, prête à devenir le premier objet que vos invités remarquent — et le dernier que vous touchez en sortant le matin.',
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
      'available', 'published', false, 102,
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
    VALUES (v_product_id, '/products/9b836607-44a1-46a3-baf4-c4bd214485bf.png', 'VIDE-POCHE TERANGA REF M102 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M103
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M103',
      '9de9b67f-e0f4-457b-91dc-303ad11cfc3e',
      'Clés, montre, pièces, lunettes — VIDE-POCHE TERANGA REF M103 range tout ça avec élégance. Zéro chaos, cent pour cent Teranga.',
      'VIDE-POCHE TERANGA REF M103 ne se contente pas de ranger : il raconte une invitation à ralentir. Posez vos clés, gardez votre montre à portée de main, offrez à votre entrée la dignité qu''elle mérite. Finition mat ou effet pierre, palette MUSE (ivoire, sage, terracotta…), texte ou initiales sur demande. Un cadeau d''accueil qui a du sens.',
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
      'available', 'published', false, 103,
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
    VALUES (v_product_id, '/products/9de9b67f-e0f4-457b-91dc-303ad11cfc3e.png', 'VIDE-POCHE TERANGA REF M103 MUSE', true, 0);
  END IF;

  -- COIN PRIÈRE REF M20
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'salaah';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'COIN PRIÈRE REF M20',
      '9f7145eb-8c11-419b-8403-ae42d7517231',
      'Entre deux prières, COIN PRIÈRE REF M20 vous attend — beau, stable, personnalisable.',
      'Sobriété ne veut pas dire tristesse. COIN PRIÈRE REF M20 apporte chaleur et ordre à votre Salaah — support tasbih, range natte ou coin prière selon le modèle. Finition premium, personnalisation facile.',
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
      'available', 'published', false, 20,
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
    VALUES (v_product_id, '/products/9f7145eb-8c11-419b-8403-ae42d7517231.png', 'COIN PRIÈRE REF M20 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M104
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M104',
      'b730bca1-b6e7-41a2-a6e7-aab9330a4c07',
      'Le vide-poche qui ne fait pas « vide-poche de supermarché ». VIDE-POCHE TERANGA REF M104 : beau, utile, personnalisable.',
      'Entre le porte-manteau et le canapé, il manquait souvent l''objet juste. VIDE-POCHE TERANGA REF M104 comble ce vide avec humour et sophistication : assez grand pour être utile, assez beau pour rester visible. Impression 3D artisanale, personnalisation facile — parce que même les petits objets méritent le sur-mesure.',
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
      'available', 'published', false, 104,
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
    VALUES (v_product_id, '/products/B730BCA1-B6E7-41A2-A6E7-AAB9330A4C07.png', 'VIDE-POCHE TERANGA REF M104 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M105
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M105',
      'b77f36a7-4660-479d-9264-017220daa82b',
      'Votre entrée mérite mieux qu''une pile de clés en vrac. VIDE-POCHE TERANGA REF M105 accueille votre quotidien avec la chaleur de la Teranga.',
      'VIDE-POCHE TERANGA REF M105 est pensé pour ce moment où l''on franchit la porte les mains pleines et l''esprit ailleurs. Imprimé en 3D par MUSE, il accueille clés, montre et petits trésors du quotidien avec une finition soignée. Inspiré de la Teranga sénégalaise — accueillir avec générosité —, il habille votre entrée sans l''encombrer. Couleur, initiales, message discret : on l''adapte à votre maison, pas l''inverse.',
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
      'available', 'published', false, 105,
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
    VALUES (v_product_id, '/products/B77F36A7-4660-479D-9264-017220DAA82B.png', 'VIDE-POCHE TERANGA REF M105 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M106
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M106',
      'cncr-logo-square',
      'Rentrer chez soi, poser ses clés, respirer : VIDE-POCHE TERANGA REF M106 transforme ce geste banal en petit rituel d''accueil.',
      'On connaît tous cette table d''entrée qui devient dépotoir. VIDE-POCHE TERANGA REF M106 remet de l''ordre avec une touche de caractère : lignes modernes, matière premium, personnalisation MUSE. Chaque pièce est imprimée sur demande, prête à devenir le premier objet que vos invités remarquent — et le dernier que vous touchez en sortant le matin.',
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
      'available', 'published', false, 106,
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
    VALUES (v_product_id, '/products/CNCR-Logo-square.png', 'VIDE-POCHE TERANGA REF M106 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M107
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M107',
      'chatgpt-image-13-juil-2025-a-18-56-12',
      'Clés, montre, pièces, lunettes — VIDE-POCHE TERANGA REF M107 range tout ça avec élégance. Zéro chaos, cent pour cent Teranga.',
      'VIDE-POCHE TERANGA REF M107 ne se contente pas de ranger : il raconte une invitation à ralentir. Posez vos clés, gardez votre montre à portée de main, offrez à votre entrée la dignité qu''elle mérite. Finition mat ou effet pierre, palette MUSE (ivoire, sage, terracotta…), texte ou initiales sur demande. Un cadeau d''accueil qui a du sens.',
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
      'available', 'published', false, 107,
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
    VALUES (v_product_id, '/products/ChatGPT Image 13 juil. 2025 à 18_56_12.png', 'VIDE-POCHE TERANGA REF M107 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M108
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M108',
      'chatgpt-image-13-juil-2025-a-19-19-06',
      'Le vide-poche qui ne fait pas « vide-poche de supermarché ». VIDE-POCHE TERANGA REF M108 : beau, utile, personnalisable.',
      'Entre le porte-manteau et le canapé, il manquait souvent l''objet juste. VIDE-POCHE TERANGA REF M108 comble ce vide avec humour et sophistication : assez grand pour être utile, assez beau pour rester visible. Impression 3D artisanale, personnalisation facile — parce que même les petits objets méritent le sur-mesure.',
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
      'available', 'published', false, 108,
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
    VALUES (v_product_id, '/products/ChatGPT Image 13 juil. 2025 à 19_19_06.png', 'VIDE-POCHE TERANGA REF M108 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M109
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M109',
      'chatgpt-image-13-juil-2025-a-20-16-15',
      'Votre entrée mérite mieux qu''une pile de clés en vrac. VIDE-POCHE TERANGA REF M109 accueille votre quotidien avec la chaleur de la Teranga.',
      'VIDE-POCHE TERANGA REF M109 est pensé pour ce moment où l''on franchit la porte les mains pleines et l''esprit ailleurs. Imprimé en 3D par MUSE, il accueille clés, montre et petits trésors du quotidien avec une finition soignée. Inspiré de la Teranga sénégalaise — accueillir avec générosité —, il habille votre entrée sans l''encombrer. Couleur, initiales, message discret : on l''adapte à votre maison, pas l''inverse.',
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
      'available', 'published', false, 109,
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
    VALUES (v_product_id, '/products/ChatGPT Image 13 juil. 2025 à 20_16_15.png', 'VIDE-POCHE TERANGA REF M109 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M110
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M110',
      'chatgpt-image-13-juil-2025-a-20-17-57',
      'Rentrer chez soi, poser ses clés, respirer : VIDE-POCHE TERANGA REF M110 transforme ce geste banal en petit rituel d''accueil.',
      'On connaît tous cette table d''entrée qui devient dépotoir. VIDE-POCHE TERANGA REF M110 remet de l''ordre avec une touche de caractère : lignes modernes, matière premium, personnalisation MUSE. Chaque pièce est imprimée sur demande, prête à devenir le premier objet que vos invités remarquent — et le dernier que vous touchez en sortant le matin.',
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
      'available', 'published', false, 110,
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
    VALUES (v_product_id, '/products/ChatGPT Image 13 juil. 2025 à 20_17_57.png', 'VIDE-POCHE TERANGA REF M110 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M111
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M111',
      'chatgpt-image-13-juil-2025-a-20-22-21',
      'Clés, montre, pièces, lunettes — VIDE-POCHE TERANGA REF M111 range tout ça avec élégance. Zéro chaos, cent pour cent Teranga.',
      'VIDE-POCHE TERANGA REF M111 ne se contente pas de ranger : il raconte une invitation à ralentir. Posez vos clés, gardez votre montre à portée de main, offrez à votre entrée la dignité qu''elle mérite. Finition mat ou effet pierre, palette MUSE (ivoire, sage, terracotta…), texte ou initiales sur demande. Un cadeau d''accueil qui a du sens.',
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
      'available', 'published', false, 111,
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
    VALUES (v_product_id, '/products/ChatGPT Image 13 juil. 2025 à 20_22_21.png', 'VIDE-POCHE TERANGA REF M111 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M112
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M112',
      'chatgpt-image-15-juil-2025-a-22-56-56',
      'Le vide-poche qui ne fait pas « vide-poche de supermarché ». VIDE-POCHE TERANGA REF M112 : beau, utile, personnalisable.',
      'Entre le porte-manteau et le canapé, il manquait souvent l''objet juste. VIDE-POCHE TERANGA REF M112 comble ce vide avec humour et sophistication : assez grand pour être utile, assez beau pour rester visible. Impression 3D artisanale, personnalisation facile — parce que même les petits objets méritent le sur-mesure.',
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
      'available', 'published', false, 112,
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
    VALUES (v_product_id, '/products/ChatGPT Image 15 juil. 2025 à 22_56_56.png', 'VIDE-POCHE TERANGA REF M112 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M113
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M113',
      'chatgpt-image-18-juin-2026-a-16-38-48',
      'Votre entrée mérite mieux qu''une pile de clés en vrac. VIDE-POCHE TERANGA REF M113 accueille votre quotidien avec la chaleur de la Teranga.',
      'VIDE-POCHE TERANGA REF M113 est pensé pour ce moment où l''on franchit la porte les mains pleines et l''esprit ailleurs. Imprimé en 3D par MUSE, il accueille clés, montre et petits trésors du quotidien avec une finition soignée. Inspiré de la Teranga sénégalaise — accueillir avec générosité —, il habille votre entrée sans l''encombrer. Couleur, initiales, message discret : on l''adapte à votre maison, pas l''inverse.',
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
      'available', 'published', false, 113,
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
    VALUES (v_product_id, '/products/ChatGPT Image 18 juin 2026 à 16_38_48.png', 'VIDE-POCHE TERANGA REF M113 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M114
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M114',
      'chatgpt-image-19-juin-2026-a-12-24-38',
      'Rentrer chez soi, poser ses clés, respirer : VIDE-POCHE TERANGA REF M114 transforme ce geste banal en petit rituel d''accueil.',
      'On connaît tous cette table d''entrée qui devient dépotoir. VIDE-POCHE TERANGA REF M114 remet de l''ordre avec une touche de caractère : lignes modernes, matière premium, personnalisation MUSE. Chaque pièce est imprimée sur demande, prête à devenir le premier objet que vos invités remarquent — et le dernier que vous touchez en sortant le matin.',
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
      'available', 'published', false, 114,
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
    VALUES (v_product_id, '/products/ChatGPT Image 19 juin 2026 à 12_24_38.png', 'VIDE-POCHE TERANGA REF M114 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M115
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M115',
      'chatgpt-image-19-juin-2026-a-13-05-35',
      'Clés, montre, pièces, lunettes — VIDE-POCHE TERANGA REF M115 range tout ça avec élégance. Zéro chaos, cent pour cent Teranga.',
      'VIDE-POCHE TERANGA REF M115 ne se contente pas de ranger : il raconte une invitation à ralentir. Posez vos clés, gardez votre montre à portée de main, offrez à votre entrée la dignité qu''elle mérite. Finition mat ou effet pierre, palette MUSE (ivoire, sage, terracotta…), texte ou initiales sur demande. Un cadeau d''accueil qui a du sens.',
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
      'available', 'published', false, 115,
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
    VALUES (v_product_id, '/products/ChatGPT Image 19 juin 2026 à 13_05_35.png', 'VIDE-POCHE TERANGA REF M115 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M116
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M116',
      'chatgpt-image-19-juin-2026-a-14-33-03',
      'Le vide-poche qui ne fait pas « vide-poche de supermarché ». VIDE-POCHE TERANGA REF M116 : beau, utile, personnalisable.',
      'Entre le porte-manteau et le canapé, il manquait souvent l''objet juste. VIDE-POCHE TERANGA REF M116 comble ce vide avec humour et sophistication : assez grand pour être utile, assez beau pour rester visible. Impression 3D artisanale, personnalisation facile — parce que même les petits objets méritent le sur-mesure.',
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
      'available', 'published', false, 116,
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
    VALUES (v_product_id, '/products/ChatGPT Image 19 juin 2026 à 14_33_03.png', 'VIDE-POCHE TERANGA REF M116 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M117
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M117',
      'chatgpt-image-19-juin-2026-a-14-44-04',
      'Votre entrée mérite mieux qu''une pile de clés en vrac. VIDE-POCHE TERANGA REF M117 accueille votre quotidien avec la chaleur de la Teranga.',
      'VIDE-POCHE TERANGA REF M117 est pensé pour ce moment où l''on franchit la porte les mains pleines et l''esprit ailleurs. Imprimé en 3D par MUSE, il accueille clés, montre et petits trésors du quotidien avec une finition soignée. Inspiré de la Teranga sénégalaise — accueillir avec générosité —, il habille votre entrée sans l''encombrer. Couleur, initiales, message discret : on l''adapte à votre maison, pas l''inverse.',
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
      'available', 'published', false, 117,
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
    VALUES (v_product_id, '/products/ChatGPT Image 19 juin 2026 à 14_44_04.png', 'VIDE-POCHE TERANGA REF M117 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M118
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M118',
      'chatgpt-image-19-juin-2026-a-19-34-56',
      'Rentrer chez soi, poser ses clés, respirer : VIDE-POCHE TERANGA REF M118 transforme ce geste banal en petit rituel d''accueil.',
      'On connaît tous cette table d''entrée qui devient dépotoir. VIDE-POCHE TERANGA REF M118 remet de l''ordre avec une touche de caractère : lignes modernes, matière premium, personnalisation MUSE. Chaque pièce est imprimée sur demande, prête à devenir le premier objet que vos invités remarquent — et le dernier que vous touchez en sortant le matin.',
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
      'available', 'published', false, 118,
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
    VALUES (v_product_id, '/products/ChatGPT Image 19 juin 2026 à 19_34_56.png', 'VIDE-POCHE TERANGA REF M118 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M119
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M119',
      'chatgpt-image-19-juin-2026-a-20-06-55',
      'Clés, montre, pièces, lunettes — VIDE-POCHE TERANGA REF M119 range tout ça avec élégance. Zéro chaos, cent pour cent Teranga.',
      'VIDE-POCHE TERANGA REF M119 ne se contente pas de ranger : il raconte une invitation à ralentir. Posez vos clés, gardez votre montre à portée de main, offrez à votre entrée la dignité qu''elle mérite. Finition mat ou effet pierre, palette MUSE (ivoire, sage, terracotta…), texte ou initiales sur demande. Un cadeau d''accueil qui a du sens.',
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
      'available', 'published', false, 119,
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
    VALUES (v_product_id, '/products/ChatGPT Image 19 juin 2026 à 20_06_55.png', 'VIDE-POCHE TERANGA REF M119 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M120
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M120',
      'chatgpt-image-21-juin-2026-a-16-45-16',
      'Le vide-poche qui ne fait pas « vide-poche de supermarché ». VIDE-POCHE TERANGA REF M120 : beau, utile, personnalisable.',
      'Entre le porte-manteau et le canapé, il manquait souvent l''objet juste. VIDE-POCHE TERANGA REF M120 comble ce vide avec humour et sophistication : assez grand pour être utile, assez beau pour rester visible. Impression 3D artisanale, personnalisation facile — parce que même les petits objets méritent le sur-mesure.',
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
      'available', 'published', false, 120,
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
    VALUES (v_product_id, '/products/ChatGPT Image 21 juin 2026 à 16_45_16.png', 'VIDE-POCHE TERANGA REF M120 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M121
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M121',
      'chatgpt-image-22-juin-2026-a-23-27-08',
      'Votre entrée mérite mieux qu''une pile de clés en vrac. VIDE-POCHE TERANGA REF M121 accueille votre quotidien avec la chaleur de la Teranga.',
      'VIDE-POCHE TERANGA REF M121 est pensé pour ce moment où l''on franchit la porte les mains pleines et l''esprit ailleurs. Imprimé en 3D par MUSE, il accueille clés, montre et petits trésors du quotidien avec une finition soignée. Inspiré de la Teranga sénégalaise — accueillir avec générosité —, il habille votre entrée sans l''encombrer. Couleur, initiales, message discret : on l''adapte à votre maison, pas l''inverse.',
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
      'available', 'published', false, 121,
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
    VALUES (v_product_id, '/products/ChatGPT Image 22 juin 2026 à 23_27_08.png', 'VIDE-POCHE TERANGA REF M121 MUSE', true, 0);
  END IF;

  -- VIDE-POCHE TERANGA REF M122
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'vide-poche-teranga';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'VIDE-POCHE TERANGA REF M122',
      'chatgpt-image-26-juin-2026-a-16-28-39',
      'Rentrer chez soi, poser ses clés, respirer : VIDE-POCHE TERANGA REF M122 transforme ce geste banal en petit rituel d''accueil.',
      'On connaît tous cette table d''entrée qui devient dépotoir. VIDE-POCHE TERANGA REF M122 remet de l''ordre avec une touche de caractère : lignes modernes, matière premium, personnalisation MUSE. Chaque pièce est imprimée sur demande, prête à devenir le premier objet que vos invités remarquent — et le dernier que vous touchez en sortant le matin.',
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
      'available', 'published', false, 122,
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
    VALUES (v_product_id, '/products/ChatGPT Image 26 juin 2026 à 16_28_39.png', 'VIDE-POCHE TERANGA REF M122 MUSE', true, 0);
  END IF;
END $$;
