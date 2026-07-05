"use client";

import { createContext, useContext, useSyncExternalStore } from "react";
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

type SelectionItem = Pick<Product, "id" | "name" | "slug" | "price">;

let listeners: Array<() => void> = [];

function subscribe(callback: () => void) {
  listeners.push(callback);
  return () => {
    listeners = listeners.filter((listener) => listener !== callback);
  };
}

function emitChange() {
  listeners.forEach((listener) => listener());
}

function readStoredItems(): SelectionItem[] {
  if (typeof window === "undefined") return [];
  try {
    const stored = localStorage.getItem(STORAGE_KEY);
    return stored ? (JSON.parse(stored) as SelectionItem[]) : [];
  } catch {
    return [];
  }
}

function getSnapshot() {
  return readStoredItems();
}

function getServerSnapshot() {
  return [] as SelectionItem[];
}

function persist(next: SelectionItem[]) {
  localStorage.setItem(STORAGE_KEY, JSON.stringify(next));
  emitChange();
}

export function SelectionProvider({ children }: { children: React.ReactNode }) {
  const items = useSyncExternalStore(subscribe, getSnapshot, getServerSnapshot);

  function addItem(product: Product) {
    if (items.some((p) => p.id === product.id)) {
      toast.info("Cet objet est déjà dans votre sélection.");
      return;
    }
    toast.success(`${product.name} ajouté à votre sélection.`);
    persist([
      ...items,
      { id: product.id, name: product.name, slug: product.slug, price: product.price },
    ]);
  }

  function removeItem(id: string) {
    persist(items.filter((p) => p.id !== id));
  }

  function clear() {
    persist([]);
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
