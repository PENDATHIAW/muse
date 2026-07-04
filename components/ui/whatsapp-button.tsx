import Link from "next/link";
import { MessageCircle } from "lucide-react";
import { Button } from "@/components/ui/button";
import { buildWhatsAppUrl } from "@/lib/utils-muse";

interface WhatsAppButtonProps {
  phone: string;
  message: string;
  label?: string;
  variant?: "default" | "outline" | "secondary";
  className?: string;
}

export function WhatsAppButton({
  phone,
  message,
  label = "WhatsApp",
  variant = "outline",
  className,
}: WhatsAppButtonProps) {
  const url = buildWhatsAppUrl(phone, message);

  return (
    <Button asChild variant={variant} className={className}>
      <Link href={url} target="_blank" rel="noopener noreferrer">
        <MessageCircle className="mr-2 h-4 w-4" />
        {label}
      </Link>
    </Button>
  );
}
