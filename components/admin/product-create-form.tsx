"use client";

import { useMemo, useState, useTransition } from "react";
import Link from "next/link";
import Image from "next/image";
import { Loader2, Sparkles } from "lucide-react";
import { toast } from "sonner";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import {
  analyzePhotoPreview,
  createProductWithPhotos,
} from "@/lib/actions/admin";
import type { Universe } from "@/types/database";

type ProductCreateFormProps = {
  universes: Universe[];
};

export function ProductCreateForm({ universes }: ProductCreateFormProps) {
  const [files, setFiles] = useState<File[]>([]);
  const [previews, setPreviews] = useState<string[]>([]);
  const [price, setPrice] = useState("");
  const [name, setName] = useState("");
  const [universeId, setUniverseId] = useState("");
  const [analysisHint, setAnalysisHint] = useState<string | null>(null);
  const [pending, startTransition] = useTransition();

  const universeBySlug = useMemo(
    () => Object.fromEntries(universes.map((u) => [u.slug, u])),
    [universes]
  );

  async function handleFiles(selected: FileList | null) {
    if (!selected?.length) return;

    const nextFiles = [...files, ...Array.from(selected)];
    setFiles(nextFiles);
    setPreviews((current) => [
      ...current,
      ...Array.from(selected).map((file) => URL.createObjectURL(file)),
    ]);

    const first = nextFiles[0];
    if (!first) return;

    const result = await analyzePhotoPreview(first.name);
    if (result.universeSlug && universeBySlug[result.universeSlug]) {
      setUniverseId(universeBySlug[result.universeSlug].id);
      setAnalysisHint(
        `Univers détecté : ${universeBySlug[result.universeSlug].name}`
      );
    } else {
      setAnalysisHint("Univers non détecté — choisissez-le manuellement si besoin.");
    }

    if (!name.trim() && result.suggestedName) {
      setName(result.suggestedName);
    }
  }

  function removeFile(index: number) {
    setFiles((current) => current.filter((_, i) => i !== index));
    setPreviews((current) => {
      const copy = [...current];
      URL.revokeObjectURL(copy[index]);
      copy.splice(index, 1);
      return copy;
    });
  }

  function handleSubmit(e: React.FormEvent<HTMLFormElement>) {
    e.preventDefault();

    if (!price.trim() || Number(price) <= 0) {
      toast.error("Le prix est obligatoire.");
      return;
    }

    if (files.length === 0) {
      toast.error("Ajoutez au moins une photo.");
      return;
    }

    const formData = new FormData();
    formData.set("price", price);
    if (name.trim()) formData.set("name", name.trim());
    if (universeId) formData.set("universe_id", universeId);
    if (e.currentTarget.is_featured.checked) formData.set("is_featured", "on");
    files.forEach((file) => formData.append("photos", file));

    startTransition(async () => {
      const result = await createProductWithPhotos(formData);
      if (result?.error) {
        toast.error(result.error);
      }
    });
  }

  return (
    <form onSubmit={handleSubmit} className="space-y-6">
      <div>
        <Label htmlFor="photos">Photos du modèle *</Label>
        <Input
          id="photos"
          type="file"
          accept="image/*"
          multiple
          className="mt-2"
          onChange={(e) => {
            void handleFiles(e.target.files);
            e.target.value = "";
          }}
        />
        <p className="mt-1 text-xs text-muted-foreground">
          Sélectionnez une ou plusieurs images. L&apos;univers et le nom peuvent
          être détectés automatiquement à partir de la première photo.
        </p>

        {previews.length > 0 && (
          <div className="mt-4 grid grid-cols-2 gap-3 sm:grid-cols-4">
            {previews.map((src, index) => (
              <div key={src} className="relative overflow-hidden rounded-lg border border-border">
                <div className="relative aspect-square bg-muted">
                  <Image src={src} alt="" fill className="object-cover" unoptimized />
                </div>
                <button
                  type="button"
                  className="absolute right-2 top-2 rounded bg-background/90 px-2 py-1 text-xs"
                  onClick={() => removeFile(index)}
                >
                  Retirer
                </button>
              </div>
            ))}
          </div>
        )}
      </div>

      <div>
        <Label htmlFor="price">Prix (FCFA) *</Label>
        <Input
          id="price"
          name="price"
          type="number"
          min={1}
          required
          value={price}
          onChange={(e) => setPrice(e.target.value)}
          placeholder="Ex. 9000"
          className="mt-2"
        />
      </div>

      <div>
        <Label htmlFor="name">Nom du modèle (optionnel)</Label>
        <Input
          id="name"
          value={name}
          onChange={(e) => setName(e.target.value)}
          placeholder="Laissé vide = généré automatiquement"
          className="mt-2"
        />
      </div>

      <div>
        <Label htmlFor="universe_id">Univers (optionnel)</Label>
        <select
          id="universe_id"
          value={universeId}
          onChange={(e) => setUniverseId(e.target.value)}
          className="mt-2 flex h-9 w-full rounded-md border border-input bg-transparent px-3 py-1 text-sm"
        >
          <option value="">Détection automatique depuis la photo</option>
          {universes.map((u) => (
            <option key={u.id} value={u.id}>
              {u.name}
            </option>
          ))}
        </select>
        {analysisHint && (
          <p className="mt-2 flex items-center gap-2 text-xs text-muse-sage">
            <Sparkles className="h-3 w-3" />
            {analysisHint}
          </p>
        )}
      </div>

      <div className="rounded-lg border border-border bg-muted/30 p-4 text-sm text-muted-foreground">
        Au clic sur <strong className="text-foreground">Ajouter au site</strong>,
        MUSE génère automatiquement la description, l&apos;usage, l&apos;inspiration,
        l&apos;emplacement et les options de personnalisation selon l&apos;univers.
      </div>

      <div className="flex items-center gap-2">
        <input
          type="checkbox"
          id="is_featured"
          name="is_featured"
          className="h-4 w-4 rounded border-input"
        />
        <Label htmlFor="is_featured">Afficher sur la page d&apos;accueil</Label>
      </div>

      <div className="flex gap-3">
        <Button type="submit" disabled={pending}>
          {pending ? (
            <>
              <Loader2 className="mr-2 h-4 w-4 animate-spin" />
              Publication...
            </>
          ) : (
            "Ajouter au site"
          )}
        </Button>
        <Button asChild variant="outline" disabled={pending}>
          <Link href="/admin/produits">Annuler</Link>
        </Button>
      </div>
    </form>
  );
}
