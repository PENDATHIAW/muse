"use server";

import { redirect } from "next/navigation";
import { createInquiry } from "@/lib/actions/admin";

export async function submitInquiry(formData: FormData) {
  const returnTo = String(formData.get("returnTo") ?? "/contact").trim() || "/contact";
  const result = await createInquiry(formData);

  if (result?.error) {
    const separator = returnTo.includes("?") ? "&" : "?";
    redirect(`${returnTo}${separator}error=${encodeURIComponent(result.error)}`);
  }

  const separator = returnTo.includes("?") ? "&" : "?";
  redirect(`${returnTo}${separator}sent=1`);
}
