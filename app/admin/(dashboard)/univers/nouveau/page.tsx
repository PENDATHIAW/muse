import Link from "next/link";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Textarea } from "@/components/ui/textarea";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { createUniverse } from "@/lib/actions/admin";

export default function NewUniversePage() {
  return (
    <div>
      <h1 className="text-2xl font-semibold">Nouvel univers</h1>
      <Card className="mt-6 max-w-2xl">
        <CardHeader>
          <CardTitle>Informations</CardTitle>
        </CardHeader>
        <CardContent>
          <form action={createUniverse} className="space-y-4">
            <div>
              <Label htmlFor="name">Nom *</Label>
              <Input id="name" name="name" required />
            </div>
            <div>
              <Label htmlFor="description">Description</Label>
              <Textarea id="description" name="description" rows={4} />
            </div>
            <div>
              <Label htmlFor="cover_image_url">Image de couverture (chemin GitHub)</Label>
              <Input
                id="cover_image_url"
                name="cover_image_url"
                placeholder="/univers/muse-kitchen/cover.jpg"
              />
              <p className="mt-1 text-xs text-muted-foreground">
                Fichier dans public/univers/… puis push GitHub
              </p>
            </div>
            <div>
              <Label htmlFor="display_order">Ordre d&apos;affichage</Label>
              <Input id="display_order" name="display_order" type="number" defaultValue={0} />
            </div>
            <div className="flex items-center gap-2">
              <input type="checkbox" id="is_active" name="is_active" defaultChecked className="h-4 w-4 rounded border-input" />
              <Label htmlFor="is_active">Univers actif</Label>
            </div>
            <div className="flex gap-3">
              <Button type="submit">Créer</Button>
              <Button asChild variant="outline">
                <Link href="/admin/univers">Annuler</Link>
              </Button>
            </div>
          </form>
        </CardContent>
      </Card>
    </div>
  );
}
