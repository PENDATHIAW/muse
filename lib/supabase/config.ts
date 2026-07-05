export function isSupabaseConfigured(): boolean {
  const url = process.env.NEXT_PUBLIC_SUPABASE_URL?.trim();
  const key = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY?.trim();

  if (!url || !key) return false;

  // Ignore placeholder values from .env.example
  if (url.includes("votre-projet") || key === "eyJ...") return false;

  // Basic sanity check — avoids hanging on malformed URLs
  try {
    const parsed = new URL(url);
    if (!parsed.hostname.endsWith(".supabase.co")) return false;
  } catch {
    return false;
  }

  return key.startsWith("eyJ");
}
