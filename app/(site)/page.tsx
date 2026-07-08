import ShopClient from "@/components/shop/shop-client";
import { getLocalProducts, getMuseUniverses } from "@/lib/local-products";

export const dynamic = "force-dynamic";
export const revalidate = 0;

export default function HomePage() {
  const products = getLocalProducts();
  const universes = getMuseUniverses(products);

  return <ShopClient products={products} universes={universes} />;
}
