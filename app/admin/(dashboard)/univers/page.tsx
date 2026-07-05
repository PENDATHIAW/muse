import Link from "next/link";
import { ExternalLink } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table";
import { GithubEditBanner } from "@/components/admin/github-edit-banner";
import { getAllUniversesAdmin, githubEditUrl } from "@/lib/catalog";

export default function AdminUniversPage() {
  const universes = getAllUniversesAdmin();

  return (
    <div>
      <GithubEditBanner filePath="data/universes.json" />

      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-semibold">Univers</h1>
          <p className="text-sm text-muted-foreground">{universes.length} univers</p>
        </div>
        <Button asChild>
          <Link href={githubEditUrl("data/universes.json")} target="_blank">
            <ExternalLink className="mr-2 h-4 w-4" />
            Modifier sur GitHub
          </Link>
        </Button>
      </div>

      <div className="mt-6 rounded-lg border border-border">
        <Table>
          <TableHeader>
            <TableRow>
              <TableHead>Nom</TableHead>
              <TableHead>Slug</TableHead>
              <TableHead>Ordre</TableHead>
              <TableHead>Statut</TableHead>
            </TableRow>
          </TableHeader>
          <TableBody>
            {universes.map((u) => (
              <TableRow key={u.id}>
                <TableCell className="font-medium">{u.name}</TableCell>
                <TableCell className="text-muted-foreground">{u.slug}</TableCell>
                <TableCell>{u.display_order}</TableCell>
                <TableCell>
                  <Badge variant={u.is_active ? "default" : "secondary"}>
                    {u.is_active ? "Actif" : "Inactif"}
                  </Badge>
                </TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </div>
    </div>
  );
}
