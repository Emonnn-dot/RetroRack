<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RetroRack | Payment</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<header>
    <h1>RetroRack</h1>
    <p>Secure Your Vintage Style</p>
</header>

<nav>
    <a href="index.jsp">Home</a>
    <a href="products.jsp">Products</a>
    <a href="login.jsp">Login</a>
</nav>

<div class="payment-wrapper">
    <div class="payment-container">
        <h2>Secure Checkout</h2>
        <form id="payForm" action="PaymentServlet" method="POST">
            <div class="payment-group">
                <label for="fullName">Full Name</label>
                <input type="text" id="fullName" name="fullName">
            </div>

            <div class="payment-group">
                <label for="address">Shipping Address</label>
                <textarea id="address" name="address" rows="3"></textarea>
            </div>

            <div class="payment-group">
                <label for="cardNum">Credit Card Number (16-digits)</label>
                <input type="text" id="cardNum" name="cardNum" placeholder="0000 0000 0000 0000">
            </div>

            <div class="order-summary-box">
                <%
                    String finalTotal = (String) session.getAttribute("finalTotal");
                %>
                <p>
                    <span>Total Amount:</span>
                    <span>RM <%= (finalTotal != null) ? finalTotal : "0.00" %></span>
                </p>
            </div>

            <button type="button" onclick="window.location.href='success.html'">
                Complete Order
            </button>

            <div style="text-align: center; margin-top: 15px;">
                <a href="cart.jsp" style="color: var(--text-color); text-decoration: none; font-size: 0.9em;">
                    &larr; Back to Shopping Cart
                </a>
            </div>
        </form>
    </div>
</div>

<footer>
    <p>&copy; 2025 RetroRack E-Commerce Project. All rights reserved.</p>
</footer>

<script src="script.js"></script>

</body>
</html>