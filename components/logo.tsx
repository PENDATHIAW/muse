"use client";

import Image from "next/image";
import Link from "next/link";
import { useState } from "react";
import { cn } from "@/lib/utils";

interface MuseLogoProps {
  className?: string;
  size?: "sm" | "md" | "lg";
  href?: string;
}

const sizeMap = {
  sm: { text: "text-lg", img: 32 },
  md: { text: "text-2xl", img: 40 },
  lg: { text: "text-4xl sm:text-5xl", img: 64 },
};

export function MuseLogo({
  className,
  size = "md",
  href = "/",
}: MuseLogoProps) {
  const [showText, setShowText] = useState(false);
  const sizes = sizeMap[size];

  const content = showText ? (
    <span
      className={cn(
        "font-serif font-medium tracking-[0.35em] text-muse-charcoal",
        sizes.text,
        className
      )}
    >
      MUSE
    </span>
  ) : (
    <Image
      src="/logo-muse.png"
      alt="MUSE"
      width={sizes.img}
      height={sizes.img}
      className={cn("h-auto w-auto object-contain", className)}
      onError={() => setShowText(true)}
      priority={size === "lg"}
    />
  );

  return (
    <Link href={href} className="inline-flex items-center" aria-label="MUSE — Accueil">
      {content}
    </Link>
  );
}
