package Controller;

import model.User;
import util.FileHandler;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.UUID;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        // In a real app, hash the password here!

        // Generate a unique ID
        String userID = "U" + UUID.randomUUID().toString().substring(0, 5);

        User newUser = new User(userID, username, email, password, "Customer");

        FileHandler fh = new FileHandler();
        boolean isSaved = fh.saveUser(newUser);

        // Redirect to login with success message
        if (isSaved) {
            // Success: Go to login
            response.sendRedirect("login.jsp?status=registered");
        } else {
            // Failure: Stay on register page and show error
            response.sendRedirect("register.jsp?status=error");
        }
    }
}