package Controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import model.Cart;
import java.io.IOException;

@WebServlet("/RemoveItemServlet")
public class RemoveItemServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String pid = request.getParameter("productId");

        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart != null && pid != null) {
            cart.removeItem(pid);
            session.setAttribute("cart", cart);
        }

        response.sendRedirect("cart.jsp");
    }
}