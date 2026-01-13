package Controller;

import model.User;
import util.FileHandler;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String user = request.getParameter("username");
        String pass = request.getParameter("password");

        FileHandler fh = new FileHandler();
        User validUser = fh.validateUser(user, pass);

        if (validUser != null) {
            // LOGIN SUCCESS: Create Session
            HttpSession session = request.getSession();
            session.setAttribute("currentUser", validUser);
            session.setAttribute("isLoggedIn", true);

            // Check Role and Redirect accordingly
            if ("Admin".equalsIgnoreCase(validUser.getRole()))
            {
                // If Admin -> Go to Admin Dashboard
                response.sendRedirect("adminSide/dashboard.jsp");
            }
            else
            {
                // If Customer -> Go to Main Homepage
                response.sendRedirect("index.jsp");
            }
        }
    }
}
