package ee.taltech.java.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ee.taltech.java.dao.UserDao;
import ee.taltech.java.model.PasswordManager;
import ee.taltech.java.model.User;

/**
 * Servlet implementation class NewUser
 */
@WebServlet("/signup")
public class NewUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("title", "Sign Up");
		int countedLecturer = 0;
		try {
			UserDao user = new UserDao();
			ResultSet usrCount = user.countUsersByRole(1);
			while (usrCount.next()){
				countedLecturer = Integer.valueOf(usrCount.getString("count"));	
			}
		} catch (ClassNotFoundException e){
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(countedLecturer < 1){
			try {
				UserDao user = new UserDao();
				ResultSet usr = user.getAllUsersRole();
				request.setAttribute("roleData", usr);
			} catch (ClassNotFoundException e){
				
			}
		}
		else {
			try {
				UserDao user = new UserDao();
				ResultSet usr = user.getStudentRole();
				request.setAttribute("roleData", usr);
			} catch (ClassNotFoundException e){
				
			}
		}
		
		
		request.getRequestDispatcher("/WEB-INF/views/signup.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String first_name = request.getParameter("first_name");
		String last_name = request.getParameter("last_name");
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String role_id = request.getParameter("role_id");
		String encrypted = "";
		
		
    	try {
    		UserDao userDaoC = new UserDao();
			ResultSet existsUser = userDaoC.getUsersbyEmail(email);
			if(existsUser.isBeforeFirst()){
				request.setAttribute("is_success", 0);
				request.setAttribute("message", "Email is already registered, Please login!");
				request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
			}
			else {
				try {
					PasswordManager pw = new PasswordManager();
					encrypted = pw.encrypt(password);
					
					User user = new User(first_name, last_name, username, email, encrypted, role_id, "false");
					
					try {
			        	UserDao userDao = new UserDao();
			        	ResultSet newUser = userDao.registerUser(user);
			        	try {
				        	UserDao userDao1 = new UserDao();
				        	ResultSet authenticatedUser = userDao1.authenticateUser(email, encrypted);
				        	
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
					} catch (ClassNotFoundException e) {
						e.printStackTrace();
						request.setAttribute("is_success", 0);
						request.setAttribute("message", "Authentication & Signup Failed!");
						request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
					}
				} catch (Exception e1) {
					e1.printStackTrace();
					request.setAttribute("is_success", 0);
					request.setAttribute("message", "Something went wrong!!");
					request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
				}
			}
		} catch (ClassNotFoundException e2) {
			e2.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}

}
