<%@ page import="model.User" %>
<%
    // SECURITY CHECK
    User currentUser = (User) session.getAttribute("currentUser");
    if (currentUser == null || !"Admin".equalsIgnoreCase(currentUser.getRole())) {
        // If not logged in OR not an Admin, kick them out!
        response.sendRedirect("../login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Retro Rack | Management Dashboard</title>
    <link rel="stylesheet" href="dashboard.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body class="dashboard-body">

    <aside class="sidebar">
        <div class="sidebar-logo">
            <img src="logo-retro.png" alt="Logo" class="logo-small">
        </div>
        <ul class="nav-menu">
            <li class="nav-item active" onclick="showSection('dashboard')"><a><i class='bx bx-grid-alt'></i> Dashboard</a></li>
            <li class="nav-item" onclick="showSection('products')"><a><i class='bx bx-package'></i> Products</a></li>
            <li class="nav-item" onclick="showSection('customers')"><a><i class='bx bx-user'></i> Customers</a></li>
            <li class="nav-item" onclick="window.location.href='manageOrder.jsp'">
                <a><i class='bx bx-shopping-bag'></i> Manage Orders</a>
            </li>
            <li class="nav-item" onclick="showSection('settings')"><a><i class='bx bx-cog'></i> Settings</a></li>
        </ul>
        <div class="sidebar-footer">
            <a href="admin.login.page.html" title="Logout">
                <i class='bx bx-log-out'></i>
            </a>
        </div>
    </aside>

       <main class="main-content">

        <!-- DASHBOARD OVERVIEW SECTION -->
        <div id="dashboard-section" class="section">
            <header class="content-header">
                <h1>Dashboard Summary</h1>
            </header>
            <div class="stats-grid">
                <div class="stat-card">
                    <span class="stat-label">Total Products</span>
                    <span class="stat-value" id="count-products">6</span>
                </div>
                <div class="stat-card">
                    <span class="stat-label">Available Items</span>
                    <span class="stat-value" id="count-available">6</span>
                </div>
                <div class="stat-card">
                    <span class="stat-label">Sold Out</span>
                    <span class="stat-value" id="count-soldout">0</span>
                </div>
                <div class="stat-card">
                    <span class="stat-label">Total Customers</span>
                    <span class="stat-value">4</span>
                </div>
            </div>
        </div>

                <!-- PRODUCT MANAGEMENT SECTION -->
        <div id="products-section" class="section" style="display:none;">
            <header class="content-header">
                <h1>Product Management</h1>
                <button class="btn-add" onclick="openModal()">+ Add Product</button>
            </header>

            <section class="table-container">
                <div class="table-actions">
                    <span>Products List</span>
                    <div class="search-box">
                        <i class='bx bx-search'></i>
                        <input type="text" id="productSearch" onkeyup="filterTable()" placeholder="Search item name...">
                    </div>
                </div>

                <table class="product-table" id="productTable">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Category</th>
                            <th>Price</th>
                            <th>Stock</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody id="product-list-body">
                        <!-- Product rows are dynamically injected here -->
                    </tbody>
                </table>
            </section>
        </div>

        <!-- CUSTOMER INFORMATION SECTION -->
        <div id="customers-section" class="section" style="display:none;">
            <header class="content-header">
                <h1>Customer Directory</h1>
            </header>
            <section class="table-container">
                <table class="product-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Phone</th>
                            <th>Address</th>
                            <th>Order</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr><td>#C001</td><td>Adam Haris</td><td>012-3456789</td><td>Kuala Lumpur, MY</td><td>Vintage Brown Jacket (x2)</td></tr>
                        <tr><td>#C002</td><td>Siti Nur</td><td>019-9876543</td><td>Penang, MY</td><td>Woman Elegant Skirt (x1)</td></tr>
                        <tr><td>#C003</td><td>Alia Aisyah</td><td>019-9365420</td><td>Penang, MY</td><td>Olive Drape Pants (x3)</td></tr>
                        <tr><td>#C004</td><td>Adam Hazeer</td><td>011-5944819</td><td>Kelantan, MY</td><td>90s Brown T-Shirt (x1)</td></tr>
                    </tbody>
                </table>
            </section>
        </div>

                <!-- ACCOUNT SETTINGS SECTION -->
        <div id="settings-section" class="section" style="display:none;">
            <header class="content-header">
                <h1>Account Settings</h1>
            </header>
            <div class="table-container" style="max-width: 500px;">
                <div class="form-group">
                    <label>Admin Username</label>
                    <input type="text" value="RetroAdmin_01" class="retro-input">
                </div>
                <div class="form-group">
                    <label>Notification Email</label>
                    <input type="email" value="admin@retrorack.com" class="retro-input">
                </div>
                <div class="form-group">
                    <label>Currency Mode</label>
                    <select class="retro-input">
                        <option>MYR (RM)</option>
                        <option>USD ($)</option>
                    </select>
                </div>
                <button class="btn-add">Save Configuration</button>
            </div>
        </div>
    </main>

    <!-- PRODUCT CREATE / EDIT MODAL -->
    <div id="productModal" class="modal-overlay">
        <div class="modal-card">
            <div class="modal-header">
                <h2 id="modalTitle">Edit Product</h2>
                <span class="close-x" onclick="closeModal()">&times;</span>
            </div>
            <form id="productForm">
                <input type="hidden" id="editIndex">

                <!-- Product name input -->
                <div class="form-group">
                    <label>Product Name</label>
                    <input type="text" id="pName" required placeholder="e.g. Vintage Oversized Tee">
                </div>

                <!-- Product category input -->
                <div class="form-group">
                    <label>Category</label>
                    <input type="text" id="pCategory" required placeholder="e.g. Apparel">
                </div>

                <div class="form-row">
                    <!-- Product price input -->
                    <div class="form-group">
                        <label>Price (RM)</label>
                        <input type="number" step="0.01" id="pPrice" required>
                    </div>

                    <!-- Product stock input -->
                    <div class="form-group">
                        <label>Stock</label>
                        <input type="number" id="pStock" required onchange="updateStatusOption()">
                    </div>
                </div>

                <!-- Product availability status -->
                <div class="form-group">
                    <label>Status</label>
                    <select id="pStatus" class="retro-input">
                        <option value="Available">Available</option>
                        <option value="Sold Out">Sold Out</option>
                    </select>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn-cancel" onclick="closeModal()">Cancel</button>
                    <button type="submit" class="btn-save">Save Changes</button>
                </div>
            </form>
        </div>
    </div>

        <script>
        // Product data storage using browser localStorage
        let products = JSON.parse(localStorage.getItem('retroProducts')) || [
            {name: "Slim Woman Dress", category: "Dress", price: "45.00", stock: "24", status: "Available"},
            {name: "90s Brown T-Shirt", category: "T-Shirt", price: "40.00", stock: "10", status: "Available"},
            {name: "Vintage Brown Jacket", category: "Jacket", price: "50.00", stock: "23", status: "Available"},
            {name: "Olive Drape Pants", category: "Pants", price: "39.00", stock: "30", status: "Available"},
            {name: "Men Polo Shirt", category: "Shirt", price: "45.00", stock: "15", status: "Available"},
            {name: "Woman Elegant Skirt", category: "Skirt", price: "37.00", stock: "21", status: "Available"}
        ];

        // Display the selected dashboard section
        function showSection(sectionId) {
            document.querySelectorAll('.section').forEach(s => s.style.display = 'none');
            document.getElementById(sectionId + '-section').style.display = 'block';
            document.querySelectorAll('.nav-item').forEach(i => i.classList.remove('active'));
            event.currentTarget.classList.add('active');
            if (sectionId === 'dashboard') updateDashboardStats();
        }

        // Render product table rows dynamically
        function renderTable() {
            const body = document.getElementById('product-list-body');
            body.innerHTML = "";
            products.forEach((p, index) => {
                body.innerHTML += `
                    <tr>
                        <td>${p.name}</td>
                        <td>${p.category}</td>
                        <td>RM ${p.price}</td>
                        <td>${p.stock}</td>
                        <td><span class="badge ${p.status.replace(" ","").toLowerCase()}">${p.status}</span></td>
                        <td>
                            <button class="action-btn" onclick="editProduct(${index})"><i class='bx bx-edit-alt'></i></button>
                            <button class="action-btn delete" onclick="deleteProduct(${index})"><i class='bx bx-trash'></i></button>
                        </td>
                    </tr>
                `;
            });
            localStorage.setItem('retroProducts', JSON.stringify(products));
            updateDashboardStats();
        }

        // Open the product modal dialog
        function openModal() {
            document.getElementById('productModal').style.display = 'flex';
        }

        // Close the product modal and reset the form
        function closeModal() {
            document.getElementById('productModal').style.display = 'none';
            document.getElementById('productForm').reset();
            document.getElementById('editIndex').value = "";
            document.getElementById('modalTitle').innerText = "Add Product";
        }

        // Handle product form submission
        document.getElementById('productForm').onsubmit = function(e) {
            e.preventDefault();
            const index = document.getElementById('editIndex').value;
            const data = {
                name: document.getElementById('pName').value,
                category: document.getElementById('pCategory').value,
                price: parseFloat(document.getElementById('pPrice').value).toFixed(2),
                stock: document.getElementById('pStock').value,
                status: document.getElementById('pStatus').value
            };

            if (index === "") products.push(data);
            else products[index] = data;

            renderTable();
            closeModal();
        };

        // Populate the modal with existing product data for editing
        function editProduct(index) {
            const p = products[index];
            document.getElementById('editIndex').value = index;
            document.getElementById('pName').value = p.name;
            document.getElementById('pCategory').value = p.category;
            document.getElementById('pPrice').value = p.price;
            document.getElementById('pStock').value = p.stock;
            document.getElementById('pStatus').value = p.status;
            document.getElementById('modalTitle').innerText = "Edit Product";
            openModal();
        }

        // Remove a product entry after confirmation
        function deleteProduct(index) {
            if (confirm("Confirm delete this item?")) {
                products.splice(index, 1);
                renderTable();
            }
        }

        // Filter product table rows based on search input
        function filterTable() {
            const val = document.getElementById('productSearch').value.toLowerCase();
            const rows = document.querySelectorAll('#productTable tbody tr');
            rows.forEach(row => {
                row.style.display = row.innerText.toLowerCase().includes(val) ? "" : "none";
            });
        }

        // Update dashboard summary statistics
        function updateDashboardStats() {
            
            document.getElementById('count-products').innerText = products.length;
            document.getElementById('count-available').innerText = 
            products.filter(p => p.status === 'Available').length;
            document.getElementById('count-soldout').innerText = 
            products.filter(p => p.status === 'Sold Out').length;
        }

        // Initial page load actions
        window.onload = () => {
            renderTable();
            updateDashboardStats();
        };

        // Clear login session and redirect to login page
        function logout() {
            localStorage.removeItem('isLoggedIn');
            window.location.href = 'admin.login.page.html';
        }
    </script>
</body>
</html>