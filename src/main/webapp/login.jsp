<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>RetroRack - Login</title>
    <link rel="stylesheet" href="css/style.css"> </head>
<body>
    <nav>
        <a href="index.jsp">Home</a>
        <a href="products.jsp">Products</a>
        <a href="cart.jsp">Cart</a>
    </nav>

    <main style="padding: 50px; text-align: center;">
        <div class="login-container">
            <h2>User Login</h2>
            <div class="divider"></div>

            <% if ("invalid".equals(request.getParameter("error"))) { %>
            <p style="color:red;">Invalid Username or Password!</p>
            <% } %>

            <form action="LoginServlet" method="POST"> <div class="login-group">
                <label>Username:</label>
                <input type="text" name="username" required>
            </div>
                <div class="login-group">
                    <label>Password:</label>
                    <input type="password" name="password" required>
                </div>
                <button type="submit">Login</button>
            </form>

            <p style="margin-top: 20px;"> Don't have an account? <a href="register.jsp" style="color: var(--primary-color);">Register here</a></p>
        </div>
    </main>

    <footer>
        <p>&copy; 2025 RetroRack Team</p>
    </footer>
   <script src="script.js"></script>
</body>
</html> 