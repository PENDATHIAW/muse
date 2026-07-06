import Link from "next/link";
import Image from "next/image";
import { cn } from "@/lib/utils";

const LOGO_SRC = "/logo-muse.png";

interface MuseLogoProps {
  className?: string;
  size?: "sm" | "md" | "lg" | "hero";
  href?: string;
  showTagline?: boolean;
  tagline?: string;
  /** Affiche le logo dans un cadre sombre (recommandé pour le visuel officiel MUSE) */
  framed?: boolean;
  /** Affiche uniquement la partie haute du visuel (symbole + MUSE) */
  cropToMark?: boolean;
}

const sizeMap = {
  sm: { width: 120, height: 48, heroHeight: 0 },
  md: { width: 140, height: 56, heroHeight: 0 },
  lg: { width: 200, height: 80, heroHeight: 0 },
  hero: { width: 320, height: 420, heroHeight: 420 },
};

export function MuseLogo({
  className,
  size = "md",
  href = "/",
  showTagline = false,
  tagline = "Shaping your ideas",
  framed = false,
  cropToMark = false,
}: MuseLogoProps) {
  const sizes = sizeMap[size];
  const useCrop = cropToMark || size !== "hero";

  const image = (
    <div
      className={cn(
        "relative overflow-hidden",
        useCrop ? "rounded-lg" : "rounded-2xl",
        framed && "bg-muse-charcoal shadow-lg",
        size === "hero" && !useCrop && "shadow-xl",
        className
      )}
      style={{
        width: sizes.width,
        height: useCrop ? sizes.height : sizes.heroHeight,
      }}
    >
      <Image
        src={LOGO_SRC}
        alt="MUSE — Shaping your ideas"
        fill
        priority={size === "hero"}
        className={cn(
          useCrop ? "object-cover object-[center_12%]" : "object-contain object-top",
          framed && useCrop && "p-1"
        )}
        sizes={`${sizes.width}px`}
      />
    </div>
  );

  const content = (
    <div className={cn("flex flex-col items-center text-center", className)}>
      {image}
      {(showTagline || size === "hero") && (
        <span className="mt-3 font-serif text-sm italic tracking-wide text-muse-moka sm:text-base">
          {tagline}
        </span>
      )}
    </div>
  );

  const wrapped = framed && size !== "hero" ? (
    <div
      className={cn(
        "inline-flex items-center justify-center rounded-2xl bg-muse-charcoal px-4 py-3 shadow-lg",
        size === "lg" && "px-6 py-4"
      )}
    >
      {image}
    </div>
  ) : (
    content
  );

  return (
    <Link
      href={href}
      className="inline-flex flex-col items-center"
      aria-label="MUSE — Accueil"
    >
      {size === "hero" ? content : wrapped}
    </Link>
  );
}
