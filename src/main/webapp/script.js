// ==========================================
// 1. INDEX PAGE LOGIC
// ==========================================
function goToProducts() {
    alert("Welcome to RetroRack! Exploring our collections...");
    window.location.assign("products.html"); 
}

// ==========================================
// 2. PRODUCT PAGE LOGIC
// ==========================================
function addToCart(itemName) {
    alert(itemName + " added to cart!");
}

// ==========================================
// 3. REGISTER PAGE LOGIC
// ==========================================
const registerForm = document.getElementById('registerForm');
if (registerForm) {
    registerForm.addEventListener('submit', function(event) {
        const username = document.getElementById('Username').value.trim();
        const email = document.getElementById('email').value.trim();
        const password = document.getElementById('regPassword').value.trim();
        const confirmPass = document.getElementById('confirmPassword').value.trim();

        if (username === "" || email === "" || password === "" || confirmPass === "") {
            alert("Error: All fields are required!");
            event.preventDefault();
            return;
        }

        if (!email.includes("@") || !email.includes(".")) {
            alert("Error: Please enter a valid email address!");
            event.preventDefault();
            return;
        }

        if (password !== confirmPass) {
            alert("Error: Passwords do not match!");
            event.preventDefault();
            return;
        }

        if (password.length < 5) {
            alert("Error: Password must be at least 5 characters long!");
            event.preventDefault();
            return;
        }

        event.preventDefault(); // Stop for demo
        alert("Registration successful! Redirecting to login page...");
        window.location.href = "login.html";
    });
}

// ==========================================
// 4. LOGIN PAGE LOGIC
// ==========================================
const loginForm = document.getElementById('loginForm');
if (loginForm) {
    loginForm.addEventListener('submit', function(event) {
        const user = document.getElementById('username').value.trim();
        const pass = document.getElementById('password').value.trim();

        if (user === "" || pass === "") {
            alert("Error: Username and Password are required!");
            event.preventDefault();
            return;
        }

        event.preventDefault(); // Stop for demo
        alert("Login successful! Welcome back to RetroRack.");
        window.location.href = "index.html";
    });
}

// ==========================================
// 5. PAYMENT PAGE LOGIC
// ==========================================
const payForm = document.getElementById('payForm');
if (payForm) {
    payForm.addEventListener('submit', function(event) {
        const fullName = document.getElementById('fullName').value.trim();
        const address = document.getElementById('address').value.trim();
        const cardNum = document.getElementById('cardNum').value.trim();

        if (fullName === "" || address === "" || cardNum === "") {
            alert("Error: Please fill in all payment details!");
            event.preventDefault();
            return;
        }

        if (cardNum.length !== 16 || isNaN(cardNum)) {
            alert("Error: Card number must be 16 numeric digits!");
            event.preventDefault();
            return;
        }

        alert("Validation success! Your order is being processed by the Java Server.");
        // Data will be sent to PaymentServlet (Ahli 3 task)
    });
}