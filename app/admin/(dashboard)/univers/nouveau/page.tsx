import Link from "next/link";
import { ExternalLink } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { GithubEditBanner } from "@/components/admin/github-edit-banner";
import { githubEditUrl } from "@/lib/catalog";

export default function NewUniverseGuidePage() {
  return (
    <div>
      <GithubEditBanner filePath="data/universes.json" />
      <h1 className="text-2xl font-semibold">Ajouter un univers</h1>
      <Card className="mt-6 max-w-2xl">
        <CardHeader>
          <CardTitle>Via GitHub</CardTitle>
        </CardHeader>
        <CardContent className="space-y-4 text-sm text-muted-foreground">
          <p>Ajoutez une entrée dans <code>data/universes.json</code> avec un slug unique.</p>
          <p>Couverture optionnelle : <code>public/univers/[slug]/cover.jpg</code></p>
          <Button asChild>
            <Link href={githubEditUrl("data/universes.json")} target="_blank">
              <ExternalLink className="mr-2 h-4 w-4" />
              Ouvrir universes.json
            </Link>
          </Button>
        </CardContent>
      </Card>
    </div>
  );
}
