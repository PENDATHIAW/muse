"use client";

import { useEffect } from "react";
import Link from "next/link";
import { Button } from "@/components/ui/button";

export default function SiteError({
  error,
  reset,
}: {
  error: Error & { digest?: string };
  reset: () => void;
}) {
  useEffect(() => {
    console.error(error);
  }, [error]);

  return (
    <div className="muse-section flex min-h-[50vh] flex-col items-center justify-center text-center">
      <p className="text-xs uppercase tracking-[0.3em] text-muse-sage">MUSE</p>
      <h1 className="mt-4 font-serif text-3xl text-muse-charcoal">
        Impossible d&apos;afficher cette page
      </h1>
      <p className="mt-3 max-w-md text-sm text-muted-foreground">
        Réessayez dans un instant. Le catalogue reste disponible depuis l&apos;accueil.
      </p>
      <div className="mt-8 flex flex-wrap justify-center gap-3">
        <Button onClick={() => reset()}>Réessayer</Button>
        <Button asChild variant="outline">
          <Link href="/">Accueil</Link>
        </Button>
      </div>
    </div>
  );
}
