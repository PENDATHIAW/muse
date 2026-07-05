import type { Metadata } from "next";
import { Geist, Geist_Mono, Playfair_Display } from "next/font/google";
import { ToasterRoot } from "@/components/toaster-root";
import "./globals.css";

const geistSans = Geist({
  variable: "--font-geist-sans",
  subsets: ["latin"],
});

const geistMono = Geist_Mono({
  variable: "--font-geist-mono",
  subsets: ["latin"],
});

const playfair = Playfair_Display({
  variable: "--font-serif",
  subsets: ["latin"],
});

export const metadata: Metadata = {
  title: {
    default: "MUSE — Objets personnalisables en impression 3D",
    template: "%s | MUSE",
  },
  description:
    "Des objets utiles, beaux et personnalisables. Catalogue premium MUSE — impression 3D, personnalisation, artisanat moderne.",
  openGraph: {
    title: "MUSE — Objets personnalisables en impression 3D",
    description: "Des objets utiles, beaux et personnalisables.",
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
    <html
      lang="fr"
      className={`${geistSans.variable} ${geistMono.variable} ${playfair.variable} h-full`}
    >
      <body className="min-h-full flex flex-col font-sans">
        {children}
        <ToasterRoot />
      </body>
    </html>
  );
}
