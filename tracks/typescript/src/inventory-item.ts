export class InventoryItem {
  public constructor(
    public readonly sku: string,
    public readonly name: string,
    public quantity: number,
    public readonly reorderLevel: number,
  ) {}

  public get isLowStock(): boolean {
    return this.quantity <= this.reorderLevel;
  }

  public reserve(quantity: number): void {
    if (quantity > this.quantity) {
      throw new Error("Insufficient stock");
    }

    this.quantity -= quantity;
  }
}
