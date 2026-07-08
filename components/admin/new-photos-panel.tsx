"use client";

import Image from "next/image";
import { useState, useTransition } from "react";
import { ImagePlus, Loader2, Sparkles } from "lucide-react";
import { toast } from "sonner";
import { Button } from "@/components/ui/button";
import { addNewImagesToCatalog } from "@/lib/actions/admin";

export type NewProductImage = {
  imagePath: string;
  filename: string;
  universeSlug: string;
  universeName: string;
  suggestedName: string;
  suggestedPrice: number;
};

type NewPhotosPanelProps = {
  images: NewProductImage[];
};

export function NewPhotosPanel({ images }: NewPhotosPanelProps) {
  const [items, setItems] = useState(images);
  const [pending, startTransition] = useTransition();

  if (items.length === 0) return null;

  function handleAddAll() {
    startTransition(async () => {
      const result = await addNewImagesToCatalog();
      if (result.error) {
        toast.error(result.error);
        return;
      }
      toast.success(result.message ?? `${result.added} produit(s) ajouté(s).`);
      setItems([]);
    });
  }

  function handleAddOne(imagePath: string) {
    startTransition(async () => {
      const result = await addNewImagesToCatalog([imagePath]);
      if (result.error) {
        toast.error(result.error);
        return;
      }
      toast.success(result.message ?? "Produit ajouté au catalogue.");
      setItems((current) => current.filter((img) => img.imagePath !== imagePath));
    });
  }

  return (
    <div className="mb-6 rounded-xl border-2 border-muse-sage/40 bg-muse-beige/40 p-5">
      <div className="flex flex-col gap-4 sm:flex-row sm:items-start sm:justify-between">
        <div className="flex gap-3">
          <div className="flex h-10 w-10 shrink-0 items-center justify-center rounded-full bg-muse-sage/20">
            <ImagePlus className="h-5 w-5 text-muse-sage" />
          </div>
          <div>
            <h2 className="text-lg font-semibold">
              {items.length} nouvelle{items.length > 1 ? "s" : ""} image
              {items.length > 1 ? "s" : ""} détectée{items.length > 1 ? "s" : ""}
            </h2>
            <p className="mt-1 text-sm text-muted-foreground">
              Mode legacy local : des photos ont été détectées dans{" "}
              <code>public/products/</code>. Cliquez pour les ajouter au catalogue
              avec génération automatique (univers, référence REF Mxx, prix et descriptions).
            </p>
          </div>
        </div>
        <Button onClick={handleAddAll} disabled={pending} className="shrink-0">
          {pending ? (
            <Loader2 className="mr-2 h-4 w-4 animate-spin" />
          ) : (
            <Sparkles className="mr-2 h-4 w-4" />
          )}
          Tout ajouter au catalogue
        </Button>
      </div>

      <div className="mt-4 grid gap-3 sm:grid-cols-2 lg:grid-cols-3">
        {items.map((image) => (
          <div
            key={image.imagePath}
            className="flex gap-3 rounded-lg border border-border bg-background p-3"
          >
            <div className="relative h-20 w-20 shrink-0 overflow-hidden rounded-md bg-muted">
              <Image
                src={image.imagePath}
                alt={image.suggestedName}
                fill
                className="object-cover"
                sizes="80px"
              />
            </div>
            <div className="min-w-0 flex-1">
              <p className="truncate text-sm font-medium">{image.suggestedName}</p>
              <p className="text-xs text-muted-foreground">{image.universeName}</p>
              <p className="text-xs text-muted-foreground">
                {image.suggestedPrice.toLocaleString("fr-FR")} FCFA
              </p>
              <Button
                type="button"
                variant="outline"
                size="sm"
                className="mt-2 h-7 text-xs"
                disabled={pending}
                onClick={() => handleAddOne(image.imagePath)}
              >
                Ajouter
              </Button>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}
