import Link from "next/link";
import { ExternalLink } from "lucide-react";
import { Button } from "@/components/ui/button";
import { githubEditUrl } from "@/lib/catalog";

interface GithubEditBannerProps {
  filePath: string;
  label?: string;
}

export function GithubEditBanner({ filePath, label }: GithubEditBannerProps) {
  return (
    <div className="mb-6 rounded-lg border border-dashed border-muse-sage/50 bg-muse-beige/30 p-4">
      <p className="text-sm text-muted-foreground">
        <strong>Sans Supabase :</strong> modifiez le contenu directement sur GitHub.
        {label ? ` ${label}` : ""} Push → Vercel redéploie automatiquement.
      </p>
      <Button asChild variant="outline" size="sm" className="mt-3">
        <Link href={githubEditUrl(filePath)} target="_blank" rel="noopener noreferrer">
          <ExternalLink className="mr-2 h-4 w-4" />
          Éditer {filePath} sur GitHub
        </Link>
      </Button>
    </div>
  );
}
