"use client";

import { useState, useTransition } from "react";
import { Trash2, Star, Link2 } from "lucide-react";
import Image from "next/image";
import { toast } from "sonner";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Checkbox } from "@/components/ui/checkbox";
import {
  addProductImage,
  deleteProductImage,
  setMainProductImage,
} from "@/lib/actions/admin";
import type { ProductImage } from "@/types/database";

interface ImageManagerProps {
  productId: string;
  productSlug?: string;
  images: ProductImage[];
}

function suggestImagePath(slug: string, index: number) {
  const suffix = index === 0 ? "main" : String(index + 1);
  return `/products/${slug}/${suffix}.jpg`;
}

export function ImageManager({
  productId,
  productSlug = "",
  images,
}: ImageManagerProps) {
  const [pending, startTransition] = useTransition();
  const [imageUrl, setImageUrl] = useState(
    productSlug ? suggestImagePath(productSlug, images.length) : ""
  );
  const [altText, setAltText] = useState("");
  const [isMain, setIsMain] = useState(images.length === 0);

  async function handleAddImage(e: React.FormEvent) {
    e.preventDefault();
    if (!imageUrl.trim()) {
      toast.error("Indiquez le chemin de l'image.");
      return;
    }

    const formData = new FormData();
    formData.set("product_id", productId);
    formData.set("image_url", imageUrl.trim());
    formData.set("alt_text", altText.trim() || productSlug || "Produit MUSE");
    formData.set("display_order", String(images.length));
    if (isMain) formData.set("is_main", "on");

    const result = await addProductImage(formData);
    if (result?.error) {
      toast.error(result.error);
      return;
    }

    toast.success("Image ajoutée. Pensez à pousser le fichier sur GitHub si ce n'est pas déjà fait.");
    setAltText("");
    setIsMain(false);
    if (productSlug) {
      setImageUrl(suggestImagePath(productSlug, images.length + 1));
    }
  }

  function handleSetMain(imageId: string) {
    startTransition(async () => {
      const result = await setMainProductImage(imageId, productId);
      if (result?.error) toast.error(result.error);
      else toast.success("Image principale définie.");
    });
  }

  function handleDelete(imageId: string) {
    startTransition(async () => {
      const result = await deleteProductImage(imageId, productId);
      if (result?.error) toast.error(result.error);
      else toast.success("Image retirée du produit.");
    });
  }

  return (
    <div className="space-y-6">
      <div className="rounded-lg border border-dashed border-border bg-muse-beige/20 p-4">
        <p className="text-sm text-muted-foreground">
          <strong>Mode GitHub :</strong> ajoutez vos fichiers dans{" "}
          <code className="rounded bg-muted px-1">public/products/</code>, poussez sur
          GitHub, puis liez le chemin ici (ex.{" "}
          <code className="rounded bg-muted px-1">/products/mon-produit/main.jpg</code>
          ). Supabase Storage n&apos;est pas nécessaire.
        </p>
      </div>

      <form onSubmit={handleAddImage} className="space-y-4 rounded-lg border border-border p-4">
        <div>
          <Label htmlFor="image_url">Chemin de l&apos;image *</Label>
          <Input
            id="image_url"
            value={imageUrl}
            onChange={(e) => setImageUrl(e.target.value)}
            placeholder="/products/charge-guard-2-en-1/main.jpg"
            required
          />
          {productSlug && (
            <p className="mt-1 text-xs text-muted-foreground">
              Dossier suggéré : <code>public/products/{productSlug}/</code>
            </p>
          )}
        </div>
        <div>
          <Label htmlFor="alt_text">Texte alternatif (SEO)</Label>
          <Input
            id="alt_text"
            value={altText}
            onChange={(e) => setAltText(e.target.value)}
            placeholder="Organisateur mural cuisine MUSE"
          />
        </div>
        <div className="flex items-center gap-2">
          <Checkbox
            id="is_main"
            checked={isMain}
            onCheckedChange={(v) => setIsMain(v === true)}
          />
          <Label htmlFor="is_main">Définir comme image principale</Label>
        </div>
        <Button type="submit" disabled={pending}>
          <Link2 className="mr-2 h-4 w-4" />
          Lier cette image
        </Button>
      </form>

      <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
        {images.map((img) => (
          <div key={img.id} className="rounded-lg border border-border p-3">
            <div className="relative aspect-square overflow-hidden rounded-md bg-muted">
              <Image
                src={img.image_url}
                alt={img.alt_text}
                fill
                className="object-cover"
                unoptimized={img.image_url.startsWith("/")}
              />
              {img.is_main && (
                <span className="absolute left-2 top-2 rounded bg-primary px-2 py-0.5 text-xs text-white">
                  Principale
                </span>
              )}
            </div>
            <p className="mt-2 truncate text-xs font-mono text-muted-foreground">
              {img.image_url}
            </p>
            <p className="truncate text-xs text-muted-foreground">{img.alt_text}</p>
            <div className="mt-2 flex gap-2">
              {!img.is_main && (
                <Button
                  type="button"
                  variant="outline"
                  size="sm"
                  disabled={pending}
                  onClick={() => handleSetMain(img.id)}
                >
                  <Star className="h-3 w-3" />
                </Button>
              )}
              <Button
                type="button"
                variant="destructive"
                size="sm"
                disabled={pending}
                onClick={() => handleDelete(img.id)}
              >
                <Trash2 className="h-3 w-3" />
              </Button>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}
