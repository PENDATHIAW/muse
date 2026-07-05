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
          <CardTitle>Connexion administrateur</CardTitle>
        </CardHeader>
        <CardContent>
          <form action={signIn} className="space-y-4">
            <input type="hidden" name="redirect" value={params.redirect || "/admin"} />
            <div>
              <Label htmlFor="email">Email</Label>
              <Input id="email" name="email" type="email" required autoComplete="email" />
            </div>
            <div>
              <Label htmlFor="password">Mot de passe</Label>
              <Input
                id="password"
                name="password"
                type="password"
                required
                autoComplete="current-password"
              />
            </div>
            {params.error && (
              <p className="text-sm text-destructive">{params.error}</p>
            )}
            <Button type="submit" className="w-full">
              Se connecter
            </Button>
          </form>
        </CardContent>
      </Card>
    </div>
  );
}
