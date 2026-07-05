import { SiteHeader } from "@/components/layout/site-header";
import { SiteFooter } from "@/components/layout/site-footer";
import { getActiveUniverses, getSettings } from "@/lib/queries";

export default async function SiteLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  const [universes, settings] = await Promise.all([
    getActiveUniverses(),
    getSettings(),
  ]);

  return (
    <>
      <SiteHeader universes={universes} />
      <main className="flex-1">{children}</main>
      <SiteFooter settings={settings} />
    </>
  );
}
