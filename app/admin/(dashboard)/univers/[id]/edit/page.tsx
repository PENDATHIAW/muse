import Link from "next/link";
import { notFound } from "next/navigation";
import { ExternalLink } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { GithubEditBanner } from "@/components/admin/github-edit-banner";
import { getUniverseByIdAdmin, githubEditUrl } from "@/lib/catalog";

interface UniverseDetailProps {
  params: Promise<{ id: string }>;
}

export default async function AdminUniverseDetailPage({ params }: UniverseDetailProps) {
  const { id } = await params;
  const universe = getUniverseByIdAdmin(id);
  if (!universe) notFound();

  return (
    <div>
      <GithubEditBanner filePath="data/universes.json" />
      <h1 className="text-2xl font-semibold">{universe.name}</h1>
      <Card className="mt-6 max-w-xl">
        <CardHeader>
          <CardTitle>Détails</CardTitle>
        </CardHeader>
        <CardContent className="space-y-2 text-sm">
          <p><strong>Slug :</strong> {universe.slug}</p>
          <p><strong>Description :</strong> {universe.description}</p>
          <p><strong>Couverture :</strong> {universe.cover_image_url ?? "—"}</p>
          <Badge variant={universe.is_active ? "default" : "secondary"}>
            {universe.is_active ? "Actif" : "Inactif"}
          </Badge>
          <Button asChild className="mt-4">
            <Link href={githubEditUrl("data/universes.json")} target="_blank">
              <ExternalLink className="mr-2 h-4 w-4" />
              Modifier sur GitHub
            </Link>
          </Button>
        </CardContent>
      </Card>
    </div>
  );
}
