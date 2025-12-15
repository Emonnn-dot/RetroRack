import model.Cart;
import model.Item;

public class Main {
    public static void main(String[] args) {
        Item i = new Item("P01", "Retro Shirt", 50.0, "Good");
        Cart c = new Cart();
        c.addItem(i);
        System.out.println(c.calculateTotal());
    }
}
