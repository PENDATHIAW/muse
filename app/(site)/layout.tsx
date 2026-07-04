import { SiteHeader } from "@/components/layout/site-header";
import { SiteFooter } from "@/components/layout/site-footer";
import { SelectionProvider } from "@/components/selection/selection-provider";
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
    <SelectionProvider>
      <SiteHeader universes={universes} />
      <main className="flex-1">{children}</main>
      <SiteFooter settings={settings} />
    </SelectionProvider>
  );
}
