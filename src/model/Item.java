package model;

public class Item {
    private String id;
    private String name;
    private double price;
    private String condition;

    public Item(String id, String name, double price, String condition) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.condition = condition;
    }

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public double getPrice() {
        return price;
    }

    public String getCondition() {
        return condition;
    }
}
