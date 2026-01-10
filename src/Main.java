import model.*;

public class Main {
    public static void main(String[] args) {
        Product p1 = new Product("P001", "Keyboard", "Mechanical Keyboard", 120.00, 10);

        Cart cart = new Cart();
        cart.addItem(p1, 2);

        Order order = new Order("O1001", cart);

        System.out.println("Order Total: RM" + order.getOrderTotal());
        System.out.println("Order Status: " + order.getStatus());
    }
}
