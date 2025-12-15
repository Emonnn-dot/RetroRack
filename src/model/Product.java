package model;

public class Product {
    private String productID;
    private String name;
    private String description;
    private double price;
    private int stockQuantity;

    // Constructor
    public Product(String productID, String name, String description, double price, int stockQuantity) {
        this.productID = productID;
        this.name = name;
        this.description = description;
        this.price = price;
        this.stockQuantity = stockQuantity;
    }

    // Constructor (For FileHandler/deserialization)
    public Product() {
    }

    // --- Getter Methods ---
    public String getProductID() {
        return productID;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }

    public double getPrice() {
        return price;
    }

    public int getStockQuantity() {
        return stockQuantity;
    }

    // --- Setter Methods ---
    public void setProductID(String productID) {
        this.productID = productID;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setStockQuantity(int stockQuantity) {
        this.stockQuantity = stockQuantity;
    }

    @Override
    public String toString() {
        return "Product{" +
                "ID='" + productID + '\'' +
                ", Name='" + name + '\'' +
                ", Price=" + price +
                ", Stock=" + stockQuantity +
                '}';
    }
}