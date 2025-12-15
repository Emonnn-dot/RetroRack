// Class for items in the Thrift store

public class Item {
    // Variables
    private String name; // Name of the item
    private double price;
    private String size; // XS, S, M, L, XL, etc...
    private String condition; // Like-new/excellent/good

    // Constructors
    public Item(){}
    public Item(String name, double price, String size, String condition)
    {
        this.name = name;
        this.price = price;
        this.size = size;
        this.condition = condition;
    }

    // Setters
    public void setName(String name)
    {
        this.name = name;
    }
    public void setPrice(double price)
    {
        this.price = price;
    }
    public void setSize(String size)
    {
        this.size = size;
    }
    public void setCondition(String condition)
    {
        this.condition = condition;
    }

    // Getters
    public String getName() {
        return name;
    }
    public double getPrice() {
        return price;
    }
    public String getSize() {
        return size;
    }
    public String getCondition() {
        return condition;
    }
}
