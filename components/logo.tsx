"use client";

import Image from "next/image";
import Link from "next/link";
import { useState } from "react";
import { cn } from "@/lib/utils";

interface MuseLogoProps {
  className?: string;
  size?: "sm" | "md" | "lg" | "hero";
  href?: string;
  showTagline?: boolean;
  tagline?: string;
  /** Affiche le logo dans un cadre sombre (recommandé pour le visuel officiel MUSE) */
  framed?: boolean;
}

const sizeMap = {
  sm: { text: "text-lg", width: 100, height: 36 },
  md: { text: "text-2xl", width: 130, height: 48 },
  lg: { text: "text-4xl", width: 180, height: 72 },
  hero: { text: "text-5xl", width: 280, height: 140 },
};

export function MuseLogo({
  className,
  size = "md",
  href = "/",
  showTagline = false,
  tagline = "Shaping your ideas",
  framed = false,
}: MuseLogoProps) {
  const [showText, setShowText] = useState(false);
  const sizes = sizeMap[size];

  const fallback = (
    <div className={cn("flex flex-col items-center text-center", className)}>
      <span
        className={cn(
          "font-serif font-semibold tracking-[0.4em] text-muse-charcoal",
          sizes.text
        )}
      >
        MUSE
      </span>
      {(showTagline || size === "hero") && (
        <span className="mt-2 font-serif text-sm italic tracking-wide text-muse-moka sm:text-base">
          {tagline}
        </span>
      )}
    </div>
  );

  const image = (
    <Image
      src="/logo-muse.png"
      alt="MUSE — Shaping your ideas"
      width={sizes.width}
      height={sizes.height}
      className={cn("h-auto w-auto max-w-full object-contain", className)}
      onError={() => setShowText(true)}
      priority={size === "hero" || size === "lg"}
    />
  );

  const content = showText ? (
    fallback
  ) : framed ? (
    <div
      className={cn(
        "inline-flex items-center justify-center rounded-2xl bg-muse-charcoal px-6 py-4 shadow-lg",
        size === "hero" && "px-10 py-6"
      )}
    >
      {image}
    </div>
  ) : (
    image
  );

  return (
    <Link
      href={href}
      className="inline-flex flex-col items-center"
      aria-label="MUSE — Accueil"
    >
      {content}
    </Link>
  );
}
