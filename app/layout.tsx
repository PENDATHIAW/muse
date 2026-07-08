import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "MUSE — Boutique déco 3D",
  description:
    "Catalogue MUSE : objets décoratifs, rangements et accessoires personnalisables en impression 3D.",
  openGraph: {
    title: "MUSE — Boutique déco 3D",
    description: "Objets déco imprimés en 3D, personnalisables et prêts à commander.",
    type: "website",
    locale: "fr_FR",
    siteName: "MUSE",
  },
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="fr">
      <body>{children}</body>
    </html>
  );
}
