import Link from "next/link";
import { Heart } from "lucide-react";
import type { Product } from "@/types/database";

export function AddToSelectionButton({ product }: { product: Product }) {
  const params = new URLSearchParams({
    product: product.id,
    message: `Bonjour MUSE, je suis intéressée par : ${product.name}`,
  });

  return (
    <Link
      href={`/contact?${params.toString()}`}
      className="inline-flex items-center justify-center rounded-lg border border-border bg-background px-4 py-2 text-sm font-medium hover:bg-muted"
    >
      <Heart className="mr-2 h-4 w-4" />
      Demander ce produit
    </Link>
  );
}
