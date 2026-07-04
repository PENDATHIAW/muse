import Link from "next/link";
import { ExternalLink } from "lucide-react";
import { MuseLogo } from "@/components/logo";
import type { SettingsMap } from "@/types/database";

interface SiteFooterProps {
  settings?: SettingsMap;
}

export function SiteFooter({ settings = {} }: SiteFooterProps) {
  return (
    <footer className="mt-auto border-t border-border bg-muse-beige/30">
      <div className="mx-auto max-w-7xl px-4 py-12 sm:px-6 lg:px-8">
        <div className="grid gap-10 md:grid-cols-4">
          <div className="md:col-span-2">
            <MuseLogo size="md" />
            <p className="mt-4 max-w-md text-sm leading-relaxed text-muted-foreground">
              Objets utiles, beaux et personnalisables — conçus en impression 3D
              avec soin pour votre quotidien, votre maison et vos événements.
            </p>
          </div>

          <div>
            <h3 className="mb-3 text-sm font-semibold uppercase tracking-wider text-muse-charcoal">
              Navigation
            </h3>
            <ul className="space-y-2 text-sm text-muted-foreground">
              <li><Link href="/catalogue" className="hover:text-primary">Catalogue</Link></li>
              <li><Link href="/personnalisation" className="hover:text-primary">Personnalisation</Link></li>
              <li><Link href="/a-propos" className="hover:text-primary">À propos</Link></li>
              <li><Link href="/contact" className="hover:text-primary">Contact</Link></li>
            </ul>
          </div>

          <div>
            <h3 className="mb-3 text-sm font-semibold uppercase tracking-wider text-muse-charcoal">
              Contact
            </h3>
            <ul className="space-y-2 text-sm text-muted-foreground">
              {settings.contact_email && (
                <li>
                  <a href={`mailto:${settings.contact_email}`} className="hover:text-primary">
                    {settings.contact_email}
                  </a>
                </li>
              )}
              {settings.whatsapp_number && (
                <li>
                  <a
                    href={settings.whatsapp_url || `https://wa.me/${settings.whatsapp_number.replace(/\D/g, "")}`}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="hover:text-primary"
                  >
                    WhatsApp
                  </a>
                </li>
              )}
            </ul>
            <div className="mt-4 flex gap-3">
              {settings.instagram_url && (
                <a
                  href={settings.instagram_url}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="rounded-full border border-border p-2 text-muted-foreground hover:border-primary hover:text-primary"
                  aria-label="Instagram"
                >
                  <ExternalLink className="h-4 w-4" />
                </a>
              )}
            </div>
          </div>
        </div>

        <div className="mt-10 flex flex-col items-center justify-between gap-4 border-t border-border pt-8 text-xs text-muted-foreground sm:flex-row">
          <p>© {new Date().getFullYear()} MUSE — Tous droits réservés</p>
          <p>Impression 3D · Personnalisation · Artisanat moderne</p>
        </div>
      </div>
    </footer>
  );
}
