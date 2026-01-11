<%@ page import="model.Cart, model.CartItem, model.Product" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RetroRack - Your Cart</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <nav>
        <a href="index.jsp">Home</a>
        <a href="products.jsp">Products</a>
        <a href="cart.jsp" class="active">Cart</a>
        <a href="login.jsp">Account</a>
    </nav>

    <main class="cart-wrapper">
        <%
            Cart cart = (Cart) session.getAttribute("cart");
            int itemCount = (cart != null) ? cart.getItems().size() : 0;
        %>

        <h2>Shopping Cart (<%= itemCount %> Items)</h2>
        <div class="divider"></div>

        <div class="cart-container">
            <%
                if (cart != null && !cart.getItems().isEmpty()) {
                    for (CartItem item : cart.getItems()) {
                        Product p = item.getProduct();
            %>
                <div class="cart-item">
                <%
                String img = "";
                switch (p.getProductID()) {
                    case "P001": img = "dress.jpg"; break;
                    case "P002": img = "BrownTShirt.jpg"; break;
                    case "P003": img = "Vintage-Jacket.jpg"; break;
                    case "P004": img = "Grey-Palazzo.jpg"; break;
                    case "P005": img = "Men-Polo-Shirt.jpg"; break;
                    case "P006": img = "Woman-Skirt.jpg"; break;
                }
                %>
                <img src="Images/<%= img %>" alt="<%= p.getName() %>">

                    <div class="item-details">
                        <h3><%= p.getName() %></h3>
                        <p>Qty: <%= item.getQuantity() %> | RM <%= String.format("%.2f", p.getPrice()) %></p>
                    </div>
                    <button class="btn-remove" onclick="location.href='RemoveItemServlet?productId=<%= p.getProductID() %>'">Remove</button>
                </div>
            <%
                    }
            %>
                <div class="cart-summary">
                    <div class="summary-total">
                        <h3>Total Amount: <span>RM <%= String.format("%.2f", cart.calculateTotal()) %></span></h3>
                    </div>
                    <div class="cart-actions">
                        <a href="products.jsp" class="continue-link">Continue Shopping</a>
                        <button class="add-to-cart" onclick="proceedToPayment()">
                            Proceed to Checkout
                        </button>

                        <script>
                        function proceedToPayment() {
                            alert("Shipping details saved! Redirecting to payment...");
                            window.location.href = "checkout.jsp";
                        }
                        </script>

                    </div>
                </div>
            <%
                } else {
            %>
                <div style="text-align: center; padding: 50px;">
                    <h3>Your shopping cart is empty.</h3>
                    <a href="products.jsp" class="continue-link" style="display:inline-block; margin-top:20px;">Go To Shopping</a>
                </div>
            <%
                }
            %>
        </div>
    </main>

    <footer>
        <p>&copy; 2025 RetroRack Team</p>
    </footer>

    <script src="script.js"></script>
</body>
</html>