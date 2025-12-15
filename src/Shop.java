package model;

import java.util.ArrayList;

public class Shop {
    // Array to hold products
    private final ArrayList<Product> inventory;

    // Constructor
    public Shop() {
        inventory = new ArrayList<>();
    }

    // Add product to inventory
    public void addProduct(Product product) {
        inventory.add(product);
    }

    // View all products
    public void viewInventory() {
        System.out.println("--- RETRORACK INVENTORY ---");

        if (inventory.isEmpty()) {
            System.out.println("Rack is empty!! Please come back later ;)");
        } else {
            for (int i = 0; i < inventory.size(); i++) {
                Product product = inventory.get(i);

                // Print product details
                System.out.println((i + 1) + ". " + product.getName()
                        + " (RM " + product.getPrice() + ") "
                        + "- Stock: " + product.getStockQuantity());
            }
            System.out.println("--------------------------------");
            System.out.println("That's the end of the list...");
        }
    }

    // Sell a product (remove from inventory)
    public Product sellProduct(int choice) {
        int index = choice - 1;
        if (index < 0 || index >= inventory.size()) {
            System.out.println("Sorry, that product does not exist!!");
            return null;
        }

        return inventory.remove(index);
    }

    // Get inventory (optional, useful for cart integration)
    public ArrayList<Product> getInventory() {
        return inventory;
    }
}
