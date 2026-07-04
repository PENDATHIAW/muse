import Link from "next/link";
import { notFound } from "next/navigation";

export default function NotFound() {
  return (
    <div className="muse-section flex min-h-[50vh] flex-col items-center justify-center text-center">
      <h1 className="font-serif text-4xl text-muse-charcoal">404</h1>
      <p className="mt-4 text-muted-foreground">Cette page n&apos;existe pas.</p>
      <Link
        href="/"
        className="mt-6 text-sm font-medium text-primary hover:underline"
      >
        Retour à l&apos;accueil
      </Link>
    </div>
  );
}
