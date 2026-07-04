import { AdminSidebar } from "@/components/admin/admin-sidebar";

export default function AdminDashboardLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <div className="flex min-h-screen bg-background">
      <AdminSidebar />
      <div className="flex-1 overflow-auto">
        <div className="border-b border-border bg-card px-6 py-4 lg:hidden">
          <p className="text-sm font-medium">MUSE Admin</p>
        </div>
        <div className="p-6 lg:p-8">{children}</div>
      </div>
    </div>
  );
}
