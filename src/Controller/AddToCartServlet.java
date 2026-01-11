package Controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import model.Cart;
import model.Product;
import java.io.IOException;

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String pid = request.getParameter("productId");
        String qtyString = request.getParameter("quantity");
        int qty = (qtyString != null) ? Integer.parseInt(qtyString) : 1;

        String productName = "Unknown Item";
        double price = 0.0;

        if (pid != null) {
            switch (pid) {
                case "P001": productName = "Slim Woman Dress"; price = 45.00; break;
                case "P002": productName = "90s Brown T-shirt"; price = 40.00; break;
                case "P003": productName = "Vintage Brown Jacket"; price = 50.00; break;
                case "P004": productName = "Grey Palazzo"; price = 55.00; break;
                case "P005": productName = "Men Polo Shirt"; price = 45.00; break;
                case "P006": productName = "Woman Elegant Skirt"; price = 37.00; break;
            }
        }

        Product p = new Product(pid, productName, "Apparel", price, 100);

        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        cart.addItem(p, qty);

        //response.sendRedirect("cart.jsp");
        response.sendRedirect("products.jsp?added=" + pid);
    }
}