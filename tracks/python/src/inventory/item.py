from dataclasses import dataclass


@dataclass
class InventoryItem:
    sku: str
    name: str
    quantity: int
    reorder_level: int

    @property
    def is_low_stock(self) -> bool:
        return self.quantity <= self.reorder_level

    def reserve(self, quantity: int) -> None:
        if quantity > self.quantity:
            raise ValueError("Insufficient stock")

        self.quantity -= quantity
