package ee.taltech.java.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogoutServlet
 */
@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogoutServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		session.removeAttribute("user_id");
		session.removeAttribute("first_name");
		session.removeAttribute("last_name");
		session.removeAttribute("role_id");
		
		request.setAttribute("is_success", 0);
		request.setAttribute("message", "Successfully Logged Out!");
		request.setAttribute("title", "Login");
		request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
	}

}
