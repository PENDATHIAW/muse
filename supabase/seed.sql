-- MUSE Seed Data
-- Run after initial migration

-- Default settings
INSERT INTO public.settings (key, value) VALUES
  ('hero_title', 'Des objets utiles, beaux et personnalisables'),
  ('hero_subtitle', 'MUSE conçoit des objets premium en impression 3D, pensés pour votre quotidien, votre maison et vos événements.'),
  ('hero_tagline', 'Impression 3D · Personnalisation · Artisanat moderne'),
  ('brand_tagline', 'Shaping your ideas'),
  ('why_muse', 'Chaque objet MUSE est conçu avec soin, imprimé avec des filaments de qualité et personnalisable selon vos envies.'),
  ('personalization_intro', 'Prénom, nom de famille, logo, date, couleur, finition, taille ou motif — nous adaptons chaque pièce à votre histoire.'),
  ('order_intro', 'Pas de paiement en ligne pour le moment. Contactez-nous par formulaire ou WhatsApp pour commander.'),
  ('about_content', 'MUSE est une marque d''objets utiles, décoratifs et personnalisables, pensés pour le quotidien, la maison, le bureau, les événements et les cadeaux. Les produits sont conçus pour être beaux, pratiques et facilement reproductibles en impression 3D.'),
  ('whatsapp_number', '221771234567'),
  ('whatsapp_default_message', 'Bonjour MUSE, je souhaite en savoir plus sur vos objets personnalisables.'),
  ('contact_email', 'contact@muse.sn'),
  ('instagram_url', 'https://instagram.com/muse'),
  ('tiktok_url', 'https://tiktok.com/@muse'),
  ('whatsapp_url', 'https://wa.me/221771234567')
ON CONFLICT (key) DO NOTHING;

-- Universes
INSERT INTO public.universes (name, slug, description, display_order, is_active) VALUES
  ('Plaques de porte « Chez nous »', 'plaques-de-porte-chez-nous', 'Plaques de porte personnalisées avec nom de famille et finitions premium.', 1, true),
  ('Boîte à clés murale', 'boite-a-cles-murale', 'Organisez votre entrée avec élégance.', 2, true),
  ('Vide-poche d''entrée « Teranga »', 'vide-poche-teranga', 'Accueillez vos clés, montres et petits objets du quotidien.', 3, true),
  ('Support téléphone + vide-poche', 'support-telephone-vide-poche', 'Alliez praticité et design pour votre bureau ou entrée.', 4, true),
  ('Porte-moussor / porte-foulards mural', 'porte-moussor-foulards', 'Organisation murale élégante pour vos accessoires.', 5, true),
  ('Support bijoux de coiffeuse', 'support-bijoux-coiffeuse', 'Rangez vos bijoux avec style sur votre coiffeuse.', 6, true),
  ('Boîte à bijoux personnalisée', 'boite-a-bijoux', 'Coffrets personnalisés pour vos trésors.', 7, true),
  ('Support tasbih / chapelet', 'support-tasbih-chapelet', 'Supports décoratifs pour vos moments de recueillement.', 99, false),
  ('Salaah', 'salaah', 'Supports tasbih, nattes de prière, ranges et coins prière.', 8, true),
  ('Plaques naissance / baptême à poser', 'plaques-naissance-bapteme', 'Souvenirs personnalisés pour célébrer la vie.', 9, true),
  ('Supports QR boutique / Wave / Orange Money', 'supports-qr-paiement', 'Présentez vos moyens de paiement avec élégance.', 10, true),
  ('Étiquettes prix premium pour boutiques', 'etiquettes-prix-boutiques', 'Étiquettes raffinées pour vos espaces commerciaux.', 11, true),
  ('Porte-cartes / porte-flyers', 'porte-cartes-flyers', 'Présentez vos cartes et flyers professionnellement.', 12, true),
  ('Supports parfum / thiouraye décoratif', 'supports-parfum-thiouraye', 'Supports décoratifs sans brûleur pour parfums et thiouraye.', 13, true),
  ('Cache-pot décoratif', 'cache-pot-decoratif', 'Habillez vos plantes avec des cache-pots personnalisés.', 14, true),
  ('Mini déco murale Sénégal', 'mini-deco-murale-senegal', 'Décoration murale inspirée de l''art et de la culture sénégalaise.', 15, true),
  ('MUSE Tech / Charge Guard', 'muse-tech-charge-guard', 'Accessoires tech élégants pour organiser vos chargeurs.', 16, true),
  ('MUSE Kitchen / Organisateurs cuisine', 'muse-kitchen', 'Organiseurs muraux et accessoires pour une cuisine ordonnée.', 17, true)
