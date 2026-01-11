// ==========================================
// 1. INDEX PAGE LOGIC
// ==========================================
function goToProducts() {
    alert("Welcome to RetroRack! Exploring our collections...");
    //window.location.assign("products.jsp");
    window.location.href = "products.jsp";
}

// ==========================================
// 2. PRODUCT PAGE LOGIC
// ==========================================
function addToCart(id, itemName, price) {
    let cart = JSON.parse(localStorage.getItem('retroRackCart')) || [];
    cart.push({ id: id, name: itemName, price: price });
    localStorage.setItem('retroRackCart', JSON.stringify(cart));

    alert(itemName + " added to cart!");

    window.location.href = "AddToCartServlet?productId=" + id + "&quantity=1";
}
function removeItem(button) {
    if (confirm('Are you sure you want to remove this item?')) {
        const item = button.closest('.cart-item');
        item.style.opacity = '0';

        setTimeout(() => {
            item.remove();
            updateTotal();
        }, 300);
    }
}
function updateTotal() {
    let total = 0;
    const items = document.querySelectorAll('.cart-item');

    items.forEach(item => {
        const priceElement = item.querySelector('.item-details p');
        if (priceElement) {
            const priceText = priceElement.innerText;
            const match = priceText.match(/RM\s*([\d.]+)/);
            if (match) {
                total += parseFloat(match[1]);
            }
        }
    });

    const totalDisplay = document.querySelector('.summary-total span');
    if (totalDisplay) {
        totalDisplay.innerText = "RM " + total.toFixed(2);
    }

    const cartHeader = document.querySelector('.cart-wrapper h2');
    if (cartHeader) {
        cartHeader.innerText = `Shopping Cart (${items.length} Items)`;
    }
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
        window.location.href = "login.jsp";
    });
}

// ==========================================
// 4. LOGIN PAGE LOGIC
// ==========================================
const loginForm = document.getElementById('loginForm');
if (loginForm) {
    loginForm.addEventListener('submit', function(event) {
        event.preventDefault();
        console.log("Login button clicked");
        const user = document.getElementById('username').value.trim();
        const pass = document.getElementById('password').value.trim();

        if (user === "" || pass === "") {
            alert("Error: Username and Password are required!");
            //event.preventDefault();
            return;
        }

        //event.preventDefault(); // Stop for demo
        alert("Login successful! Welcome back to RetroRack.");
        window.location.href = "index.jsp";
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

       
        event.preventDefault();
        alert("Validation success! Your order is being processed.");
        
       
        //window.location.href = "success.jsp";
    });
}
// ==========================================
// 6. CHECKOUT PAGE LOGIC
// ==========================================
const checkoutForm = document.getElementById('checkoutForm');
if (checkoutForm) {
    checkoutForm.addEventListener('submit', function(event) {

        const name = document.getElementById('custName').value.trim();
        const address = document.getElementById('custAddress').value.trim();

        if (name === "" || address === "") {
            alert("Error: Please provide all shipping details!");
            event.preventDefault();
            return;
        }

        alert("Shipping details saved! Redirecting to payment...");
    });
}