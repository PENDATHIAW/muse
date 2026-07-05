import { Badge } from "@/components/ui/badge";
import { Textarea } from "@/components/ui/textarea";
import { Label } from "@/components/ui/label";
import { getAllInquiriesAdmin } from "@/lib/queries";
import { updateInquiryStatus } from "@/lib/actions/admin";
import { INQUIRY_STATUS_LABELS } from "@/lib/utils-muse";

export const dynamic = "force-dynamic";

export default async function AdminInquiriesPage() {
  const inquiries = await getAllInquiriesAdmin();

  return (
    <div>
      <h1 className="text-2xl font-semibold">Demandes clients</h1>
      <p className="text-sm text-muted-foreground">{inquiries.length} demandes</p>

      <div className="mt-6 space-y-6">
        {inquiries.length === 0 ? (
          <p className="text-muted-foreground">Aucune demande pour le moment.</p>
        ) : (
          inquiries.map((inq) => (
            <div key={inq.id} className="rounded-lg border border-border bg-card p-4 sm:p-6">
              <div className="flex flex-wrap items-start justify-between gap-4">
                <div>
                  <h2 className="font-medium">{inq.customer_name}</h2>
                  <p className="text-sm text-muted-foreground">
                    {inq.customer_phone}
                    {inq.customer_email && ` · ${inq.customer_email}`}
                  </p>
                  <p className="mt-1 text-xs text-muted-foreground">
                    {new Date(inq.created_at).toLocaleDateString("fr-FR", {
                      day: "numeric",
                      month: "long",
                      year: "numeric",
                      hour: "2-digit",
                      minute: "2-digit",
                    })}
                  </p>
                </div>
                <Badge variant="outline">
                  {INQUIRY_STATUS_LABELS[inq.status] || inq.status}
                </Badge>
              </div>

              {(inq.product || inq.universe) && (
                <div className="mt-3 flex flex-wrap gap-2 text-sm">
                  {inq.product && (
                    <Badge variant="secondary">Produit : {inq.product.name}</Badge>
                  )}
                  {inq.universe && (
                    <Badge variant="secondary">Univers : {inq.universe.name}</Badge>
                  )}
                </div>
              )}

              <p className="mt-3 whitespace-pre-line text-sm text-muted-foreground">
                {inq.message}
              </p>

              <form
                action={async (formData) => {
                  "use server";
                  await updateInquiryStatus(
                    inq.id,
                    String(formData.get("status")),
                    String(formData.get("admin_note") ?? "")
                  );
                }}
                className="mt-4 grid gap-3 border-t border-border pt-4 sm:grid-cols-2"
              >
                <div>
                  <Label>Statut</Label>
                  <select
                    name="status"
                    defaultValue={inq.status}
                    className="mt-1 flex h-9 w-full rounded-md border border-input bg-transparent px-3 py-1 text-sm"
                  >
                    {Object.entries(INQUIRY_STATUS_LABELS).map(([value, label]) => (
                      <option key={value} value={value}>{label}</option>
                    ))}
                  </select>
                </div>
                <div className="sm:col-span-2">
                  <Label htmlFor={`note-${inq.id}`}>Note interne</Label>
                  <Textarea
                    id={`note-${inq.id}`}
                    name="admin_note"
                    rows={2}
                    defaultValue={inq.admin_note}
                  />
                </div>
                <button
                  type="submit"
                  className="inline-flex h-9 items-center justify-center rounded-md bg-primary px-4 text-sm text-primary-foreground sm:col-span-2 sm:w-fit"
                >
                  Mettre à jour
                </button>
              </form>
            </div>
          ))
        )}
      </div>
    </div>
  );
}
