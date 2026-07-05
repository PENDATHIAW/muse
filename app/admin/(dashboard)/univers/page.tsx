import Link from "next/link";
import { Plus, Pencil, Trash2 } from "lucide-react";
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
import { getAllUniversesAdmin } from "@/lib/queries";
import { deleteUniverse } from "@/lib/actions/admin";

export const dynamic = "force-dynamic";

export default async function AdminUniversPage() {
  const universes = await getAllUniversesAdmin();

  return (
    <div>
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-semibold">Univers</h1>
          <p className="text-sm text-muted-foreground">{universes.length} univers</p>
        </div>
        <Button asChild>
          <Link href="/admin/univers/nouveau">
            <Plus className="mr-2 h-4 w-4" />
            Ajouter
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
              <TableHead className="text-right">Actions</TableHead>
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
                <TableCell className="text-right">
                  <div className="flex justify-end gap-2">
                    <Button asChild variant="outline" size="sm">
                      <Link href={`/admin/univers/${u.id}/edit`}>
                        <Pencil className="h-3 w-3" />
                      </Link>
                    </Button>
                    <form action={async () => { "use server"; await deleteUniverse(u.id); }}>
                      <Button type="submit" variant="destructive" size="sm">
                        <Trash2 className="h-3 w-3" />
                      </Button>
                    </form>
                  </div>
                </TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </div>
    </div>
  );
}
