import java.util.Scanner; // keyboard listener

public class Main {

    // Create the shop
    static Shop retroRack = new Shop();

    // Create scanner
    static Scanner input = new Scanner(System.in);

    public static void main(String[] args) {

        // Putting the clothes
        retroRack.addItem(new Item("Vintage Nike Hoodie", 80.0, "L", "Used"));
        retroRack.addItem(new Item("Adidas Cap", 25.0, "OS", "New"));
        retroRack.addItem(new Item("Levi's 501 Jeans", 120.0, "32", "worn"));

        runAdmin();
        retroRack.viewInventory();
        runCustomer();
        retroRack.viewInventory();
    }

    public static void runAdmin() {
        System.out.println("Hi adminnn!!!");
        System.out.println("now we are going to add new itemmm");

        System.out.println("Enter name: ");
        String name = input.nextLine();

        System.out.println("Enter price: ");
        double price = input.nextDouble();
        input.nextLine(); // Removes floating "THINGS"

        System.out.println("Enter size: ");
        String size = input.nextLine();

        System.out.println("Enter the item condition: ");
        String condition = input.nextLine();

        Item newItem = new Item(name, price, size, condition);

        retroRack.addItem(newItem);

        System.out.println("Item added successfully!!!");
    }

    public static void runCustomer() {

        while (true) {
            System.out.println("\n--- MENU ---"); //Menu
            retroRack.viewInventory();

            System.out.println("Enter item number (0 to exit): "); // prompt input
            int choice = input.nextInt(); // User input

            if (choice == 0) // if user exit
            {
                System.out.println("Bye byee");
                break; // break the loop
            }

            Item boughtItem = retroRack.sellItem(choice); // Sell the item

            if (boughtItem != null) {
                System.out.println("You bought " + boughtItem.getName());
            }

        }
    }
}
