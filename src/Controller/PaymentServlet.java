package Controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import model.Cart;
import model.Order;
import model.User;
import util.FileHandler;
import java.io.IOException;
import java.util.UUID;

@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        User user = (User) session.getAttribute("currentUser");

        if (cart != null && user != null) {
            // 1. Create Order ID
            String orderID = "ORD-" + UUID.randomUUID().toString().substring(0, 8);

            // 2. Create Order Object
            Order newOrder = new Order(orderID, cart);
            newOrder.setStatus("Paid");

            // 3. Save to "Database"
            FileHandler fh = new FileHandler();
            fh.saveOrder(newOrder, user.getUserID());

            // 4. Clear the Cart
            cart.clearCart();
            session.setAttribute("cart", cart); // Update session

            // 5. Pass Order ID to success page
            request.setAttribute("orderID", orderID);
            request.getRequestDispatcher("success.jsp").forward(request, response);
        } else {
            response.sendRedirect("index.jsp");
        }
    }
}