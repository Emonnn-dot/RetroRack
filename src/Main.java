import java.util.Scanner; // keyboard listener

void main()
{
    // Create the shop
    Shop retroRack = new Shop();

    // Create scanner
    Scanner input = new Scanner(System.in);

    // Putting the clothes
    retroRack.addItem(new Item("Vintage Nike Hoodie", 80.0, "L", "Used"));
    retroRack.addItem(new Item("Adidas Cap", 25.0, "OS", "New"));
    retroRack.addItem(new Item("Levi's 501 Jeans", 120.0, "32", "worn"));

    while(true)
    {
        System.out.println("\n--- MENU ---"); //Menu
        retroRack.viewInventory();

        System.out.println("Enter item number (0 to exit): "); // prompt input
        int choice = input.nextInt(); // User input

        if(choice == 0) // if user exit
        {
            System.out.println("Bye byee");
            break; // break the loop
        }

        Item boughtItem = retroRack.sellItem(choice); // Sell the item

        if(boughtItem != null)
        {
            System.out.println("You bought " + boughtItem.getName());
        }

    }

}