ON CONFLICT (slug) DO NOTHING;

-- Sample products
DO $$
DECLARE
  v_kitchen_id UUID;
  v_tech_id UUID;
  v_plaque_id UUID;
  v_prod1 UUID;
  v_prod2 UUID;
  v_prod3 UUID;
  v_prod4 UUID;
BEGIN
  SELECT id INTO v_kitchen_id FROM public.universes WHERE slug = 'muse-kitchen';
  SELECT id INTO v_tech_id FROM public.universes WHERE slug = 'muse-tech-charge-guard';
  SELECT id INTO v_plaque_id FROM public.universes WHERE slug = 'plaques-de-porte-chez-nous';

  INSERT INTO public.products (
    universe_id, name, slug, short_description, long_description, price, dimensions,
    print_time, material, colors, finishes, personalization_options, stock_status,
    status, is_featured, display_order, tags
  ) VALUES (
    v_kitchen_id,
    'Organisateur mural cuisine avec drainage',
    'organisateur-mural-cuisine-drainage',
    'Support mural modulable pour ustensiles de cuisine.',
    'Support mural modulable pour ustensiles de cuisine, avec pots perforés, crochets et plateau de récupération d''eau. Idéal pour libérer votre plan de travail tout en gardant vos outils à portée de main.',
    18000, '30 × 20 × 8 cm',
    '6-8 heures', 'PETG ou ASA recommandé',
    '["ivoire", "sage", "terracotta", "moka", "noir mat"]'::jsonb,
    '["mat", "effet bois"]'::jsonb,
    '["logo MUSE", "couleur", "nombre de pots", "nombre de crochets"]'::jsonb,
    'available', 'published', true, 1, '["bestseller", "personnalisable"]'::jsonb
  ) ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_prod1;

  INSERT INTO public.products (
    universe_id, name, slug, short_description, long_description, price, dimensions,
    print_time, material, colors, personalization_options, stock_status,
    status, is_featured, display_order, tags
  ) VALUES (
    v_kitchen_id,
    'Pot à couverts drainant',
    'pot-a-couverts-drainant',
    'Pot mural pour cuillères, spatules et fouets.',
    'Pot mural pour cuillères, spatules et fouets, avec trous de drainage et bac récupérateur amovible. Design épuré et fonctionnel pour une cuisine organisée.',
    8000, '15 × 12 × 18 cm',
    '3-4 heures', 'PETG recommandé',
    '["ivoire", "sage", "terracotta", "moka"]'::jsonb,
    '["couleur", "nom", "logo"]'::jsonb,
    'available', 'published', true, 2, '["nouveauté", "personnalisable"]'::jsonb
  ) ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_prod2;

  INSERT INTO public.products (
    universe_id, name, slug, short_description, long_description, price, dimensions,
    print_time, material, colors, personalization_options, stock_status,
    status, is_featured, display_order, tags
  ) VALUES (
    v_tech_id,
    'Charge Guard 2-en-1',
    'charge-guard-2-en-1',
    'Organisateur de chargeur 2-en-1 pour bloc et câble.',
    'Organisateur de chargeur 2-en-1 pour ranger le bloc chargeur, enrouler le câble et clipser l''embout téléphone. Utilisable en déplacement et pendant la charge.',
    5000, '8 × 5 × 3 cm',
    '2-3 heures', 'PLA+, PETG ou TPU selon partie',
    '["ivoire", "sage", "blush", "terracotta", "noir mat"]'::jsonb,
    '["initiales", "couleur", "logo discret"]'::jsonb,
    'available', 'published', true, 1, '["bestseller", "personnalisable"]'::jsonb
  ) ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_prod3;

  INSERT INTO public.products (
    universe_id, name, slug, short_description, long_description, price, dimensions,
    print_time, material, colors, finishes, personalization_options, stock_status,
    status, is_featured, display_order, tags
  ) VALUES (
    v_plaque_id,
    'Plaque « Chez les Diagne »',
    'plaque-chez-les-diagne',
    'Plaque de porte personnalisée avec nom de famille.',
    'Plaque de porte personnalisée avec nom de famille, finition premium et logo MUSE discret. Parfaite pour accueillir vos visiteurs avec chaleur et élégance.',
    12000, '20 × 8 × 0.5 cm',
    '4-5 heures', 'PLA mat, effet bois ou effet pierre',
    '["ivoire", "moka", "terracotta", "noir mat"]'::jsonb,
    '["effet bois", "effet pierre", "mat"]'::jsonb,
    '["nom de famille", "prénom", "couleur", "finition"]'::jsonb,
    'available', 'published', true, 1, '["personnalisable"]'::jsonb
  ) ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_prod4;
END $$;
