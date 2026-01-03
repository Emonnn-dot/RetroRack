<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
           <form id="loginForm" novalidate>
                <div class="login-group" style="text-align: left; margin-bottom: 15px;">
                    <label>Username:</label>
                    <input type="text" id="username" name="username" required>
                </div>
                
                <div class="login-group" style="text-align: left; margin-bottom: 15px;">
                    <label>Password:</label>
                    <input type="password" id="password" name="password" required>
                </div>
                
                <button type="submit" class="add-to-cart">Login</button>
            </form>
            
            <p style="margin-top: 20px;">Don't have an account? <a href="register.jsp" style="color: var(--primary-color);">Register here</a></p>
        </div>
    </main>

    <footer>
        <p>&copy; 2025 RetroRack Team</p>
    </footer>

    <script>
        const loginForm = document.getElementById('loginForm');

        loginForm.addEventListener('submit', function(event) {
            
            const username = document.getElementById('username').value.trim();
            const password = document.getElementById('password').value.trim();

            if (username === "" || password === "") {
                alert("Error: Username and Password cannot be left empty!");
                event.preventDefault();
                return;
            }

            if (password.length < 5) {
                alert("Error: Password must be at least 5 characters long!");
                event.preventDefault();
                return;
            }
            event.preventDefault();
            alert("Form validation successful! Redirecting to home...");
            window.location.assign("index.jsp");
        
        });
    </script>
</body>
</html> 