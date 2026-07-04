"use client";

import { useRouter, useSearchParams } from "next/navigation";
import { Search } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import type { Universe } from "@/types/database";

interface ProductFiltersProps {
  universes: Universe[];
  colors: string[];
  finishes: string[];
}

export function ProductFiltersBar({
  universes,
  colors,
  finishes,
}: ProductFiltersProps) {
  const router = useRouter();
  const searchParams = useSearchParams();

  function updateParam(key: string, value: string) {
    const params = new URLSearchParams(searchParams.toString());
    if (value && value !== "all") {
      params.set(key, value);
    } else {
      params.delete(key);
    }
    router.push(`/catalogue?${params.toString()}`);
  }

  function handleSearch(e: React.FormEvent<HTMLFormElement>) {
    e.preventDefault();
    const formData = new FormData(e.currentTarget);
    updateParam("search", String(formData.get("search") ?? ""));
  }

  return (
    <div className="rounded-2xl border border-border bg-card p-4 sm:p-6">
      <form onSubmit={handleSearch} className="mb-4 flex gap-2">
        <div className="relative flex-1">
          <Search className="absolute left-3 top-1/2 h-4 w-4 -translate-y-1/2 text-muted-foreground" />
          <Input
            name="search"
            defaultValue={searchParams.get("search") ?? ""}
            placeholder="Rechercher un objet..."
            className="pl-9"
          />
        </div>
        <Button type="submit">Rechercher</Button>
      </form>

      <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-5">
        <div>
          <Label className="mb-1.5 block text-xs">Univers</Label>
          <Select
            value={searchParams.get("universe") ?? "all"}
            onValueChange={(v) => updateParam("universe", v)}
          >
            <SelectTrigger><SelectValue placeholder="Tous" /></SelectTrigger>
            <SelectContent>
              <SelectItem value="all">Tous les univers</SelectItem>
              {universes.map((u) => (
                <SelectItem key={u.id} value={u.slug}>{u.name}</SelectItem>
              ))}
            </SelectContent>
          </Select>
        </div>

        <div>
          <Label className="mb-1.5 block text-xs">Prix min (FCFA)</Label>
          <Input
            type="number"
            defaultValue={searchParams.get("minPrice") ?? ""}
            onBlur={(e) => updateParam("minPrice", e.target.value)}
            placeholder="0"
          />
        </div>

        <div>
          <Label className="mb-1.5 block text-xs">Prix max (FCFA)</Label>
          <Input
            type="number"
            defaultValue={searchParams.get("maxPrice") ?? ""}
            onBlur={(e) => updateParam("maxPrice", e.target.value)}
            placeholder="50000"
          />
        </div>

        <div>
          <Label className="mb-1.5 block text-xs">Couleur</Label>
          <Select
            value={searchParams.get("color") ?? "all"}
            onValueChange={(v) => updateParam("color", v)}
          >
            <SelectTrigger><SelectValue placeholder="Toutes" /></SelectTrigger>
            <SelectContent>
              <SelectItem value="all">Toutes</SelectItem>
              {colors.map((c) => (
                <SelectItem key={c} value={c}>{c}</SelectItem>
              ))}
            </SelectContent>
          </Select>
        </div>

        <div>
          <Label className="mb-1.5 block text-xs">Finition</Label>
          <Select
            value={searchParams.get("finish") ?? "all"}
            onValueChange={(v) => updateParam("finish", v)}
          >
            <SelectTrigger><SelectValue placeholder="Toutes" /></SelectTrigger>
            <SelectContent>
              <SelectItem value="all">Toutes</SelectItem>
              {finishes.map((f) => (
                <SelectItem key={f} value={f}>{f}</SelectItem>
              ))}
            </SelectContent>
          </Select>
        </div>
      </div>

      <div className="mt-4 flex flex-wrap items-center gap-3">
        <Label className="text-xs">Trier par :</Label>
        <Select
          value={searchParams.get("sort") ?? "newest"}
          onValueChange={(v) => updateParam("sort", v)}
        >
          <SelectTrigger className="w-48"><SelectValue /></SelectTrigger>
          <SelectContent>
            <SelectItem value="newest">Nouveauté</SelectItem>
            <SelectItem value="price_asc">Prix croissant</SelectItem>
            <SelectItem value="price_desc">Prix décroissant</SelectItem>
            <SelectItem value="popular">Populaire</SelectItem>
          </SelectContent>
        </Select>
      </div>
    </div>
  );
}
