import Link from "next/link";
import { notFound } from "next/navigation";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Textarea } from "@/components/ui/textarea";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { getUniverseByIdAdmin } from "@/lib/queries";
import { updateUniverse } from "@/lib/actions/admin";

export const dynamic = "force-dynamic";

interface EditUniversePageProps {
  params: Promise<{ id: string }>;
}

export default async function EditUniversePage({ params }: EditUniversePageProps) {
  const { id } = await params;
  const universe = await getUniverseByIdAdmin(id);
  if (!universe) notFound();

  const updateAction = updateUniverse.bind(null, id);

  return (
    <div>
      <h1 className="text-2xl font-semibold">Modifier l&apos;univers</h1>
      <Card className="mt-6 max-w-2xl">
        <CardHeader>
          <CardTitle>{universe.name}</CardTitle>
        </CardHeader>
        <CardContent>
          <form action={updateAction} className="space-y-4">
            <div>
              <Label htmlFor="name">Nom *</Label>
              <Input id="name" name="name" defaultValue={universe.name} required />
            </div>
            <div>
              <Label htmlFor="slug">Slug</Label>
              <Input id="slug" name="slug" defaultValue={universe.slug} />
            </div>
            <div>
              <Label htmlFor="description">Description</Label>
              <Textarea id="description" name="description" rows={4} defaultValue={universe.description} />
            </div>
            <div>
              <Label htmlFor="cover_image_url">Image de couverture (chemin GitHub)</Label>
              <Input
                id="cover_image_url"
                name="cover_image_url"
                placeholder="/univers/muse-kitchen/cover.jpg"
                defaultValue={universe.cover_image_url ?? ""}
              />
              <p className="mt-1 text-xs text-muted-foreground">
                Ex. <code>/univers/{universe.slug}/cover.jpg</code> — fichier dans public/
              </p>
            </div>
            <div>
              <Label htmlFor="display_order">Ordre d&apos;affichage</Label>
              <Input id="display_order" name="display_order" type="number" defaultValue={universe.display_order} />
            </div>
            <div className="flex items-center gap-2">
              <input
                type="checkbox"
                id="is_active"
                name="is_active"
                defaultChecked={universe.is_active}
                className="h-4 w-4 rounded border-input"
              />
              <Label htmlFor="is_active">Univers actif</Label>
            </div>
            <div className="flex gap-3">
              <Button type="submit">Enregistrer</Button>
              <Button asChild variant="outline">
                <Link href="/admin/univers">Retour</Link>
              </Button>
            </div>
          </form>
        </CardContent>
      </Card>
    </div>
  );
}
