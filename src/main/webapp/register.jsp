<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>RetroRack - Register</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<nav>
    <a href="index.jsp">Home</a>
    <a href="products.jsp">Products</a>
    <a href="cart.jsp">Cart</a>
    <a href="login.jsp">Login</a>
</nav>

<main style="padding: 50px; text-align: center;">
    <div class="login-container">
        <h2>Create Account</h2>
        <div class="divider"></div>

        <form onsubmit="window.location.href='index.jsp'; return false;">
            <div class="login-group">
                <label>Username:</label>
                <input type="text" id="Username" name="Username">
            </div>

            <div class="login-group">
                <label>Email Address:</label>
                <input type="email" id="email" name="email">
            </div>

            <div class="login-group">
                <label>Password:</label>
                <input type="password" id="regPassword" name="password">
            </div>

            <div class="login-group">
                <label>Confirm Password:</label>
                <input type="password" id="confirmPassword" name="confirmPassword">
            </div>

            <button type="submit" class="add-to-cart">Register Now</button>
        </form>

        <p style="margin-top: 20px;">Already have an account? <a href="login.jsp">Login here</a></p>
    </div>
</main>

<footer>
    <p>&copy; 2025 RetroRack Team</p>
</footer>

<script src="script.js"></script>
</body>
</html> 