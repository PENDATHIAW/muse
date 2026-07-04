"use client";

import { createContext, useContext, useEffect, useState } from "react";
import { toast } from "sonner";
import type { Product } from "@/types/database";

interface SelectionContextType {
  items: Pick<Product, "id" | "name" | "slug" | "price">[];
  addItem: (product: Product) => void;
  removeItem: (id: string) => void;
  clear: () => void;
}

const SelectionContext = createContext<SelectionContextType | null>(null);
const STORAGE_KEY = "muse-selection";

export function SelectionProvider({ children }: { children: React.ReactNode }) {
  const [items, setItems] = useState<Pick<Product, "id" | "name" | "slug" | "price">[]>([]);

  useEffect(() => {
    try {
      const stored = localStorage.getItem(STORAGE_KEY);
      if (stored) setItems(JSON.parse(stored));
    } catch {
      // ignore
    }
  }, []);

  useEffect(() => {
    localStorage.setItem(STORAGE_KEY, JSON.stringify(items));
  }, [items]);

  function addItem(product: Product) {
    setItems((prev) => {
      if (prev.some((p) => p.id === product.id)) {
        toast.info("Cet objet est déjà dans votre sélection.");
        return prev;
      }
      toast.success(`${product.name} ajouté à votre sélection.`);
      return [...prev, { id: product.id, name: product.name, slug: product.slug, price: product.price }];
    });
  }

  function removeItem(id: string) {
    setItems((prev) => prev.filter((p) => p.id !== id));
  }

  function clear() {
    setItems([]);
  }

  return (
    <SelectionContext.Provider value={{ items, addItem, removeItem, clear }}>
      {children}
    </SelectionContext.Provider>
  );
}

export function useSelection() {
  const ctx = useContext(SelectionContext);
  if (!ctx) throw new Error("useSelection must be used within SelectionProvider");
  return ctx;
}
