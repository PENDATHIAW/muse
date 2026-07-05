import Link from "next/link";
import { ExternalLink } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { GithubEditBanner } from "@/components/admin/github-edit-banner";
import { getSettings, githubEditUrl } from "@/lib/catalog";

export default function AdminSettingsPage() {
  const settings = getSettings();

  return (
    <div>
      <GithubEditBanner filePath="data/settings.json" />

      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-semibold">Réglages</h1>
          <p className="text-sm text-muted-foreground">Contenu éditable sur GitHub</p>
        </div>
        <Button asChild>
          <Link href={githubEditUrl("data/settings.json")} target="_blank">
            <ExternalLink className="mr-2 h-4 w-4" />
            Modifier sur GitHub
          </Link>
        </Button>
      </div>

      <div className="mt-6 grid gap-4 md:grid-cols-2">
        {Object.entries(settings).map(([key, value]) => (
          <Card key={key}>
            <CardHeader className="pb-2">
              <CardTitle className="text-xs font-mono text-muted-foreground">{key}</CardTitle>
            </CardHeader>
            <CardContent>
              <p className="text-sm">{value}</p>
            </CardContent>
          </Card>
        ))}
      </div>
    </div>
  );
}
