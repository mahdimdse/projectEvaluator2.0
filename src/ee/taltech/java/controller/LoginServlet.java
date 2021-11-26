package ee.taltech.java.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ee.taltech.java.dao.UserDao;
import ee.taltech.java.model.PasswordManager;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("title", "Login");
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/login.jsp");
        dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String encrypted = "";
		
		try {
			PasswordManager pw = new PasswordManager();
			encrypted = pw.encrypt(password);
			try {
	        	UserDao userDao = new UserDao();
	        	ResultSet authenticatedUser = userDao.authenticateUser(email, encrypted);
	        	
	        	try {
					if (authenticatedUser.next()){
						HttpSession session = request.getSession(true);
						session.setAttribute("user_id", authenticatedUser.getString("id"));
						session.setAttribute("first_name", authenticatedUser.getString("first_name"));
						session.setAttribute("last_name", authenticatedUser.getString("last_name"));
						session.setAttribute("role_id", authenticatedUser.getString("role_id"));
						
						
						request.setAttribute("is_success", 1);
						request.setAttribute("message", "Successfully Logged In!");
						
						response.sendRedirect("dashboard");
					}
					else {
						request.setAttribute("is_success", 0);
						request.setAttribute("message", "Email or Password Wrong!");
						request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
					}
				} catch (SQLException e) {
					e.printStackTrace();
					
					request.setAttribute("is_success", 0);
					request.setAttribute("message", "SQL Error Occurred!");
					request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
				}
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
				request.setAttribute("is_success", 0);
				request.setAttribute("message", "Authentication Failed!");
				request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
			}
		} catch (Exception e1) {
			e1.printStackTrace();
			request.setAttribute("is_success", 0);
			request.setAttribute("message", "Something went wrong!!");
			request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
		}                
	}

}
