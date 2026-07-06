import { GITHUB_BRANCH, GITHUB_REPO } from "@/lib/catalog";
import type { CatalogProduct } from "@/lib/scan-public-products";

const API_BASE = "https://api.github.com";

type GitHubFile = {
  sha: string;
  content: string;
};

async function getFileFromGitHub(
  token: string,
  filePath: string
): Promise<{ sha: string; data: unknown } | null> {
  const res = await fetch(
    `${API_BASE}/repos/${GITHUB_REPO}/contents/${filePath}?ref=${GITHUB_BRANCH}`,
    {
      headers: {
        Authorization: `Bearer ${token}`,
        Accept: "application/vnd.github+json",
        "X-GitHub-Api-Version": "2022-11-28",
      },
      cache: "no-store",
    }
  );

  if (res.status === 404) return null;
  if (!res.ok) {
    const body = await res.text();
    throw new Error(`GitHub lecture ${filePath} : ${res.status} ${body}`);
  }

  const file = (await res.json()) as GitHubFile;
  const decoded = Buffer.from(file.content, "base64").toString("utf8");
  return { sha: file.sha, data: JSON.parse(decoded) };
}

async function putFileToGitHub(
  token: string,
  filePath: string,
  content: unknown,
  sha: string | null,
  message: string
) {
  const body = JSON.stringify(content, null, 2) + "\n";
  const res = await fetch(`${API_BASE}/repos/${GITHUB_REPO}/contents/${filePath}`, {
    method: "PUT",
    headers: {
      Authorization: `Bearer ${token}`,
      Accept: "application/vnd.github+json",
      "Content-Type": "application/json",
      "X-GitHub-Api-Version": "2022-11-28",
    },
    body: JSON.stringify({
      message,
      content: Buffer.from(body).toString("base64"),
      branch: GITHUB_BRANCH,
      ...(sha ? { sha } : {}),
    }),
  });

  if (!res.ok) {
    const text = await res.text();
    throw new Error(`GitHub écriture ${filePath} : ${res.status} ${text}`);
  }
}

export async function commitCatalogUpdates(options: {
  newProducts: CatalogProduct[];
  photoMapUpdates: Record<string, string>;
}) {
  const token = process.env.GITHUB_TOKEN ?? process.env.GH_TOKEN;
  if (!token) {
    throw new Error(
      "GITHUB_TOKEN manquant sur Vercel. Ajoutez un token GitHub (scope repo) dans les variables d'environnement pour enregistrer le catalogue depuis l'admin."
    );
  }

  const productsFile = await getFileFromGitHub(token, "data/products.json");
  if (!productsFile) throw new Error("data/products.json introuvable sur GitHub.");

  const existingProducts = productsFile.data as CatalogProduct[];
  const existingPaths = new Set(
    existingProducts.flatMap((p) => p.images?.map((i) => i.image_url) ?? [])
  );

  const toAdd = options.newProducts.filter(
    (p) => !existingPaths.has(p.images[0]?.image_url)
  );
  if (toAdd.length === 0) return { added: 0, committed: false };

  const mergedProducts = [...existingProducts, ...toAdd];

  const mapFile = await getFileFromGitHub(token, "data/photo-universe-map.json");
  const photoMap = (mapFile?.data ?? {}) as Record<string, string>;
  const mergedMap = { ...photoMap, ...options.photoMapUpdates };

  const message = `catalogue: ajout ${toAdd.length} produit(s) depuis admin MUSE`;

  await putFileToGitHub(
    token,
    "data/products.json",
    mergedProducts,
    productsFile.sha,
    message
  );

  if (mapFile) {
    await putFileToGitHub(
      token,
      "data/photo-universe-map.json",
      mergedMap,
      mapFile.sha,
      message
    );
  }

  return { added: toAdd.length, committed: true };
}
