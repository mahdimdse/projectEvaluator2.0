package ee.taltech.java.controller;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ee.taltech.java.dao.AssignProjectDao;
import ee.taltech.java.dao.UserDao;
import jdk.nashorn.internal.ir.Assignment;

/**
 * Servlet implementation class StudentDetailsServlet
 */
@WebServlet("/studentdetails")
public class StudentDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentDetailsServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int student_id = Integer.valueOf(request.getParameter("id"));
		request.setAttribute("title", "Students");
		
		UserDao userDao = new UserDao();
    	ResultSet students;
		try {
			students = userDao.getUsersbyId(student_id);
			request.setAttribute("dataStudents", students);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		AssignProjectDao  asignDao = new AssignProjectDao();
    	ResultSet projects;
		try {
			projects = asignDao.showProjectsByUserId(request.getParameter("id"));
			request.setAttribute("dataProjects", projects);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/studentDetail.jsp");
        dispatcher.forward(request, response);
	}

}
