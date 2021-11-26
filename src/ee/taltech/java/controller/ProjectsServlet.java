package ee.taltech.java.controller;

import java.io.IOException;
import java.sql.ResultSet;
//import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ee.taltech.java.dao.ProjectDao;

/**
 * Servlet implementation class Projects
 */
@WebServlet("/projects")
public class ProjectsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProjectsServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("title", "Projects");
		try {
        	ProjectDao projectDao = new ProjectDao();
        	ResultSet prjct = projectDao.showProjects();
        	request.setAttribute("data", prjct);
        	
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/projects.jsp");
        dispatcher.forward(request, response);
	}

}
