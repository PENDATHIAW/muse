-- Import automatique photos MUSE (partie)
-- Exécutez dans Supabase → SQL Editor, une partie à la fois
-- Partie 3/4 (40 produits)

DO $$
DECLARE
  v_universe_id UUID;
  v_product_id UUID;
BEGIN
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
      '772df2fc-0358-4d6f-abb6-c9d64c003421',
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
    VALUES (v_product_id, '/products/772df2fc-0358-4d6f-abb6-c9d64c003421.png', 'VIDE-POCHE TERANGA REF M68 MUSE', true, 0);
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
      '79679bd7-d285-4eb2-9815-7d4716c494d4',
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
    VALUES (v_product_id, '/products/79679bd7-d285-4eb2-9815-7d4716c494d4.png', 'VIDE-POCHE TERANGA REF M69 MUSE', true, 0);
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
      '797055d8-1423-4406-9e0b-b5b0e895a600',
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
    VALUES (v_product_id, '/products/797055d8-1423-4406-9e0b-b5b0e895a600.png', 'VIDE-POCHE TERANGA REF M70 MUSE', true, 0);
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
      '7b7133f7-1fea-4ff0-a513-250c2b96ec00',
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
    VALUES (v_product_id, '/products/7b7133f7-1fea-4ff0-a513-250c2b96ec00.png', 'VIDE-POCHE TERANGA REF M71 MUSE', true, 0);
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
      '7c7a5280-5662-43e9-b1c9-e37a9c986183',
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
    VALUES (v_product_id, '/products/7c7a5280-5662-43e9-b1c9-e37a9c986183.png', 'VIDE-POCHE TERANGA REF M72 MUSE', true, 0);
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
      '7db3328e-e1de-4918-be3b-0449e053d25c',
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
    VALUES (v_product_id, '/products/7db3328e-e1de-4918-be3b-0449e053d25c.png', 'VIDE-POCHE TERANGA REF M73 MUSE', true, 0);
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
      '7ec427f0-9563-485d-aaa9-0d83640e2352',
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
    VALUES (v_product_id, '/products/7ec427f0-9563-485d-aaa9-0d83640e2352.png', 'VIDE-POCHE TERANGA REF M74 MUSE', true, 0);
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
      '808ac9ed-e725-430b-ac6e-af6b42a3a054',
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
    VALUES (v_product_id, '/products/808ac9ed-e725-430b-ac6e-af6b42a3a054.png', 'VIDE-POCHE TERANGA REF M75 MUSE', true, 0);
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
      '84bda87e-9dac-4f7a-b39b-aa812d52fa3f',
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
    VALUES (v_product_id, '/products/84bda87e-9dac-4f7a-b39b-aa812d52fa3f.png', 'VIDE-POCHE TERANGA REF M76 MUSE', true, 0);
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
      '8591e1a1-052c-4691-a119-87a051468180',
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
    VALUES (v_product_id, '/products/8591e1a1-052c-4691-a119-87a051468180.png', 'VIDE-POCHE TERANGA REF M77 MUSE', true, 0);
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
      '867e9ed3-19fc-4035-aa1e-a20639f744d3',
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
    VALUES (v_product_id, '/products/867e9ed3-19fc-4035-aa1e-a20639f744d3.png', 'VIDE-POCHE TERANGA REF M78 MUSE', true, 0);
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
      '87a930a8-ed5f-4690-960a-2675996ad22a',
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
    VALUES (v_product_id, '/products/87a930a8-ed5f-4690-960a-2675996ad22a.png', 'VIDE-POCHE TERANGA REF M79 MUSE', true, 0);
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
      '897f4b4b-5cb5-4f65-b960-166aab3a8747',
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
    VALUES (v_product_id, '/products/897f4b4b-5cb5-4f65-b960-166aab3a8747.png', 'VIDE-POCHE TERANGA REF M80 MUSE', true, 0);
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
      '89f83c9e-97fb-4f65-b8b4-367c4621449d',
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
    VALUES (v_product_id, '/products/89f83c9e-97fb-4f65-b8b4-367c4621449d.png', 'VIDE-POCHE TERANGA REF M81 MUSE', true, 0);
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
      '8d2a271c-66b9-4b1e-b95f-f4c20dd0e216',
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
    VALUES (v_product_id, '/products/8d2a271c-66b9-4b1e-b95f-f4c20dd0e216.png', 'VIDE-POCHE TERANGA REF M82 MUSE', true, 0);
  END IF;

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
      '8e606702-c3b2-4b1f-bf04-38bc9bdfd24d',
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
    VALUES (v_product_id, '/products/8e606702-c3b2-4b1f-bf04-38bc9bdfd24d.png', 'VIDE-POCHE TERANGA REF M83 MUSE', true, 0);
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
      '8e9df991-5404-4c6a-ade9-cb19e259bb94',
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
    VALUES (v_product_id, '/products/8e9df991-5404-4c6a-ade9-cb19e259bb94.png', 'VIDE-POCHE TERANGA REF M84 MUSE', true, 0);
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
      '8f2dd6ab-ce35-499a-8593-2fc9cb4cda5c',
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
    VALUES (v_product_id, '/products/8f2dd6ab-ce35-499a-8593-2fc9cb4cda5c.png', 'VIDE-POCHE TERANGA REF M85 MUSE', true, 0);
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
      '8fb8ee7d-87ea-460f-9f38-56c9da4e58ee',
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
    VALUES (v_product_id, '/products/8fb8ee7d-87ea-460f-9f38-56c9da4e58ee.png', 'VIDE-POCHE TERANGA REF M86 MUSE', true, 0);
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
      '8fc36753-9cc5-4a4f-8dda-dc4851d93479',
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
    VALUES (v_product_id, '/products/8fc36753-9cc5-4a4f-8dda-dc4851d93479.png', 'VIDE-POCHE TERANGA REF M87 MUSE', true, 0);
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
      '900bbe02-30cd-463b-ab6e-2d65075b5110',
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
    VALUES (v_product_id, '/products/900bbe02-30cd-463b-ab6e-2d65075b5110.png', 'VIDE-POCHE TERANGA REF M88 MUSE', true, 0);
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
      '91c140fc-9200-44bb-9b14-63e1b0f221e4',
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
    VALUES (v_product_id, '/products/91c140fc-9200-44bb-9b14-63e1b0f221e4.png', 'VIDE-POCHE TERANGA REF M89 MUSE', true, 0);
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
      '91eadfe6-5112-498d-a845-dbd1a042e2c6',
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
    VALUES (v_product_id, '/products/91eadfe6-5112-498d-a845-dbd1a042e2c6.png', 'VIDE-POCHE TERANGA REF M90 MUSE', true, 0);
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
      '92169e75-5489-48c8-a122-afc85d748406',
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
    VALUES (v_product_id, '/products/92169e75-5489-48c8-a122-afc85d748406.png', 'VIDE-POCHE TERANGA REF M91 MUSE', true, 0);
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
      '95e4bc36-204f-4be5-81b9-d00f62356092',
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
    VALUES (v_product_id, '/products/95e4bc36-204f-4be5-81b9-d00f62356092.png', 'VIDE-POCHE TERANGA REF M92 MUSE', true, 0);
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
      '9605307e-6dcd-4ff8-a852-9e55ca04d5ce',
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
    VALUES (v_product_id, '/products/9605307e-6dcd-4ff8-a852-9e55ca04d5ce.png', 'VIDE-POCHE TERANGA REF M93 MUSE', true, 0);
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
      '98bb90d8-7c18-41a3-994d-8f82b58b5adb',
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
    VALUES (v_product_id, '/products/98bb90d8-7c18-41a3-994d-8f82b58b5adb.png', 'VIDE-POCHE TERANGA REF M94 MUSE', true, 0);
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
      '9b333ee9-7dfc-4b8e-9852-0e513852d9cc',
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
    VALUES (v_product_id, '/products/9b333ee9-7dfc-4b8e-9852-0e513852d9cc.png', 'VIDE-POCHE TERANGA REF M95 MUSE', true, 0);
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
      '9b836607-44a1-46a3-baf4-c4bd214485bf',
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
    VALUES (v_product_id, '/products/9b836607-44a1-46a3-baf4-c4bd214485bf.png', 'VIDE-POCHE TERANGA REF M96 MUSE', true, 0);
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
      '9de9b67f-e0f4-457b-91dc-303ad11cfc3e',
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
    VALUES (v_product_id, '/products/9de9b67f-e0f4-457b-91dc-303ad11cfc3e.png', 'VIDE-POCHE TERANGA REF M97 MUSE', true, 0);
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
      '9f7145eb-8c11-419b-8403-ae42d7517231',
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
    VALUES (v_product_id, '/products/9f7145eb-8c11-419b-8403-ae42d7517231.png', 'VIDE-POCHE TERANGA REF M98 MUSE', true, 0);
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
      'a0088906-05b5-49b5-9882-dc3e456d3948',
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
    VALUES (v_product_id, '/products/a0088906-05b5-49b5-9882-dc3e456d3948.png', 'VIDE-POCHE TERANGA REF M99 MUSE', true, 0);
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
      'a011018a-c171-440d-8482-14b7a91ef168',
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
    VALUES (v_product_id, '/products/a011018a-c171-440d-8482-14b7a91ef168.png', 'VIDE-POCHE TERANGA REF M100 MUSE', true, 0);
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
      'a184538c-9616-4bee-8c4c-efdb07a12a54',
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
    VALUES (v_product_id, '/products/a184538c-9616-4bee-8c4c-efdb07a12a54.png', 'VIDE-POCHE TERANGA REF M101 MUSE', true, 0);
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
      'a19fa959-fb26-4cf9-946f-c8ba57aa2045',
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
    VALUES (v_product_id, '/products/a19fa959-fb26-4cf9-946f-c8ba57aa2045.png', 'VIDE-POCHE TERANGA REF M102 MUSE', true, 0);
  END IF;
END $$;
