<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>RetroRack - Products</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<script>
    const urlParams = new URLSearchParams(window.location.search);
    const added = urlParams.get("added");

    if (added) {
        let msg = "";

        switch (added) {
            case "P001": msg = "Slim Woman Dress added to cart!"; break;
            case "P002": msg = "90s Brown T-Shirt added to cart!"; break;
            case "P003": msg = "Vintage Brown Jacket added to cart!"; break;
            case "P004": msg = "Olive Drape Pants added to cart!"; break;
            case "P005": msg = "Men Polo Shirt added to cart!"; break;
            case "P006": msg = "Woman Elegant Skirt added to cart!"; break;
        }

        if (msg !== "") {
            alert(msg);
        }
    }
</script>
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
                <button class="add-to-cart" onclick="location.href='AddToCartServlet?productId=P001&quantity=1'">
                    Add to Cart
                </button>
            </div>
            <div class="product-card">
               <img src="Images/BrownTShirt.jpg" alt="Brown Shirt" style="width:50%; border-radius:10px;">
               <h3>90s Brown T-Shirt</h3>
               <p style="font-size: 0.9em; color: #555;">Size: L | Condition: Excellent</p>
               <p><strong>RM 40.00</strong></p>
               <button class="add-to-cart" onclick="location.href='AddToCartServlet?productId=P002&quantity=1'">
                    Add to Cart
                    </button>
            </div>
            <div class="product-card">
               <img src="Images/Vintage-Jacket.jpg" alt="Vintage Jacket" style="width:50%; border-radius:10px;">
               <h3>Vintage Brown Jacket</h3>
               <p style="font-size: 0.9em; color: #555;">Size: XL | Condition: Good</p>
               <p><strong>RM 50.00</strong></p>
               <button class="add-to-cart" onclick="location.href='AddToCartServlet?productId=P003&quantity=1'">
                  Add to Cart
                  </button>
            </div>
            <div class="product-card">
               <img src="Images/Grey-Palazzo.jpg" alt="Grey Palazzo" style="width:50%; border-radius:10px;">
               <h3>Olive Drape Pants</h3>
               <p style="font-size: 0.9em; color: #555;">Size: L | Condition: Good</p>
               <p><strong>RM 39.00</strong></p>
               <button class="add-to-cart" onclick="location.href='AddToCartServlet?productId=P004&quantity=1'">
                         Add to Cart
                         </button>
            </div>
            <div class="product-card">
               <img src="Images/Men-Polo-Shirt.jpg" alt="Polo Shirt" style="width:50%; border-radius:10px;">
               <h3>Men Polo Shirt</h3>
               <p style="font-size: 0.9em; color: #555;">Size: S | Condition: Like-new</p>
               <p><strong>RM 45.00</strong></p>
               <button class="add-to-cart" onclick="location.href='AddToCartServlet?productId=P005&quantity=1'">
                        Add to Cart
                        </button>
            </div>
            <div class="product-card">
               <img src="Images/Woman-Skirt.jpg" alt="Woman Skirt" style="width:50%; border-radius:10px;">
               <h3>Woman Elegant Skirt</h3>
               <p style="font-size: 0.9em; color: #555;">Size: M | Condition: Excellent</p>
               <p><strong>RM 37.00</strong></p>
               <button class="add-to-cart" onclick="location.href='AddToCartServlet?productId=P006&quantity=1'">
                      Add to Cart
                      </button>
            </div>
        </div>
    </main>

    <footer>
        <p>&copy; 2025 RetroRack Team</p>
    </footer>
<script src="script.js"></script>
</body>
</html> 