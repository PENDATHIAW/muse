import Link from "next/link";
import { Menu } from "lucide-react";
import { MuseLogo } from "@/components/logo";
import { Button } from "@/components/ui/button";
import {
  Sheet,
  SheetContent,
  SheetTrigger,
  SheetTitle,
} from "@/components/ui/sheet";
import type { Universe } from "@/types/database";

const navLinks = [
  { href: "/catalogue", label: "Catalogue" },
  { href: "/personnalisation", label: "Personnalisation" },
  { href: "/a-propos", label: "À propos" },
  { href: "/contact", label: "Contact" },
];

interface SiteHeaderProps {
  universes?: Universe[];
}

export function SiteHeader({ universes = [] }: SiteHeaderProps) {
  return (
    <header className="sticky top-0 z-50 border-b border-border/60 bg-background/90 backdrop-blur-md">
      <div className="mx-auto flex max-w-7xl items-center justify-between gap-4 px-4 py-4 sm:px-6 lg:px-8">
        <MuseLogo size="md" />

        <nav className="hidden items-center gap-8 lg:flex">
          {navLinks.map((link) => (
            <Link
              key={link.href}
              href={link.href}
              className="text-sm font-medium text-muted-foreground transition-colors hover:text-muse-charcoal"
            >
              {link.label}
            </Link>
          ))}
          {universes.length > 0 && (
            <div className="group relative">
              <button className="text-sm font-medium text-muted-foreground transition-colors hover:text-muse-charcoal">
                Univers
              </button>
              <div className="invisible absolute left-0 top-full z-50 mt-2 w-72 rounded-xl border border-border bg-card p-2 opacity-0 shadow-lg transition-all group-hover:visible group-hover:opacity-100">
                {universes.slice(0, 8).map((u) => (
                  <Link
                    key={u.id}
                    href={`/univers/${u.slug}`}
                    className="block rounded-lg px-3 py-2 text-sm text-muted-foreground hover:bg-muted hover:text-muse-charcoal"
                  >
                    {u.name}
                  </Link>
                ))}
                <Link
                  href="/catalogue"
                  className="mt-1 block rounded-lg px-3 py-2 text-sm font-medium text-primary"
                >
                  Voir tout le catalogue →
                </Link>
              </div>
            </div>
          )}
        </nav>

        <div className="hidden lg:block">
          <Button asChild>
            <Link href="/contact">Commander</Link>
          </Button>
        </div>

        <Sheet>
          <SheetTrigger asChild className="lg:hidden">
            <Button variant="outline" size="icon" aria-label="Menu">
              <Menu className="h-5 w-5" />
            </Button>
          </SheetTrigger>
          <SheetContent side="right" className="w-80 bg-background">
            <SheetTitle className="sr-only">Navigation</SheetTitle>
            <div className="mt-8 flex flex-col gap-4">
              {navLinks.map((link) => (
                <Link
                  key={link.href}
                  href={link.href}
                  className="text-lg font-medium text-muse-charcoal"
                >
                  {link.label}
                </Link>
              ))}
              <div className="border-t border-border pt-4">
                <p className="mb-2 text-xs uppercase tracking-wider text-muted-foreground">
                  Univers
                </p>
                {universes.map((u) => (
                  <Link
                    key={u.id}
                    href={`/univers/${u.slug}`}
                    className="block py-1.5 text-sm text-muted-foreground"
                  >
                    {u.name}
                  </Link>
                ))}
              </div>
              <Button asChild className="mt-4">
                <Link href="/contact">Commander</Link>
              </Button>
            </div>
          </SheetContent>
        </Sheet>
      </div>
    </header>
  );
}
