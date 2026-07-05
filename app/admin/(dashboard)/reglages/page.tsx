import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Textarea } from "@/components/ui/textarea";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { getSettings } from "@/lib/queries";
import { updateSettings } from "@/lib/actions/admin";

export const dynamic = "force-dynamic";

export default async function AdminSettingsPage() {
  const settings = await getSettings();

  return (
    <div>
      <h1 className="text-2xl font-semibold">Réglages</h1>
      <p className="text-sm text-muted-foreground">
        Modifiez le contenu du site et les informations de contact.
      </p>

      <form action={updateSettings} className="mt-6 space-y-6 max-w-3xl">
        <Card>
          <CardHeader>
            <CardTitle>Page d&apos;accueil</CardTitle>
          </CardHeader>
          <CardContent className="space-y-4">
            <div>
              <Label htmlFor="hero_title">Titre principal</Label>
              <Input id="hero_title" name="hero_title" defaultValue={settings.hero_title} />
            </div>
            <div>
              <Label htmlFor="hero_subtitle">Sous-titre</Label>
              <Textarea id="hero_subtitle" name="hero_subtitle" rows={2} defaultValue={settings.hero_subtitle} />
            </div>
            <div>
              <Label htmlFor="hero_tagline">Accroche</Label>
              <Input id="hero_tagline" name="hero_tagline" defaultValue={settings.hero_tagline} />
            </div>
            <div>
              <Label htmlFor="why_muse">Section « Pourquoi MUSE »</Label>
              <Textarea id="why_muse" name="why_muse" rows={3} defaultValue={settings.why_muse} />
            </div>
            <div>
              <Label htmlFor="personalization_intro">Section personnalisation</Label>
              <Textarea id="personalization_intro" name="personalization_intro" rows={3} defaultValue={settings.personalization_intro} />
            </div>
            <div>
              <Label htmlFor="order_intro">Section commande</Label>
              <Textarea id="order_intro" name="order_intro" rows={2} defaultValue={settings.order_intro} />
            </div>
          </CardContent>
        </Card>

        <Card>
          <CardHeader>
            <CardTitle>À propos</CardTitle>
          </CardHeader>
          <CardContent>
            <Label htmlFor="about_content">Contenu</Label>
            <Textarea id="about_content" name="about_content" rows={6} defaultValue={settings.about_content} />
          </CardContent>
        </Card>

        <Card>
          <CardHeader>
            <CardTitle>Contact & réseaux</CardTitle>
          </CardHeader>
          <CardContent className="space-y-4">
            <div>
              <Label htmlFor="whatsapp_number">Numéro WhatsApp</Label>
              <Input id="whatsapp_number" name="whatsapp_number" defaultValue={settings.whatsapp_number} placeholder="221771234567" />
            </div>
            <div>
              <Label htmlFor="whatsapp_default_message">Message WhatsApp par défaut</Label>
              <Textarea id="whatsapp_default_message" name="whatsapp_default_message" rows={2} defaultValue={settings.whatsapp_default_message} />
            </div>
            <div>
              <Label htmlFor="whatsapp_url">Lien WhatsApp</Label>
              <Input id="whatsapp_url" name="whatsapp_url" defaultValue={settings.whatsapp_url} />
            </div>
            <div>
              <Label htmlFor="contact_email">Email de contact</Label>
              <Input id="contact_email" name="contact_email" type="email" defaultValue={settings.contact_email} />
            </div>
            <div>
              <Label htmlFor="instagram_url">Instagram</Label>
              <Input id="instagram_url" name="instagram_url" defaultValue={settings.instagram_url} />
            </div>
            <div>
              <Label htmlFor="tiktok_url">TikTok</Label>
              <Input id="tiktok_url" name="tiktok_url" defaultValue={settings.tiktok_url} />
            </div>
          </CardContent>
        </Card>

        <Button type="submit">Enregistrer les réglages</Button>
      </form>
    </div>
  );
}
