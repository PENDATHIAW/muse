import Link from "next/link";
import { ExternalLink } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { GithubEditBanner } from "@/components/admin/github-edit-banner";
import { githubEditUrl } from "@/lib/catalog";

export default function NewProductGuidePage() {
  return (
    <div>
      <GithubEditBanner filePath="data/products.json" />
      <h1 className="text-2xl font-semibold">Ajouter un produit</h1>
      <Card className="mt-6 max-w-2xl">
        <CardHeader>
          <CardTitle>Via GitHub (recommandé)</CardTitle>
        </CardHeader>
        <CardContent className="space-y-4 text-sm text-muted-foreground">
          <ol className="list-decimal space-y-2 pl-5">
            <li>Ouvrez <code>data/products.json</code> sur GitHub</li>
            <li>Dupliquez un produit existant et modifiez les champs</li>
            <li>Ajoutez la photo dans <code>public/products/[slug]/main.jpg</code></li>
            <li>Commit + push → le site se met à jour</li>
          </ol>
          <Button asChild>
            <Link href={githubEditUrl("data/products.json")} target="_blank">
              <ExternalLink className="mr-2 h-4 w-4" />
              Ouvrir products.json
            </Link>
          </Button>
        </CardContent>
      </Card>
    </div>
  );
}
