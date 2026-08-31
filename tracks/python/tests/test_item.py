import pytest

from inventory import InventoryItem


def test_item_at_reorder_level_is_low_stock() -> None:
    item = InventoryItem("SKU-001", "Keyboard", 5, 5)

    assert item.is_low_stock is True


def test_reserve_reduces_available_quantity() -> None:
    item = InventoryItem("SKU-001", "Keyboard", 10, 5)

    item.reserve(3)

    assert item.quantity == 7


def test_reserve_rejects_quantity_above_available_stock() -> None:
    item = InventoryItem("SKU-001", "Keyboard", 2, 5)

    with pytest.raises(ValueError, match="Insufficient stock"):
        item.reserve(3)
