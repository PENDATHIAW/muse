import Link from "next/link";
import { ExternalLink, Package } from "lucide-react";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { GithubEditBanner } from "@/components/admin/github-edit-banner";
import {
  getDashboardStats,
  getRecentProductsAdmin,
  githubEditUrl,
} from "@/lib/catalog";
import { formatPrice, PRODUCT_STATUS_LABELS } from "@/lib/utils-muse";

export default function AdminDashboardPage() {
  const stats = getDashboardStats();
  const recentProducts = getRecentProductsAdmin();

  return (
    <div>
      <GithubEditBanner
        filePath="data/products.json"
        label="Pour ajouter ou modifier des produits, éditez les fichiers JSON."
      />

      <h1 className="text-2xl font-semibold text-muse-charcoal">Dashboard</h1>
      <p className="mt-1 text-sm text-muted-foreground">
        Catalogue local · aucune base de données requise
      </p>

      <div className="mt-8 grid gap-4 sm:grid-cols-3">
        {[
          { label: "Produits", value: stats.productsCount, href: "/admin/produits" },
          { label: "Univers", value: stats.universesCount, href: "/admin/univers" },
          { label: "Mode", value: "GitHub", href: "/admin/images" },
        ].map(({ label, value, href }) => (
          <Link key={label} href={href}>
            <Card className="muse-card-hover">
              <CardHeader className="pb-2">
                <CardTitle className="text-sm font-medium text-muted-foreground">
                  {label}
                </CardTitle>
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
          <Link href={githubEditUrl("data/products.json")} target="_blank">
            <ExternalLink className="mr-2 h-4 w-4" />
            Ajouter un produit (GitHub)
          </Link>
        </Button>
        <Button asChild variant="outline">
          <Link href={githubEditUrl("data/universes.json")} target="_blank">
            <ExternalLink className="mr-2 h-4 w-4" />
            Modifier les univers
          </Link>
        </Button>
      </div>

      <Card className="mt-10">
        <CardHeader>
          <CardTitle className="text-lg">Produits du catalogue</CardTitle>
        </CardHeader>
        <CardContent>
          <ul className="space-y-3">
            {recentProducts.map((p) => (
              <li key={p.id} className="flex items-center justify-between text-sm">
                <Link href={`/admin/produits/${p.id}/edit`} className="hover:text-primary">
                  {p.name}
                </Link>
                <div className="flex items-center gap-2">
                  <span className="text-muted-foreground">{formatPrice(p.price)}</span>
                  <Badge variant={p.status === "published" ? "default" : "secondary"}>
                    {PRODUCT_STATUS_LABELS[p.status]}
                  </Badge>
                </div>
              </li>
            ))}
          </ul>
        </CardContent>
      </Card>

      <Card className="mt-6 border-muse-sage/30 bg-muse-beige/20">
        <CardContent className="flex items-start gap-4 p-6">
          <Package className="mt-1 h-5 w-5 text-muse-sage" />
          <div>
            <h2 className="font-medium">Ajouter des visuels produits</h2>
            <p className="mt-1 text-sm text-muted-foreground">
              1. Uploadez la photo dans <code>public/products/[slug]/main.jpg</code>
              <br />
              2. Vérifiez le chemin dans <code>data/products.json</code>
              <br />
              3. Commit + push GitHub
            </p>
          </div>
        </CardContent>
      </Card>
    </div>
  );
}
