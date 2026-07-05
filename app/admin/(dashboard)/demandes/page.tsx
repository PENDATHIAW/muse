import Link from "next/link";
import { MessageCircle } from "lucide-react";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { getSettings } from "@/lib/catalog";
import { buildWhatsAppUrl } from "@/lib/utils-muse";

export default function AdminInquiriesPage() {
  const settings = getSettings();
  const whatsappUrl = buildWhatsAppUrl(
    settings.whatsapp_number || "221771234567",
    settings.whatsapp_default_message || "Bonjour MUSE"
  );

  return (
    <div>
      <h1 className="text-2xl font-semibold">Demandes clients</h1>
      <Card className="mt-6 max-w-2xl">
        <CardHeader>
          <CardTitle>Sans base de données</CardTitle>
        </CardHeader>
        <CardContent className="space-y-4 text-sm text-muted-foreground">
          <p>
            Les demandes arrivent directement via <strong>WhatsApp</strong> et le
            formulaire de contact (sans stockage en base).
          </p>
          <p>
            Le client remplit le formulaire puis vous contacte sur WhatsApp avec un
            message prérempli.
          </p>
          <Button asChild>
            <Link href={whatsappUrl} target="_blank">
              <MessageCircle className="mr-2 h-4 w-4" />
              Ouvrir WhatsApp MUSE
            </Link>
          </Button>
        </CardContent>
      </Card>
    </div>
  );
}
