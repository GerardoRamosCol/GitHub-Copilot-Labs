namespace Inventory.Domain;

public sealed class InventoryItem(
    string sku,
    string name,
    int quantity,
    int reorderLevel)
{
    public string Sku { get; } = sku;
    public string Name { get; } = name;
    public int Quantity { get; private set; } = quantity;
    public int ReorderLevel { get; } = reorderLevel;
    public bool IsLowStock => Quantity <= ReorderLevel;

    public void Reserve(int quantity)
    {
        if (quantity > Quantity)
        {
            throw new InvalidOperationException("Insufficient stock");
        }

        Quantity -= quantity;
    }
}
