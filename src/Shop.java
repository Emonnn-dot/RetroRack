import java.util.ArrayList; // class to make resizeable array

public class Shop
{
    // Array to hold items
    private final ArrayList<Item> inventory;

    // Constructor
    public Shop()
    {
        inventory = new ArrayList<>();
    }

    // Methods
    public void addItem(Item item)
    {
        inventory.add(item);
    }

    public void viewInventory()
    {
        System.out.println("---INVENTORY---");

        if(inventory.isEmpty()) // Check if empty or not
        {
            System.out.println("Rack is empty!! pls put some itemss;)");
        }
        else
        {
            for(Item i : inventory) // For each item in inventory
            {
                // Print details
                System.out.println("--------------------------------");
                System.out.println("Name: " +  i.getName());
                System.out.println("Price: " +  i.getPrice());
                System.out.println("Size: " +  i.getSize());
                System.out.println("Condition: " +  i.getCondition());
                System.out.println("--------------------------------");
            }

            System.out.println("Thats the end of the listtt...");
        }
    }
}
