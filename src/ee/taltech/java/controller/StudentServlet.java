package ee.taltech.java.controller;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ee.taltech.java.dao.AspectsDao;
import ee.taltech.java.dao.UserDao;

/**
 * Servlet implementation class StudentServlet
 */
@WebServlet("/students")
public class StudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    public StudentServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("title", "Students");
		
		UserDao userDao = new UserDao();
    	ResultSet students;
		try {
			students = userDao.getAllUsersByRole(2);
			request.setAttribute("dataStudents", students);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/students.jsp");
        dispatcher.forward(request, response);
	}

}
