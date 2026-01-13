<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Retro Rack | Order Management Portal</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="ManageOrder.css">
</head>
<body class="light-theme">

    <aside class="sidebar no-print">
        <div class="sidebar-logo">
            <img src="logo-retro.png" alt="Retro Rack" class="admin-logo" style="width: 100px; display: block; margin: 0 auto;">
        </div>
        <ul class="nav-menu">
            <li class="nav-item" onclick="window.location.href='dashboard.jsp'"><a><i class='bx bx-grid-alt'></i> Dashboard</a></li>
            <li class="nav-item active"><a><i class='bx bx-shopping-bag'></i> Manage Orders</a></li>
            <li class="nav-item" id="themeToggle"><a><i class='bx bx-moon'></i> <span class="theme-text">Dark Mode</span></a></li>
        </ul>
        
        <div class="sidebar-footer">
            <a href="admin.login.page.html" title="Logout">
                <i class='bx bx-log-out'></i>
            </a>
        </div>
    </aside>

        <main class="main-content">

        <!-- PRINT-ONLY REPORT HEADER -->
        <div class="print-only report-header">
            <h2>RETRO RACK - OFFICIAL ORDER REPORT</h2>
            <p id="printMeta"></p>
        </div>

        <!-- PAGE HEADER -->
        <header class="content-header no-print">
            <div class="header-title">
                <h1>Order Management</h1>
                <p class="subtitle">Search, filter, and process customer transactions.</p>
            </div>
            <div class="header-btns">
                <button class="btn-secondary" onclick="exportToCSV()"><i class='bx bx-export'></i> Export CSV</button>
                <button class="btn-primary" onclick="printReport()"><i class='bx bx-printer'></i> Print Report</button>
            </div>
        </header>

                <!-- ORDER TABLE SECTION -->
        <section class="table-container">
            <div class="filter-bar no-print">
                <div class="search-box">
                    <i class='bx bx-search'></i>
                    <input type="text" id="orderSearch" onkeyup="updateDisplay()" placeholder="Search Order ID or Customer...">
                </div>
                <div class="filter-options">
                    <label>Status:</label>
                    <select id="statusFilter" onchange="updateDisplay()" class="retro-select">
                        <option value="all">All Status</option>
                        <option value="completed">Completed</option>
                        <option value="processing">Processing</option>
                        <option value="cancelled">Cancelled</option>
                    </select>
                </div>
            </div>

            <div class="table-wrapper">
                <table class="product-table" id="orderTable">
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Date</th>
                            <th>Customer</th>
                            <th>Items</th>
                            <th>Total (RM)</th>
                            <th>Status</th>
                            <th class="no-print">Actions</th>
                        </tr>
                    </thead>
                    <tbody id="orderData">
                    
                    </tbody>
                </table>
            </div>

            <!-- PAGINATION FOOTER -->
            <div class="pagination no-print">
                <p>Showing <span id="entryCount">0</span> orders</p>
                <div class="pag-btns">
                    <button class="pag-btn" disabled><i class='bx bx-chevron-left'></i></button>
                    <button class="pag-btn"><i class='bx bx-chevron-right'></i></button>
                </div>
            </div>
        </section>
    </main>

        <!-- ORDER CANCELLATION CONFIRMATION MODAL -->
    <div id="cancelModal" class="modal-overlay">
        <div class="modal-card">
            <div class="modal-icon"><i class='bx bx-help-circle'></i></div>
            <h3>Cancel Order?</h3>
            <p>Are you sure you want to cancel this order? This action cannot be undone.</p>
            <div class="modal-actions">
                <button class="btn-back" onclick="closeCancelModal()">Back</button>
                <button class="btn-confirm-del" onclick="confirmCancel()">Confirm</button>
            </div>
        </div>
    </div>

    <script>
        // Mock order data for demonstration purposes
        let orderEntries = [
            { id: "#C001", date: "2025-12-20", cust: "Adam Haris", qty: 2, total: "100.00", status: "completed" },
            { id: "#C002", date: "2025-12-21", cust: "Siti Nur", qty: 1, total: "37.00", status: "processing" },
            { id: "#C003", date: "2025-12-22", cust: "Alia Aisyah", qty: 3, total: "165.00", status: "cancelled" },
            { id: "#C004", date: "2025-12-24", cust: "Adam Hazeer", qty: 1, total: "40.00", status: "completed" }
        ];

        // Stores the currently selected order ID
        let activeOrderId = null;

        // Update table display based on search and filter inputs
        function updateDisplay() {
            const searchTerm = document.getElementById('orderSearch').value.toLowerCase();
            const statusTerm = document.getElementById('statusFilter').value;
            const list = document.getElementById('orderData');

            const filtered = orderEntries.filter(o => {
                const matchSearch = o.id.toLowerCase().includes(searchTerm) || o.cust.toLowerCase().includes(searchTerm);
                const matchStatus = statusTerm === "all" || o.status === statusTerm;
                return matchSearch && matchStatus;
            });

            list.innerHTML = filtered.map(o => `
                <tr class="order-row">
                    <td><strong>${o.id}</strong></td>
                    <td>${o.date}</td>
                    <td>${o.cust}</td>
                    <td>${o.qty} pcs</td>
                    <td>${o.total}</td>
                    <td><span class="status-badge ${o.status}">${o.status}</span></td>
                    <td class="no-print">
                        <div class="action-grid">
                            <button class="tool-btn" data-tip="View" onclick="alert('Viewing Details for ' + '${o.id}')"><i class='bx bx-show'></i></button>
                            <button class="tool-btn" data-tip="Print" onclick="window.print()"><i class='bx bx-printer'></i></button>
                            <button class="tool-btn del" data-tip="Cancel" onclick="openCancelModal('${o.id}')"><i class='bx bx-x-circle'></i></button>
                        </div>
                    </td>
                </tr>
            `).join('');

            document.getElementById('entryCount').innerText = filtered.length;
        }

        // Open the cancellation confirmation modal
        function openCancelModal(id) {
            activeOrderId = id;
            document.getElementById('cancelModal').classList.add('active');
        }

                // Close the cancellation confirmation modal
        function closeCancelModal() {
            document.getElementById('cancelModal').classList.remove('active');
        }

        // Confirm order cancellation and update status
        function confirmCancel() {
            orderEntries = orderEntries.map(o => o.id === activeOrderId ? {...o, status: 'cancelled'} : o);
            updateDisplay();
            closeCancelModal();
            alert(`Order ${activeOrderId} has been successfully cancelled.`);
        }

        // Prepare and print the order report
        function printReport() {
            document.getElementById('printMeta').innerText =
                `Admin: RetroAdmin_01 | Date Generated: ${Date().toLocaleString()}`;
            window.print();
        }

        // Export order data to CSV format (placeholder)
        function exportToCSV() {
            alert("Generating CSV export. This may take a moment...");
        }

        // Dark mode toggle logic
        const themeBtn = document.getElementById('themeToggle');
        themeBtn.onclick = () => {
            document.body.classList.toggle('dark-theme');
            const isDark = document.body.classList.contains('dark-theme');
            themeBtn.querySelector('i').className = isDark ? 'bx bx-sun' : 'bx bx-moon';
            themeBtn.querySelector('.theme-text').innerText = isDark ? 'Light Mode' : 'Dark Mode';
        };

        // Initial page load setup
        window.onload = updateDisplay;

        // Close modal when clicking outside of it
        window.onclick = (e) => {
            if (e.target.classList.contains('modal-overlay')) closeCancelModal();
        };

        // Close modal when Escape key is pressed
        window.onkeydown = (e) => {
            if (e.key === "Escape") closeCancelModal();
        };
    </script>
</body>
</html>