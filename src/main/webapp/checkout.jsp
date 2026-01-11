<%
    // Security Check: If user is not logged in, kick them to login page
    if (session.getAttribute("currentUser") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<%@ page import="model.Cart, model.CartItem" %>
<%
    Cart cart = (Cart) session.getAttribute("cart");

    double subtotal = (cart != null) ? cart.calculateTotal() : 0.0;
    int totalItems = (cart != null) ? cart.getItems().size() : 0;
    double shippingFee = (subtotal > 0) ? 5.00 : 0.00;
    double finalTotal = subtotal + shippingFee;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RetroRack | Checkout</title>
    <link rel="stylesheet" href="css/style.css">

</head>
<body class="checkout-page">

<nav>
    <a href="index.jsp">Home</a>
    <a href="products.jsp">Products</a>
    <a href="cart.jsp">Cart</a>
</nav>

<main class="checkout-main">
    <div class="checkout-card">
        <h2 class="section-title">Final Checkout</h2>
        <div class="divider"></div>

        <div class="checkout-grid">
            <section class="shipping-info">
                <h3>Shipping Details</h3>
                <form id="checkoutForm" action="ShippingServlet" method="POST">>
                    <div class="input-box">
                        <label for="custName">Full Name</label>
                        <input type="text" id="custName" placeholder="Enter receiver name" required>
                    </div>
                    <div class="input-box">
                        <label for="custPhone">Phone Number</label>
                        <input type="tel" id="custPhone" placeholder="01X-XXXXXXX" required>
                    </div>
                    <div class="input-box">
                        <label for="custAddress">Shipping Address</label>
                        <textarea id="custAddress" rows="4" placeholder="House No, Street Name, Postcode, City, State" required></textarea>
                    </div>
                    <input type="hidden" name="subtotal" value="<%= String.format("%.2f", subtotal) %>">
                                        <input type="hidden" name="shippingFee" value="<%= String.format("%.2f", shippingFee) %>">
                                        <input type="hidden" name="finalTotal" value="<%= String.format("%.2f", finalTotal) %>">
                </form>
            </section>

            <section class="order-review">
                <h3>Order Summary</h3>
                <div class="summary-details">
                    <div class="summary-line">
                        <span>Subtotal (<%= totalItems %> Items)</span>
                        <span>RM <%= String.format("%.2f", subtotal) %></span>
                    </div>
                    <div class="summary-line">
                        <span>Shipping Fee</span>
                        <span>RM <%= String.format("%.2f", shippingFee) %></span>
                    </div>
                    <hr class="summary-hr">
                    <div class="summary-line total-line">
                        <span>Total Amount</span>
                        <span>RM <%= String.format("%.2f", finalTotal) %></span>
                    </div>
                </div>

                <form action="ShippingServlet" method="POST">
                    <input type="hidden" name="subtotal" value="<%= String.format("%.2f", subtotal) %>">
                    <input type="hidden" name="shippingFee" value="<%= String.format("%.2f", shippingFee) %>">
                    <input type="hidden" name="finalTotal" value="<%= String.format("%.2f", finalTotal) %>">

                    <button type="submit">Proceed to Payment</button>
                </form>

                <a href="cart.jsp" class="cancel-link">Back to Cart</a>
            </section>
        </div>
    </div>
</main>

<footer>
    <p>&copy; 2025 RetroRack Team</p>
</footer>

<script src="script.js"></script>
</body>
</html>