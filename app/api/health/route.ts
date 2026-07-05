import { NextResponse } from "next/server";
import { isSupabaseConfigured } from "@/lib/supabase/config";

export const dynamic = "force-dynamic";

export async function GET() {
  const checks = {
    ok: true,
    supabaseConfigured: isSupabaseConfigured(),
    siteUrl: process.env.NEXT_PUBLIC_SITE_URL ?? null,
    timestamp: new Date().toISOString(),
  };

  return NextResponse.json(checks, {
    status: checks.ok ? 200 : 503,
    headers: { "cache-control": "no-store" },
  });
}
