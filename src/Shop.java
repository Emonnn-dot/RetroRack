import java.util.ArrayList; // class to make resizeable array

public class Shop
{
    // Array to hold items
    private final ArrayList<Item> inventory; // make array based on Item datatype

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
        System.out.println("---RETRORACK INVENTORY---");

        if(inventory.isEmpty()) // Check if empty or not
        {
            System.out.println("Rack is empty!! pls come back later;)");
        }
        else
        {
            for(int i = 0; i < inventory.size(); i++) // For each item in inventory
            {
                Item item = inventory.get(i); // Getting the item based on index

                // Print details
                System.out.println((i + 1) + ". " +  item.getName()
                        + " [" + item.getSize()
                + "] (RM " + item.getPrice() + ") "
                + "- " + item.getCondition());
            }
            System.out.println("--------------------------------");
            System.out.println("Thats the end of the listtt...");
        }
    }

    public Item sellItem(int choice) // Remove item from the list (item sold)
    {
        int actIndex = choice - 1; // Getting the actual index
        if(actIndex < 0 || actIndex >= inventory.size()) // Validation check
        {
            System.out.println("Sorry, that item does not exist!!");
            return null;
        }

        return inventory.remove(actIndex); // Remove item from list
    }
}
