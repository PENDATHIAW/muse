import Link from "next/link";
import { Package, Globe, MessageSquare, Plus } from "lucide-react";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import {
  getDashboardStats,
  getRecentProductsAdmin,
  getRecentInquiriesAdmin,
} from "@/lib/queries";
import { INQUIRY_STATUS_LABELS, formatPrice } from "@/lib/utils-muse";

export const dynamic = "force-dynamic";

export default async function AdminDashboardPage() {
  const [stats, recentProducts, recentInquiries] = await Promise.all([
    getDashboardStats(),
    getRecentProductsAdmin(),
    getRecentInquiriesAdmin(),
  ]);

  return (
    <div>
      <h1 className="text-2xl font-semibold text-muse-charcoal">Dashboard</h1>
      <p className="mt-1 text-sm text-muted-foreground">
        Vue d&apos;ensemble de votre catalogue MUSE
      </p>

      <div className="mt-8 grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
        {[
          { label: "Produits", value: stats.productsCount, icon: Package, href: "/admin/produits" },
          { label: "Univers", value: stats.universesCount, icon: Globe, href: "/admin/univers" },
          { label: "Demandes", value: stats.inquiriesCount, icon: MessageSquare, href: "/admin/demandes" },
          { label: "Nouvelles demandes", value: stats.newInquiriesCount, icon: MessageSquare, href: "/admin/demandes" },
        ].map(({ label, value, icon: Icon, href }) => (
          <Link key={label} href={href}>
            <Card className="muse-card-hover">
              <CardHeader className="flex flex-row items-center justify-between pb-2">
                <CardTitle className="text-sm font-medium text-muted-foreground">
                  {label}
                </CardTitle>
                <Icon className="h-4 w-4 text-muted-foreground" />
              </CardHeader>
              <CardContent>
                <p className="text-3xl font-bold">{value}</p>
              </CardContent>
            </Card>
          </Link>
        ))}
      </div>

      <div className="mt-8 flex flex-wrap gap-3">
        <Button asChild>
          <Link href="/admin/produits/nouveau">
            <Plus className="mr-2 h-4 w-4" />
            Nouveau produit
          </Link>
        </Button>
        <Button asChild variant="outline">
          <Link href="/admin/univers/nouveau">
            <Plus className="mr-2 h-4 w-4" />
            Nouvel univers
          </Link>
        </Button>
      </div>

      <div className="mt-10 grid gap-8 lg:grid-cols-2">
        <Card>
          <CardHeader>
            <CardTitle className="text-lg">Derniers produits</CardTitle>
          </CardHeader>
          <CardContent>
            {recentProducts.length === 0 ? (
              <p className="text-sm text-muted-foreground">Aucun produit.</p>
            ) : (
              <ul className="space-y-3">
                {recentProducts.map((p) => (
                  <li key={p.id} className="flex items-center justify-between text-sm">
                    <Link href={`/admin/produits/${p.id}/edit`} className="hover:text-primary">
                      {p.name}
                    </Link>
                    <div className="flex items-center gap-2">
                      <span className="text-muted-foreground">{formatPrice(p.price)}</span>
                      <Badge variant={p.status === "published" ? "default" : "secondary"}>
                        {p.status === "published" ? "Publié" : "Brouillon"}
                      </Badge>
                    </div>
                  </li>
                ))}
              </ul>
            )}
          </CardContent>
        </Card>

        <Card>
          <CardHeader>
            <CardTitle className="text-lg">Dernières demandes</CardTitle>
          </CardHeader>
          <CardContent>
            {recentInquiries.length === 0 ? (
              <p className="text-sm text-muted-foreground">Aucune demande.</p>
            ) : (
              <ul className="space-y-3">
                {recentInquiries.map((inq) => (
                  <li key={inq.id} className="flex items-center justify-between text-sm">
                    <div>
                      <p className="font-medium">{inq.customer_name}</p>
                      <p className="text-xs text-muted-foreground">{inq.customer_phone}</p>
                    </div>
                    <Badge variant="outline">
                      {INQUIRY_STATUS_LABELS[inq.status] || inq.status}
                    </Badge>
                  </li>
                ))}
              </ul>
            )}
          </CardContent>
        </Card>
      </div>
    </div>
  );
}
