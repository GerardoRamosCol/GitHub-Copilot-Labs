using Inventory.Domain;
using Xunit;

namespace Inventory.Domain.Tests;

public sealed class InventoryItemTests
{
    [Fact]
    public void ItemAtReorderLevelIsLowStock()
    {
        var item = new InventoryItem("SKU-001", "Keyboard", 5, 5);

        Assert.True(item.IsLowStock);
    }

    [Fact]
    public void ReserveReducesAvailableQuantity()
    {
        var item = new InventoryItem("SKU-001", "Keyboard", 10, 5);

        item.Reserve(3);

        Assert.Equal(7, item.Quantity);
    }

    [Fact]
    public void ReserveRejectsQuantityAboveAvailableStock()
    {
        var item = new InventoryItem("SKU-001", "Keyboard", 2, 5);

        var exception = Assert.Throws<InvalidOperationException>(() => item.Reserve(3));
        Assert.Equal("Insufficient stock", exception.Message);
    }
}
