import { MuseLogo } from "@/components/logo";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { signIn } from "@/lib/actions/auth";

interface AdminLoginPageProps {
  searchParams: Promise<{ redirect?: string; error?: string }>;
}

export default async function AdminLoginPage({ searchParams }: AdminLoginPageProps) {
  const params = await searchParams;

  return (
    <div className="flex min-h-screen items-center justify-center bg-muse-beige/30 p-4">
      <Card className="w-full max-w-md">
        <CardHeader className="text-center">
          <div className="mb-4 flex justify-center">
            <MuseLogo size="md" href="/" />
          </div>
          <CardTitle>Administration MUSE</CardTitle>
          <p className="text-sm text-muted-foreground">
            Consultation du catalogue · modifications via GitHub
          </p>
        </CardHeader>
        <CardContent>
          <form action={signIn} className="space-y-4">
            <input type="hidden" name="redirect" value={params.redirect || "/admin"} />
            <div>
              <Label htmlFor="password">Mot de passe admin</Label>
              <Input
                id="password"
                name="password"
                type="password"
                required
                autoComplete="current-password"
                placeholder="Mot de passe"
              />
            </div>
            {params.error && (
              <p className="text-sm text-destructive">{params.error}</p>
            )}
            <Button type="submit" className="w-full">
              Se connecter
            </Button>
          </form>
          <p className="mt-4 text-center text-xs text-muted-foreground">
            Mot de passe par défaut en local : <code>muse2026</code>
            <br />
            Sur Vercel : variable <code>ADMIN_PASSWORD</code>
          </p>
        </CardContent>
      </Card>
    </div>
  );
}
