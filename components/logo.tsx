import Link from "next/link";
import Image from "next/image";
import { cn } from "@/lib/utils";

const LOGO_SRC = "/logo-muse.png";
const LOGO_HERO_SRC = "/logo-muse-hero.png";

interface MuseLogoProps {
  className?: string;
  size?: "sm" | "md" | "lg" | "hero";
  href?: string;
  showTagline?: boolean;
  tagline?: string;
}

const sizeMap = {
  sm: { width: 140, height: 52 },
  md: { width: 160, height: 60 },
  lg: { width: 220, height: 82 },
  hero: { width: 320, height: 320 },
};

export function MuseLogo({
  className,
  size = "md",
  href = "/",
  showTagline = false,
  tagline = "Shaping your ideas",
}: MuseLogoProps) {
  const sizes = sizeMap[size];
  const src = size === "hero" ? LOGO_HERO_SRC : LOGO_SRC;

  const content = (
    <div className={cn("flex flex-col items-center text-center", className)}>
      <div
        className={cn(
          "relative overflow-hidden rounded-2xl shadow-lg",
          size === "hero" && "shadow-xl"
        )}
        style={{ width: sizes.width, height: sizes.height }}
      >
        <Image
          src={src}
          alt="MUSE — Shaping your ideas"
          fill
          priority={size === "hero"}
          className="object-contain"
          sizes={`${sizes.width}px`}
        />
      </div>
      {showTagline && size !== "hero" && (
        <span className="mt-2 font-serif text-sm italic tracking-wide text-muse-moka">
          {tagline}
        </span>
      )}
    </div>
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
