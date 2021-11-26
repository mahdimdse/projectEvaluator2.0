package ee.taltech.java.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ee.taltech.java.dao.ProjectDao;
import ee.taltech.java.model.Project;

/**
 * Servlet implementation class NewAspectsServlet
 */
@WebServlet("/newaspects")
public class NewAspectsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewAspectsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/aspectregister.jsp");
        dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String name = request.getParameter("name");
		String created_by = (String) session.getAttribute("role_id");
        String is_deleted = "false";
        
        Project project = new Project(name, created_by, is_deleted);
        
        try {
        	ProjectDao projectDao = new ProjectDao();
			projectDao.registerProject(project);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
        
        response.sendRedirect("aspects");
	}

}
