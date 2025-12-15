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

    public String getOrderId() {
        return orderId;
    }

    public Cart getCart() {
        return cart;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public double getOrderTotal() {
        return cart.calculateTotal();
    }
}
