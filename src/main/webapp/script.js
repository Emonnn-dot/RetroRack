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

        if (password !== confirmPass) {
            alert("Error: Passwords do not match!");
            event.preventDefault();
            return;
        }

        event.preventDefault();
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

        event.preventDefault();
        alert("Login successful! Welcome back to RetroRack.");
        window.location.href = "index.html";
    });
}

// ==========================================
// 5. CHECKOUT PAGE LOGIC
// ==========================================
const checkoutForm = document.getElementById('checkoutForm');
if (checkoutForm) {
    checkoutForm.addEventListener('submit', function(event) {
        event.preventDefault();
        const name = document.getElementById('custName').value.trim();
        const phone = document.getElementById('custPhone').value.trim();
        const address = document.getElementById('custAddress').value.trim();

        if (name === "" || phone === "" || address === "") {
            alert("Error: Please provide all shipping details!");
            return;
        }

        alert("Shipping information saved! Redirecting to payment...");
        window.location.href = "payment.html"; 
    });
}