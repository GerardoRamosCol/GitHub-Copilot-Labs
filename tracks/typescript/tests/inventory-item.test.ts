import { describe, expect, it } from "vitest";

import { InventoryItem } from "../src/inventory-item.js";

describe("InventoryItem", () => {
  it("is low stock when quantity equals the reorder level", () => {
    const item = new InventoryItem("SKU-001", "Keyboard", 5, 5);

    expect(item.isLowStock).toBe(true);
  });

  it("reduces available quantity when stock is reserved", () => {
    const item = new InventoryItem("SKU-001", "Keyboard", 10, 5);

    item.reserve(3);

    expect(item.quantity).toBe(7);
  });

  it("rejects a reservation above available stock", () => {
    const item = new InventoryItem("SKU-001", "Keyboard", 2, 5);

    expect(() => item.reserve(3)).toThrow("Insufficient stock");
  });
});
