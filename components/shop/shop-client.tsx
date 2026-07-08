"use client";

import { useMemo, useState } from "react";

type MuseProduct = {
  id: string;
  title: string;
  universe: string;
  universeLabel: string;
  image: string;
  fileName: string;
  color: string;
  finish: string;
  material: string;
  size: string;
  price: string;
  description: string;
};

type MuseUniverse = {
  id: string;
  label: string;
  count: number;
  intro: string;
};

type CartItem = MuseProduct & {
  quantity: number;
};

const WHATSAPP_PHONE = process.env.NEXT_PUBLIC_WHATSAPP_PHONE || "221771234567";

function normalize(value: string) {
  return value
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "")
    .toLowerCase();
}

function buildWhatsAppUrl(message: string) {
  return `https://wa.me/${WHATSAPP_PHONE}?text=${encodeURIComponent(message)}`;
}

export default function ShopClient({
  products,
  universes,
}: {
  products: MuseProduct[];
  universes: MuseUniverse[];
}) {
  const [activeUniverse, setActiveUniverse] = useState("all");
  const [query, setQuery] = useState("");
  const [cart, setCart] = useState<CartItem[]>([]);

  const filteredProducts = useMemo(() => {
    const search = normalize(query);
    return products.filter((product) => {
      const matchesUniverse = activeUniverse === "all" || product.universe === activeUniverse;
      const matchesSearch =
        !search ||
        normalize(`${product.title} ${product.universeLabel} ${product.color} ${product.material} ${product.finish}`).includes(search);
      return matchesUniverse && matchesSearch;
    });
  }, [activeUniverse, products, query]);

  const featuredProducts = products.slice(0, 12);
  const activeUniverseLabel = activeUniverse === "all" ? "Tous les univers" : universes.find((u) => u.id === activeUniverse)?.label;

  function addToCart(product: MuseProduct) {
    setCart((current) => {
      const found = current.find((item) => item.id === product.id);
      if (found) {
        return current.map((item) =>
          item.id === product.id ? { ...item, quantity: item.quantity + 1 } : item
        );
      }
      return [...current, { ...product, quantity: 1 }];
    });
  }

  function removeFromCart(productId: string) {
    setCart((current) => current.filter((item) => item.id !== productId));
  }

  const cartMessage = cart.length
    ? `Bonjour MUSE, je souhaite commander :\n\n${cart
        .map((item, index) => `${index + 1}. ${item.title} — ${item.universeLabel} — quantité ${item.quantity} — couleur souhaitée : ${item.color}`)
        .join("\n")}\n\nMerci de me confirmer le prix, la disponibilité et les options de personnalisation.`
    : "Bonjour MUSE, je souhaite commander un objet de décoration personnalisé.";

  return (
    <div className="site-shell">
      <header className="site-header">
        <a className="brand" href="#top" aria-label="MUSE accueil">
          <span className="brand-mark">M</span>
          <span className="brand-name">MUSE</span>
        </a>
        <nav className="header-nav" aria-label="Navigation principale">
          <a href="#universes">Univers</a>
          <a href="#products">Produits</a>
          <a href="#order">Commander</a>
        </nav>
        <a className="header-cta" href={buildWhatsAppUrl("Bonjour MUSE, je souhaite passer une commande.")}>
          WhatsApp
        </a>
      </header>

      <main id="top">
        <section className="hero-section">
          <div className="hero-copy">
            <p className="eyebrow">Décoration · Organisation · Impression 3D</p>
            <h1>Des objets MUSE beaux, utiles et personnalisables.</h1>
            <p className="hero-text">
              Un site pensé pour vendre tes créations déco : chaque photo de <strong>public/products</strong> devient automatiquement un produit visible, classé par univers et prêt à commander.
            </p>
            <div className="hero-actions">
              <a className="primary-button" href="#products">Voir le catalogue</a>
              <a className="secondary-button" href={buildWhatsAppUrl("Bonjour MUSE, je veux une création personnalisée.")}>Créer sur mesure</a>
            </div>
          </div>
          <div className="hero-card">
            <div className="hero-card-inner">
              <span>Catalogue vivant</span>
              <strong>{products.length}</strong>
              <small>photos détectées dans public/products</small>
            </div>
          </div>
        </section>

        <section className="section" id="universes">
          <div className="section-heading">
            <p className="eyebrow">Univers MUSE</p>
            <h2>Chaque espace de la maison a sa collection.</h2>
            <p>Les univers sont générés à partir des noms de dossiers et de fichiers. Tu peux donc ajouter tes images, relancer le site, et le catalogue se met à jour.</p>
          </div>
          <div className="universe-grid">
            <button
              className={`universe-card ${activeUniverse === "all" ? "is-active" : ""}`}
              onClick={() => setActiveUniverse("all")}
            >
              <strong>Tous</strong>
              <span>{products.length} produits</span>
              <small>Tout le catalogue</small>
            </button>
            {universes.map((universe) => (
              <button
                className={`universe-card ${activeUniverse === universe.id ? "is-active" : ""}`}
                key={universe.id}
                onClick={() => setActiveUniverse(universe.id)}
              >
                <strong>{universe.label}</strong>
                <span>{universe.count} produits</span>
                <small>{universe.intro}</small>
              </button>
            ))}
          </div>
        </section>

        {featuredProducts.length > 0 && (
          <section className="section highlight-section">
            <div className="section-heading compact">
              <p className="eyebrow">Sélection</p>
              <h2>Les premiers visuels du catalogue.</h2>
            </div>
            <div className="featured-grid">
              {featuredProducts.map((product) => (
                <article className="featured-card" key={product.id}>
                  <img src={product.image} alt={product.title} loading="lazy" />
                  <div>
                    <span>{product.universeLabel}</span>
                    <strong>{product.title}</strong>
                  </div>
                </article>
              ))}
            </div>
          </section>
        )}

        <section className="section products-section" id="products">
          <div className="catalog-toolbar">
            <div>
              <p className="eyebrow">Catalogue</p>
              <h2>{activeUniverseLabel}</h2>
              <p>{filteredProducts.length} produit(s) affiché(s)</p>
            </div>
            <label className="search-box">
              <span>Rechercher</span>
              <input
                value={query}
                onChange={(event) => setQuery(event.target.value)}
                placeholder="ex : nattes, salle de bain, terracotta…"
              />
            </label>
          </div>

          {filteredProducts.length === 0 ? (
            <div className="empty-state">
              <h3>Aucune image trouvée pour ce filtre.</h3>
              <p>Ajoute tes photos dans <strong>public/products</strong>, puis relance le site.</p>
            </div>
          ) : (
            <div className="product-grid">
              {filteredProducts.map((product) => (
                <article className="product-card" key={product.id}>
                  <div className="product-media">
                    <img src={product.image} alt={product.title} loading="lazy" />
                  </div>
                  <div className="product-content">
                    <div className="product-meta-row">
                      <span>{product.universeLabel}</span>
                      <span>{product.price}</span>
                    </div>
                    <h3>{product.title}</h3>
                    <p>{product.description}</p>
                    <dl className="product-details">
                      <div>
                        <dt>Couleur</dt>
                        <dd>{product.color}</dd>
                      </div>
                      <div>
                        <dt>Matière</dt>
                        <dd>{product.material}</dd>
                      </div>
                      <div>
                        <dt>Finition</dt>
                        <dd>{product.finish}</dd>
                      </div>
                      <div>
                        <dt>Format</dt>
                        <dd>{product.size}</dd>
                      </div>
                    </dl>
                    <div className="product-actions">
                      <button type="button" onClick={() => addToCart(product)}>Ajouter</button>
                      <a
                        href={buildWhatsAppUrl(`Bonjour MUSE, je souhaite commander : ${product.title}. Univers : ${product.universeLabel}. Couleur souhaitée : ${product.color}.`)}
                      >
                        Commander
                      </a>
                    </div>
                  </div>
                </article>
              ))}
            </div>
          )}
        </section>

        <section className="section order-section" id="order">
          <div className="order-panel">
            <div>
              <p className="eyebrow">Commande</p>
              <h2>Le client choisit, puis commande sur WhatsApp.</h2>
              <p>
                Le panier prépare automatiquement le message. Tu peux remplacer le numéro WhatsApp dans <strong>NEXT_PUBLIC_WHATSAPP_PHONE</strong>.
              </p>
            </div>
            <div className="cart-box">
              <h3>Panier</h3>
              {cart.length === 0 ? (
                <p className="cart-empty">Aucun produit ajouté pour le moment.</p>
              ) : (
                <ul className="cart-list">
                  {cart.map((item) => (
                    <li key={item.id}>
                      <span>{item.title}</span>
                      <strong>×{item.quantity}</strong>
                      <button type="button" onClick={() => removeFromCart(item.id)}>retirer</button>
                    </li>
                  ))}
                </ul>
              )}
              <a className="primary-button full" href={buildWhatsAppUrl(cartMessage)}>Envoyer la commande</a>
            </div>
          </div>
        </section>
      </main>

      <footer className="site-footer">
        <div>
          <strong>MUSE</strong>
          <p>Objets déco imprimés en 3D, personnalisables et pensés pour le quotidien.</p>
        </div>
        <a href={buildWhatsAppUrl("Bonjour MUSE, je souhaite avoir plus d’informations.")}>Nous contacter</a>
      </footer>
    </div>
  );
}
