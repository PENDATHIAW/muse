-- Import automatique photos MUSE (partie)
-- Exécutez dans Supabase → SQL Editor, une partie à la fois
-- Partie 4/4 (38 produits)

DO $$
DECLARE
  v_universe_id UUID;
  v_product_id UUID;
BEGIN
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
      'a2a80360-15fb-47b2-b332-05f8c6e1940a',
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
    VALUES (v_product_id, '/products/a2a80360-15fb-47b2-b332-05f8c6e1940a.png', 'VIDE-POCHE TERANGA REF M83 MUSE', true, 0);
  END IF;

  -- RANGE NATTE REF M21
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'salaah';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'RANGE NATTE REF M21',
      'a2b9112b-761b-4b67-8fec-b84df880d028',
      'Votre coin prière mérite autant de soin que votre salon. RANGE NATTE REF M21 — sobriété, beauté, recueillement.',
      'RANGE NATTE REF M21 est pensé pour accompagner vos moments de Salaah avec respect et esthétique. Imprimé en 3D par MUSE, il accueille tasbih, natte ou petits accessoires de prière avec une finition sobre et durable. Couleur, motif discret ou initiales : personnalisation MUSE incluse.',
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
      'available', 'published', false, 21,
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
    VALUES (v_product_id, '/products/a2b9112b-761b-4b67-8fec-b84df880d028.png', 'RANGE NATTE REF M21 MUSE', true, 0);
  END IF;

  -- ORGANISATEUR CUISINE REF M07
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'muse-kitchen';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'ORGANISATEUR CUISINE REF M07',
      'a305ce2a-a358-4bd8-b0b3-686784c36006',
      'ORGANISATEUR CUISINE REF M07 : votre crédence mérite un accessoire aussi soigné que vos recettes.',
      'ORGANISATEUR CUISINE REF M07 transforme un mur de cuisine en poste de commandement élégant. Rangez, égouttez, respirez : chaque détail est pensé pour libérer votre plan de travail sans sacrifier l''esthétique. Logo MUSE discret, couleurs harmonieuses, montage simple.',
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
      'available', 'published', false, 7,
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
    VALUES (v_product_id, '/products/a305ce2a-a358-4bd8-b0b3-686784c36006.png', 'ORGANISATEUR CUISINE REF M07 MUSE', true, 0);
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
      'a366d601-9ec9-41a1-8212-6f69c382a39e',
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
    VALUES (v_product_id, '/products/a366d601-9ec9-41a1-8212-6f69c382a39e.png', 'VIDE-POCHE TERANGA REF M84 MUSE', true, 0);
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
      'a3c526c3-ac31-47cc-aa77-fa767aceef73',
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
    VALUES (v_product_id, '/products/a3c526c3-ac31-47cc-aa77-fa767aceef73.png', 'VIDE-POCHE TERANGA REF M85 MUSE', true, 0);
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
      'a4a9b546-0014-4dc7-a98c-c15cdec1e597',
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
    VALUES (v_product_id, '/products/a4a9b546-0014-4dc7-a98c-c15cdec1e597.png', 'VIDE-POCHE TERANGA REF M86 MUSE', true, 0);
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
      'a5512a9e-4845-47e1-993f-843eec3df7af',
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
    VALUES (v_product_id, '/products/a5512a9e-4845-47e1-993f-843eec3df7af.png', 'VIDE-POCHE TERANGA REF M87 MUSE', true, 0);
  END IF;

  -- BOÎTE À CLÉS REF M03
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'boite-a-cles-murale';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'BOÎTE À CLÉS REF M03',
      'a55ac68b-d034-451f-997b-04b1ee2e6ecd',
      'BOÎTE À CLÉS REF M03 : la boîte murale qui transforme le rush du matin en geste fluide.',
      'BOÎTE À CLÉS REF M03 ne se contente pas de ranger — il accueille. Clés, badges, petits objets du quotidien trouvent enfin leur place à hauteur de main. Design épuré, impression 3D durable, esthétique soignée.',
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
      'available', 'published', false, 3,
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
    VALUES (v_product_id, '/products/a55ac68b-d034-451f-997b-04b1ee2e6ecd.png', 'BOÎTE À CLÉS REF M03 MUSE', true, 0);
  END IF;

  -- SUPPORT TASBIH REF M22
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'salaah';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'SUPPORT TASBIH REF M22',
      'aa7c6b02-b712-4c8b-b677-a2ade3da33f6',
      'SUPPORT TASBIH REF M22 : l''objet Salaah qui structure votre rituel avec élégance et pudeur.',
      'Un espace de prière harmonieux change la qualité du recueillement. SUPPORT TASBIH REF M22 structure votre coin Salaah sans ostentation — lignes épurées, matériaux soignés, usage quotidien. Bureau de prière, chambre ou salon discret.',
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
      'available', 'published', false, 22,
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
    VALUES (v_product_id, '/products/aa7c6b02-b712-4c8b-b677-a2ade3da33f6.png', 'SUPPORT TASBIH REF M22 MUSE', true, 0);
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
      'ab1d4e83-2811-436b-a80f-bf74280a5e11',
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
    VALUES (v_product_id, '/products/ab1d4e83-2811-436b-a80f-bf74280a5e11.png', 'VIDE-POCHE TERANGA REF M88 MUSE', true, 0);
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
      'ab9e2db7-a338-4bfd-9e8e-114d8d95aa11',
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
    VALUES (v_product_id, '/products/ab9e2db7-a338-4bfd-9e8e-114d8d95aa11.png', 'VIDE-POCHE TERANGA REF M89 MUSE', true, 0);
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
      'ac15af47-9483-4245-be1a-e7b81639cf3c',
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
    VALUES (v_product_id, '/products/ac15af47-9483-4245-be1a-e7b81639cf3c.png', 'VIDE-POCHE TERANGA REF M90 MUSE', true, 0);
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
      'ae78975c-5146-40a5-be16-957a616ebe85',
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
    VALUES (v_product_id, '/products/ae78975c-5146-40a5-be16-957a616ebe85.png', 'VIDE-POCHE TERANGA REF M91 MUSE', true, 0);
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
      'aeac0923-8444-4a9b-ba94-5089e2662a47',
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
    VALUES (v_product_id, '/products/aeac0923-8444-4a9b-ba94-5089e2662a47.png', 'VIDE-POCHE TERANGA REF M92 MUSE', true, 0);
  END IF;

  -- COIN PRIÈRE REF M23
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'salaah';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'COIN PRIÈRE REF M23',
      'af63541c-e6eb-41c4-9634-d727f0726fce',
      'Tasbih, natte ou accessoires — COIN PRIÈRE REF M23 leur offre enfin une place digne.',
      'COIN PRIÈRE REF M23 transforme un geste simple en rituel soigné. Posez, respirez, reprenez : chaque détail est pensé pour durer et embellir votre pratique. Signé MUSE, imprimé sur commande.',
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
      'available', 'published', false, 23,
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
    VALUES (v_product_id, '/products/af63541c-e6eb-41c4-9634-d727f0726fce.png', 'COIN PRIÈRE REF M23 MUSE', true, 0);
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
      'afbc33c6-bb54-41c1-8ca5-d6003c5cd4ab',
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
    VALUES (v_product_id, '/products/afbc33c6-bb54-41c1-8ca5-d6003c5cd4ab.png', 'VIDE-POCHE TERANGA REF M93 MUSE', true, 0);
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
      'b0d30119-41fe-490a-8738-88ae86c20ca7',
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
    VALUES (v_product_id, '/products/b0d30119-41fe-490a-8738-88ae86c20ca7.png', 'VIDE-POCHE TERANGA REF M94 MUSE', true, 0);
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
      'b1c39a0a-01e0-409c-b560-080e12953a42',
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
    VALUES (v_product_id, '/products/b1c39a0a-01e0-409c-b560-080e12953a42.png', 'VIDE-POCHE TERANGA REF M95 MUSE', true, 0);
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
      'b2dd3074-9c51-4ad7-aac8-5f78977697a3',
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
    VALUES (v_product_id, '/products/b2dd3074-9c51-4ad7-aac8-5f78977697a3.png', 'VIDE-POCHE TERANGA REF M96 MUSE', true, 0);
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
      'b34f15dd-a5e1-4995-9d99-491095db3553',
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
    VALUES (v_product_id, '/products/b34f15dd-a5e1-4995-9d99-491095db3553.png', 'VIDE-POCHE TERANGA REF M97 MUSE', true, 0);
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
      'b38e82f6-233f-4ed6-81f9-8f3c0bb2c679',
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
    VALUES (v_product_id, '/products/b38e82f6-233f-4ed6-81f9-8f3c0bb2c679.png', 'VIDE-POCHE TERANGA REF M98 MUSE', true, 0);
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
      'babf43a8-fd2a-4b46-b6da-d41720c83698',
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
    VALUES (v_product_id, '/products/babf43a8-fd2a-4b46-b6da-d41720c83698.png', 'VIDE-POCHE TERANGA REF M99 MUSE', true, 0);
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
      'bcafd4d0-104b-434e-881c-062a741e8ec7',
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
    VALUES (v_product_id, '/products/bcafd4d0-104b-434e-881c-062a741e8ec7.png', 'VIDE-POCHE TERANGA REF M100 MUSE', true, 0);
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
      'bd82a04f-c4ad-499d-abcb-9aaf5d0cd43c',
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
    VALUES (v_product_id, '/products/bd82a04f-c4ad-499d-abcb-9aaf5d0cd43c.png', 'VIDE-POCHE TERANGA REF M101 MUSE', true, 0);
  END IF;

  -- COIN PRIÈRE REF M24
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'salaah';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'COIN PRIÈRE REF M24',
      'bf0fe373-435d-4101-bda3-b5e28e74770e',
      'Entre deux prières, COIN PRIÈRE REF M24 vous attend — beau, stable, personnalisable.',
      'Sobriété ne veut pas dire tristesse. COIN PRIÈRE REF M24 apporte chaleur et ordre à votre Salaah — support tasbih, range natte ou coin prière selon le modèle. Finition premium, personnalisation facile.',
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
      'available', 'published', false, 24,
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
    VALUES (v_product_id, '/products/bf0fe373-435d-4101-bda3-b5e28e74770e.png', 'COIN PRIÈRE REF M24 MUSE', true, 0);
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
      'bf9ca937-ccf7-4002-8172-25a2f07f21c3',
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
    VALUES (v_product_id, '/products/bf9ca937-ccf7-4002-8172-25a2f07f21c3.png', 'VIDE-POCHE TERANGA REF M102 MUSE', true, 0);
  END IF;

  -- RANGE NATTE REF M25
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'salaah';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'RANGE NATTE REF M25',
      'c366a081-8156-4759-bb7d-1ceba6114f80',
      'Votre coin prière mérite autant de soin que votre salon. RANGE NATTE REF M25 — sobriété, beauté, recueillement.',
      'RANGE NATTE REF M25 est pensé pour accompagner vos moments de Salaah avec respect et esthétique. Imprimé en 3D par MUSE, il accueille tasbih, natte ou petits accessoires de prière avec une finition sobre et durable. Couleur, motif discret ou initiales : personnalisation MUSE incluse.',
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
      'available', 'published', false, 25,
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
    VALUES (v_product_id, '/products/c366a081-8156-4759-bb7d-1ceba6114f80.png', 'RANGE NATTE REF M25 MUSE', true, 0);
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
      'c37d55f1-434d-4af5-bb9f-ca04d9953359',
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
    VALUES (v_product_id, '/products/c37d55f1-434d-4af5-bb9f-ca04d9953359.png', 'VIDE-POCHE TERANGA REF M103 MUSE', true, 0);
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
      'c3f0d579-c06c-41e2-a1b7-1d020ea8c4f9',
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
    VALUES (v_product_id, '/products/c3f0d579-c06c-41e2-a1b7-1d020ea8c4f9.png', 'VIDE-POCHE TERANGA REF M104 MUSE', true, 0);
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
      'c703c001-df0e-41ec-b0c4-b5915972d50f',
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
    VALUES (v_product_id, '/products/c703c001-df0e-41ec-b0c4-b5915972d50f.png', 'VIDE-POCHE TERANGA REF M105 MUSE', true, 0);
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
      'c77bc1fb-9aca-4e66-aa37-476088afbd3e',
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
    VALUES (v_product_id, '/products/c77bc1fb-9aca-4e66-aa37-476088afbd3e.png', 'VIDE-POCHE TERANGA REF M106 MUSE', true, 0);
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
      'c850853b-9f49-47f2-9cf1-913aa40f7238',
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
    VALUES (v_product_id, '/products/c850853b-9f49-47f2-9cf1-913aa40f7238.png', 'VIDE-POCHE TERANGA REF M107 MUSE', true, 0);
  END IF;

  -- ORGANISATEUR CUISINE REF M08
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'muse-kitchen';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'ORGANISATEUR CUISINE REF M08',
      'c98d8d49-f055-49f6-bb2e-d1227b98534a',
      'Cuisine propre, esprit léger. ORGANISATEUR CUISINE REF M08 accroche l''ordre au mur — littéralement.',
      'La cuisine est le cœur de la maison — autant lui offrir des objets à la hauteur. ORGANISATEUR CUISINE REF M08 allie fonction et caractère : drainage intelligent, accroches modulables, finition premium. Imprimé sur commande par MUSE pour s''adapter à votre espace.',
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
      'available', 'published', false, 8,
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
    VALUES (v_product_id, '/products/c98d8d49-f055-49f6-bb2e-d1227b98534a.png', 'ORGANISATEUR CUISINE REF M08 MUSE', true, 0);
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
      'cc059606-76f0-449d-bc8c-1adfb240fdd1',
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
    VALUES (v_product_id, '/products/cc059606-76f0-449d-bc8c-1adfb240fdd1.png', 'VIDE-POCHE TERANGA REF M108 MUSE', true, 0);
  END IF;

  -- RANGE NATTE REF M26
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'salaah';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'RANGE NATTE REF M26',
      'cc4ca1dc-3230-4ba5-9dff-8e12ef359d36',
      'RANGE NATTE REF M26 : l''objet Salaah qui structure votre rituel avec élégance et pudeur.',
      'Un espace de prière harmonieux change la qualité du recueillement. RANGE NATTE REF M26 structure votre coin Salaah sans ostentation — lignes épurées, matériaux soignés, usage quotidien. Bureau de prière, chambre ou salon discret.',
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
      'available', 'published', false, 26,
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
    VALUES (v_product_id, '/products/cc4ca1dc-3230-4ba5-9dff-8e12ef359d36.png', 'RANGE NATTE REF M26 MUSE', true, 0);
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
      'cdf4ec48-990d-44c5-89ed-477374f1ad18',
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
    VALUES (v_product_id, '/products/cdf4ec48-990d-44c5-89ed-477374f1ad18.png', 'VIDE-POCHE TERANGA REF M109 MUSE', true, 0);
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
      'cee234a2-2627-4147-b51b-b24501d312a9',
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
    VALUES (v_product_id, '/products/cee234a2-2627-4147-b51b-b24501d312a9.png', 'VIDE-POCHE TERANGA REF M110 MUSE', true, 0);
  END IF;

  -- SUPPORT QR REF M03
  SELECT id INTO v_universe_id FROM public.universes WHERE slug = 'supports-qr-paiement';
  IF v_universe_id IS NOT NULL THEN
    INSERT INTO public.products (
      universe_id, name, slug, short_description, long_description,
      usage, inspiration, placement,
      price, dimensions, print_time, material, colors, finishes,
      personalization_options, stock_status, status, is_featured, display_order, tags
    ) VALUES (
      v_universe_id,
      'SUPPORT QR REF M03',
      'cfac250a-62fa-4b8d-b9ad-b1381f9e1ba9',
      'Fini le QR plastifié qui glisse : SUPPORT QR REF M03 tient bon sur le comptoir.',
      'SUPPORT QR REF M03 transforme un simple code en signal de sérieux. Stable sur le comptoir, élégant en vitrine, pratique au marché. Chaque support est imprimé sur commande, prêt à accueillir votre QR et votre logo.',
      'Insérez ou affichez votre QR code. Placez le support sur le comptoir pour que le client scanne facilement.',
      'Faciliter les paiements Wave, Orange Money ou QR en boutique — visible, propre et professionnel.',
      'Comptoir caisse, vitrine, table de marché ou réception.',
      7000,
      'Sur mesure — indiquez vos contraintes lors de la commande',
      '2-4 heures',
      'PLA+ ou PETG',
      '["ivoire","sage","terracotta","moka","noir mat"]'::jsonb,
      '["mat"]'::jsonb,
      '["logo boutique","couleur Wave/OM"]'::jsonb,
      'available', 'published', false, 3,
      '["nouveauté","personnalisable","supports qr paiement"]'::jsonb
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
    VALUES (v_product_id, '/products/cfac250a-62fa-4b8d-b9ad-b1381f9e1ba9.png', 'SUPPORT QR REF M03 MUSE', true, 0);
  END IF;
END $$;
