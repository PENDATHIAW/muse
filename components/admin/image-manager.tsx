"use client";

import { useRef, useState, useTransition } from "react";
import { useRouter } from "next/navigation";
import { Upload, Trash2, Star } from "lucide-react";
import Image from "next/image";
import { toast } from "sonner";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { createClient } from "@/lib/supabase/client";
import {
  addProductImage,
  deleteProductImage,
  setMainProductImage,
} from "@/lib/actions/admin";
import type { ProductImage } from "@/types/database";

interface ImageManagerProps {
  productId: string;
  images: ProductImage[];
}

export function ImageManager({ productId, images }: ImageManagerProps) {
  const router = useRouter();
  const fileRef = useRef<HTMLInputElement>(null);
  const [uploading, setUploading] = useState(false);
  const [pending, startTransition] = useTransition();

  async function handleUpload(e: React.ChangeEvent<HTMLInputElement>) {
    const file = e.target.files?.[0];
    if (!file) return;

    setUploading(true);
    try {
      const supabase = createClient();
      const ext = file.name.split(".").pop();
      const path = `${productId}/${Date.now()}.${ext}`;

      const { error: uploadError } = await supabase.storage
        .from("product-images")
        .upload(path, file);

      if (uploadError) throw uploadError;

      const { data } = supabase.storage.from("product-images").getPublicUrl(path);

      const formData = new FormData();
      formData.set("product_id", productId);
      formData.set("image_url", data.publicUrl);
      formData.set("alt_text", file.name.replace(/\.[^.]+$/, ""));
      formData.set("display_order", String(images.length));
      if (images.length === 0) formData.set("is_main", "on");

      const result = await addProductImage(formData);
      if (result?.error) throw new Error(result.error);

      toast.success("Image uploadée avec succès.");
      router.refresh();
    } catch (err) {
      toast.error(err instanceof Error ? err.message : "Erreur d'upload");
    } finally {
      setUploading(false);
      if (fileRef.current) fileRef.current.value = "";
    }
  }

  function handleSetMain(imageId: string) {
    startTransition(async () => {
      const result = await setMainProductImage(imageId, productId);
      if (result?.error) toast.error(result.error);
      else toast.success("Image principale définie.");
      router.refresh();
    });
  }

  function handleDelete(imageId: string) {
    startTransition(async () => {
      const result = await deleteProductImage(imageId, productId);
      if (result?.error) toast.error(result.error);
      else toast.success("Image supprimée.");
      router.refresh();
    });
  }

  function handleLinkUrl(e: React.FormEvent<HTMLFormElement>) {
    e.preventDefault();
    const form = e.currentTarget;
    const formData = new FormData(form);
    startTransition(async () => {
      const result = await addProductImage(formData);
      if (result?.error) toast.error(result.error);
      else {
        toast.success("Image liée au produit.");
        form.reset();
        router.refresh();
      }
    });
  }

  return (
    <div className="space-y-4">
      <div>
        <Label htmlFor={`upload-${productId}`}>Uploader une image (Supabase Storage)</Label>
        <div className="mt-2">
          <Input
            id={`upload-${productId}`}
            ref={fileRef}
            type="file"
            accept="image/*"
            onChange={handleUpload}
            disabled={uploading || pending}
          />
        </div>
        {uploading && (
          <p className="mt-1 text-xs text-muted-foreground">Upload en cours...</p>
        )}
      </div>

      <form
        onSubmit={handleLinkUrl}
        className="space-y-3 rounded-lg border border-dashed border-border p-4"
      >
        <p className="text-sm font-medium">Ou lier une photo déjà sur GitHub</p>
        <input type="hidden" name="product_id" value={productId} />
        <input type="hidden" name="display_order" value={String(images.length)} />
        {images.length === 0 && <input type="hidden" name="is_main" value="on" />}
        <div>
          <Label htmlFor={`url-${productId}`}>Chemin public</Label>
          <Input
            id={`url-${productId}`}
            name="image_url"
            placeholder="/catalogue-a-traiter/muse-kitchen/mon-produit.jpg"
            required
          />
        </div>
        <div>
          <Label htmlFor={`alt-${productId}`}>Texte alternatif</Label>
          <Input id={`alt-${productId}`} name="alt_text" placeholder="Description courte de l'image" />
        </div>
        <Button type="submit" variant="outline" size="sm" disabled={pending}>
          Lier cette image
        </Button>
      </form>

      <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
        {images.map((img) => (
          <div key={img.id} className="rounded-lg border border-border p-3">
            <div className="relative aspect-square overflow-hidden rounded-md bg-muted">
              <Image src={img.image_url} alt={img.alt_text} fill className="object-cover" />
              {img.is_main && (
                <span className="absolute left-2 top-2 rounded bg-primary px-2 py-0.5 text-xs text-white">
                  Principale
                </span>
              )}
            </div>
            <p className="mt-2 truncate text-xs text-muted-foreground">{img.alt_text}</p>
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
