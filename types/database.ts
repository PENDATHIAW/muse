export type ProductStatus = "draft" | "published";
export type InquiryStatus = "new" | "discussing" | "confirmed" | "delivered" | "cancelled";
export type StockStatus = "available" | "limited" | "out_of_stock" | "made_to_order";

export interface Universe {
  id: string;
  name: string;
  slug: string;
  description: string;
  cover_image_url: string | null;
  display_order: number;
  is_active: boolean;
  created_at: string;
  updated_at: string;
}

export interface Product {
  id: string;
  universe_id: string;
  name: string;
  slug: string;
  short_description: string;
  long_description: string;
  price: number;
  old_price: number | null;
  dimensions: string;
  /** Délai de conception en jours — renseigné via admin, affiché au client */
  conception_days?: number | null;
  print_time: string;
  material: string;
  colors: string[];
  finishes: string[];
  personalization_options: string[];
  stock_status: StockStatus;
  status: ProductStatus;
  is_featured: boolean;
  display_order: number;
  tags: string[];
  internal_note: string;
  /** Comment utiliser l'objet au quotidien */
  usage?: string;
  /** Ce qui a inspiré ce modèle */
  inspiration?: string;
  /** Où installer / poser l'objet */
  placement?: string;
  created_at: string;
  updated_at: string;
  universe?: Universe;
  images?: ProductImage[];
}

export interface ProductImage {
  id: string;
  product_id: string;
  image_url: string;
  alt_text: string;
  is_main: boolean;
  display_order: number;
  created_at: string;
  product?: Pick<Product, "id" | "name" | "slug">;
}

export interface Inquiry {
  id: string;
  customer_name: string;
  customer_phone: string;
  customer_email: string | null;
  product_id: string | null;
  universe_id: string | null;
  message: string;
  status: InquiryStatus;
  admin_note: string;
  created_at: string;
  updated_at: string;
  product?: Pick<Product, "id" | "name" | "slug"> | null;
  universe?: Pick<Universe, "id" | "name" | "slug"> | null;
}

export type OrderQuoteStatus = "draft" | "sent" | "validated" | "rejected" | "cancelled";

export interface OrderQuote {
  id: string;
  token: string;
  inquiry_id: string | null;
  customer_name: string;
  customer_phone: string;
  customer_email: string | null;
  product_id: string | null;
  product_name: string;
  product_image_url: string;
  universe_name: string;
  unit_price: number;
  quantity: number;
  dimensions: string;
  colors: string;
  finishes: string;
  personalization: string;
  conception_days: number | null;
  delivery_note: string;
  admin_message: string;
  status: OrderQuoteStatus;
  send_channel: "" | "whatsapp" | "email";
  client_validated_at: string | null;
  created_at: string;
  updated_at: string;
}

export interface Setting {
  id: string;
  key: string;
  value: string;
  updated_at: string;
}

export type SettingsMap = Record<string, string>;

export interface ProductFilters {
  search?: string;
  universeSlug?: string;
  minPrice?: number;
  maxPrice?: number;
  color?: string;
  finish?: string;
  sort?: "newest" | "price_asc" | "price_desc" | "popular";
}

export interface DashboardStats {
  productsCount: number;
  universesCount: number;
  inquiriesCount: number;
  newInquiriesCount: number;
}
