import model.Item;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) {

        // Create the shop
        Shop retroRack = new Shop();

        // Create scanner
        Scanner input = new Scanner(System.in);

        // Putting the clothes
        retroRack.addItem(new Item("Vintage Nike Hoodie", 80.0, "L", "Used"));
        retroRack.addItem(new Item("Adidas Cap", 25.0, "OS", "New"));
        retroRack.addItem(new Item("Levi's 501 Jeans", 120.0, "32", "Worn"));

        while (true) {
            System.out.println("\n--- MENU ---");
            retroRack.viewInventory();

            System.out.print("Enter item number (0 to exit): ");
            int choice = input.nextInt();

            if (choice == 0) {
                System.out.println("Bye byee");
                break;
            }

            Item boughtItem = retroRack.sellItem(choice);

            if (boughtItem != null) {
                System.out.println("You bought " + boughtItem.getName());
            }
        }

        input.close();
    }
}
