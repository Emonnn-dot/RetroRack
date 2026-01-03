<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Cart, model.CartItem, java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>RetroRack - Shopping Cart</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <nav>
        <a href="index.jsp">Home</a>
        <a href="products.jsp">Products</a>
        <a href="cart.jsp">Cart</a>
        <a href="login.jsp" class="account-btn">Account</a>
    </nav>

    <main style="padding: 60px; text-align: center;">
        <h2>Your Shopping Cart</h2>

        <table border="1" style="width:80%; margin: auto; border-collapse: collapse;">
            <thead>
                <tr style="background-color: #f2f2f2;">
                    <th>Product Details</th>
                    <th>Quantity</th>
                    <th>Subtotal</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Cart cart = (Cart) session.getAttribute("cart");
                    if (cart != null && !cart.getItems().isEmpty()) {
                        for (CartItem item : cart.getItems()) {
                %>
                <tr>
                    <td><%= item.getProduct().getProductID() %> : <%= item.getProduct().getName() %></td>
                    <td><%= item.getQuantity() %></td>
                    <td>RM <%= String.format("%.2f", item.getSubTotal()) %></td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="3">Your cart is empty.</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>

        <div style="margin-top: 20px;">
            <h3>Total: RM <%= (cart != null) ? String.format("%.2f", cart.calculateTotal()) : "0.00" %></h3>

            <button onclick="window.location.href='products.jsp'" style="padding: 10px;">Continue Shopping</button>
            <button style="padding: 10px; background-color: #28a745; color: white;">Checkout</button>
        </div>
    </main>

    <footer>
        <p>&copy; 2026 RetroRack Team</p>
    </footer>
</body>
</html>