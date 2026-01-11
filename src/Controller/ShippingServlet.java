package Controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/ShippingServlet")
public class ShippingServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        String fullName = request.getParameter("custName");
        String phone = request.getParameter("custPhone");
        String address = request.getParameter("custAddress");

        String subtotal = request.getParameter("subtotal");
        String shippingFee = request.getParameter("shippingFee");
        String finalTotal = request.getParameter("finalTotal");

        session.setAttribute("shippingName", fullName);
        session.setAttribute("shippingPhone", phone);
        session.setAttribute("shippingAddress", address);

        session.setAttribute("subtotal", subtotal);
        session.setAttribute("shippingFee", shippingFee);
        session.setAttribute("finalTotal", finalTotal);

        response.sendRedirect(request.getContextPath() + "/payment.jsp");

    }
}