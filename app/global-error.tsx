"use client";

export default function GlobalError({
  reset,
}: {
  error: Error & { digest?: string };
  reset: () => void;
}) {
  return (
    <html lang="fr">
      <body
        style={{
          minHeight: "100vh",
          margin: 0,
          display: "flex",
          flexDirection: "column",
          alignItems: "center",
          justifyContent: "center",
          padding: "24px",
          textAlign: "center",
          background: "#faf8f5",
          fontFamily: "system-ui, sans-serif",
        }}
      >
        <p style={{ letterSpacing: "0.3em", fontSize: 12, color: "#8b7355" }}>MUSE</p>
        <h1 style={{ marginTop: 16, fontSize: 28, color: "#2c2c2c" }}>
          Le site a rencontré un problème
        </h1>
        <p style={{ marginTop: 12, maxWidth: 420, fontSize: 14, color: "#666" }}>
          Rechargez la page. Si le problème continue, ouvrez le site en navigation
          privée ou vérifiez le redeploy Vercel après les variables Supabase.
        </p>
        <div style={{ marginTop: 32, display: "flex", gap: 12 }}>
          <button
            type="button"
            onClick={() => reset()}
            style={{
              padding: "10px 20px",
              borderRadius: 8,
              border: "none",
              background: "#2c2c2c",
              color: "#fff",
              cursor: "pointer",
            }}
          >
            Recharger
          </button>
          <a
            href="/"
            style={{
              padding: "10px 20px",
              borderRadius: 8,
              border: "1px solid #ccc",
              color: "#2c2c2c",
              textDecoration: "none",
            }}
          >
            Accueil
          </a>
        </div>
      </body>
    </html>
  );
}
