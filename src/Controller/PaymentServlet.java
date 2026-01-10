package Controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fullName = request.getParameter("fullName");
        String address = request.getParameter("address");
        String cardNum = request.getParameter("cardNum");

        HttpSession session = request.getSession();
        session.setAttribute("fullName", fullName);
        session.setAttribute("address", address);

        response.sendRedirect("success.html");
    }
}
