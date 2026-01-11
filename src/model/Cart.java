package model;

import java.util.ArrayList;

public class Cart {
    private ArrayList<CartItem> items = new ArrayList<>();

    public void addItem(Product p, int qty) {
        for (CartItem item : items) {
            if (item.getProduct().getProductID().equals(p.getProductID())) {
                item.setQuantity(item.getQuantity() + qty);
                return;
            }
        }
        items.add(new CartItem(p, qty));
    }

    public ArrayList<CartItem> getItems() {
        return items;
    }

    public double calculateTotal() {
        double total = 0;
        for (CartItem item : items) {
            total += item.getSubTotal();
        }
        return total;
    }

    public void clearCart() {
        items.clear();
    }

    public void removeItem(String productID) {
        for (int i = 0; i < items.size(); i++) {
            CartItem item = items.get(i);

            if (item.getProduct().getProductID().equals(productID)) {

                if (item.getQuantity() > 1) {
                    item.setQuantity(item.getQuantity() - 1);
                } else {
                    items.remove(i);
                }

                break;
            }
        }
    }
}
