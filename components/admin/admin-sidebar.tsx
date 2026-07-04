"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import {
  LayoutDashboard,
  Globe,
  Package,
  ImageIcon,
  MessageSquare,
  Settings,
  LogOut,
} from "lucide-react";
import { cn } from "@/lib/utils";
import { MuseLogo } from "@/components/logo";
import { signOut } from "@/lib/actions/auth";
import { Button } from "@/components/ui/button";

const navItems = [
  { href: "/admin", label: "Dashboard", icon: LayoutDashboard },
  { href: "/admin/univers", label: "Univers", icon: Globe },
  { href: "/admin/produits", label: "Produits", icon: Package },
  { href: "/admin/images", label: "Images", icon: ImageIcon },
  { href: "/admin/demandes", label: "Demandes clients", icon: MessageSquare },
  { href: "/admin/reglages", label: "Réglages", icon: Settings },
];

export function AdminSidebar() {
  const pathname = usePathname();

  return (
    <aside className="flex w-64 shrink-0 flex-col border-r border-border bg-sidebar">
      <div className="border-b border-border p-4">
        <MuseLogo size="sm" href="/admin" />
        <p className="mt-1 text-xs text-muted-foreground">Administration</p>
      </div>

      <nav className="flex-1 space-y-1 p-3">
        {navItems.map(({ href, label, icon: Icon }) => (
          <Link
            key={href}
            href={href}
            className={cn(
              "flex items-center gap-3 rounded-lg px-3 py-2 text-sm transition-colors",
              pathname === href || (href !== "/admin" && pathname.startsWith(href))
                ? "bg-sidebar-accent font-medium text-sidebar-accent-foreground"
                : "text-muted-foreground hover:bg-sidebar-accent/50 hover:text-sidebar-foreground"
            )}
          >
            <Icon className="h-4 w-4" />
            {label}
          </Link>
        ))}
      </nav>

      <div className="border-t border-border p-3">
        <form action={signOut}>
          <Button variant="ghost" className="w-full justify-start" type="submit">
            <LogOut className="mr-2 h-4 w-4" />
            Déconnexion
          </Button>
        </form>
      </div>
    </aside>
  );
}
