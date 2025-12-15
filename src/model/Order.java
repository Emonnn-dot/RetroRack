package model;

public class Order {
    private String orderId;
    private Cart cart;
    private String status;

    public Order(String orderId, Cart cart) {
        this.orderId = orderId;
        this.cart = cart;
        this.status = "Pending";
    }
}

