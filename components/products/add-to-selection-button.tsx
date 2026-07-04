"use client";

import { Heart } from "lucide-react";
import { Button } from "@/components/ui/button";
import { useSelection } from "@/components/selection/selection-provider";
import type { Product } from "@/types/database";

export function AddToSelectionButton({ product }: { product: Product }) {
  const { addItem } = useSelection();

  return (
    <Button variant="outline" onClick={() => addItem(product)}>
      <Heart className="mr-2 h-4 w-4" />
      Ajouter à ma sélection
    </Button>
  );
}
