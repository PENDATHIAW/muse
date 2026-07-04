"use client";

import { useState } from "react";
import Image from "next/image";
import { cn } from "@/lib/utils";
import type { ProductImage } from "@/types/database";

interface ProductGalleryProps {
  images: ProductImage[];
  productName: string;
}

export function ProductGallery({ images, productName }: ProductGalleryProps) {
  const sorted = [...images].sort((a, b) => a.display_order - b.display_order);
  const mainImage = sorted.find((i) => i.is_main) ?? sorted[0];
  const [activeId, setActiveId] = useState(mainImage?.id);

  const active = sorted.find((i) => i.id === activeId) ?? mainImage;

  if (!sorted.length) {
    return (
      <div className="flex aspect-square items-center justify-center rounded-2xl bg-gradient-to-br from-muse-beige to-muse-sand/50">
        <span className="font-serif text-4xl tracking-[0.3em] text-muse-moka/40">
          MUSE
        </span>
      </div>
    );
  }

  return (
    <div className="space-y-4">
      <div className="relative aspect-square overflow-hidden rounded-2xl bg-muse-beige/30">
        {active && (
          <Image
            src={active.image_url}
            alt={active.alt_text || productName}
            fill
            className="object-cover"
            sizes="(max-width: 768px) 100vw, 50vw"
            priority
          />
        )}
      </div>
      {sorted.length > 1 && (
        <div className="flex gap-2 overflow-x-auto pb-1">
          {sorted.map((img) => (
            <button
              key={img.id}
              type="button"
              onClick={() => setActiveId(img.id)}
              className={cn(
                "relative h-20 w-20 shrink-0 overflow-hidden rounded-lg border-2 transition-colors",
                activeId === img.id ? "border-primary" : "border-transparent"
              )}
            >
              <Image
                src={img.image_url}
                alt={img.alt_text || productName}
                fill
                className="object-cover"
                sizes="80px"
              />
            </button>
          ))}
        </div>
      )}
    </div>
  );
}
