<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>RetroRack - Products</title>
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
        <h2>Our Products</h2>
        <p>Product listing will be displayed here.</p>
        
        <div class="product-container">
            <div class="product-card">
                <img src="Images/dress.jpg" alt="Slim Woman Dress" style="width:50%; border-radius:10px;">
                <h3>Slim Woman Dress</h3>
                <p style="font-size: 0.9em; color: #555;">Size: M | Condition: Like-new</p>
                <p><strong>RM 45.00</strong></p>
                <form action="AddToCartServlet" method="POST">
                    <input type="hidden" name="productId" value="P001">
                    <input type="number" name="quantity" value="1" min="1" style="width: 40px;">
                    <button type="submit" class="add-to-cart">Add to Cart</button>
                </form>
            </div>
            <div class="product-card">
               <img src="Images/BrownTShirt.jpg" alt="Brown Shirt" style="width:50%; border-radius:10px;">
               <h3>90s Brown T-Shirt</h3>
               <p style="font-size: 0.9em; color: #555;">Size: L | Condition: Excellent</p>
               <p><strong>RM 40.00</strong></p>
               <form action="AddToCartServlet" method="POST">
                   <input type="hidden" name="productId" value="P002">
                   <input type="number" name="quantity" value="1" min="1" style="width: 40px;">
                   <button type="submit" class="add-to-cart">Add to Cart</button>
               </form>
            </div>
            <div class="product-card">
               <img src="Images/Vintage-Jacket.jpg" alt="Vintage Jacket" style="width:50%; border-radius:10px;">
               <h3>Vintage Brown Jacket</h3>
               <p style="font-size: 0.9em; color: #555;">Size: XL | Condition: Good</p>
               <p><strong>RM 50.00</strong></p>
               <form action="AddToCartServlet" method="POST">
                   <input type="hidden" name="productId" value="P003">
                   <input type="number" name="quantity" value="1" min="1" style="width: 40px;">
                   <button type="submit" class="add-to-cart">Add to Cart</button>
               </form>
            </div>

            <div class="product-card">
               <img src="Images/Grey-Palazzo.jpg" alt="Grey Palazzo" style="width:50%; border-radius:10px;">
              <h3>Grey Palazzo</h3> <p style="font-size: 0.9em; color: #555;">Size: L | Condition: Good</p>
              <p><strong>RM 55.00</strong></p>
               <form action="AddToCartServlet" method="POST">
                   <input type="hidden" name="productId" value="P004">
                   <input type="number" name="quantity" value="1" min="1" style="width: 40px;">
                   <button type="submit" class="add-to-cart">Add to Cart</button>
               </form>
            </div>

            <div class="product-card">
               <img src="Images/Men-Polo-Shirt.jpg" alt="Polo Shirt" style="width:50%; border-radius:10px;">
               <h3>Men Polo Shirt</h3>
               <p style="font-size: 0.9em; color: #555;">Size: S | Condition: Like-new</p>
               <p><strong>RM 45.00</strong></p>
               <form action="AddToCartServlet" method="POST">
                   <input type="hidden" name="productId" value="P005">
                   <input type="number" name="quantity" value="1" min="1" style="width: 40px;">
                   <button type="submit" class="add-to-cart">Add to Cart</button>
               </form>
            </div>

            <div class="product-card">
               <img src="Images/Woman-Skirt.jpg" alt="Woman Skirt" style="width:50%; border-radius:10px;">
               <h3>Woman Elegant Skirt</h3>
               <p style="font-size: 0.9em; color: #555;">Size: M | Condition: Excellent</p>
               <p><strong>RM 37.00</strong></p>
               <form action="AddToCartServlet" method="POST">
                   <input type="hidden" name="productId" value="P006">
                   <input type="number" name="quantity" value="1" min="1" style="width: 40px;">
                   <button type="submit" class="add-to-cart">Add to Cart</button>
               </form>
            </div>
        </div>
    </main>

    <footer>
        <p>&copy; 2025 RetroRack Team</p>
    </footer>

</body>
</html> 