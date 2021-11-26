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

import ee.taltech.java.dao.AssignProjectDao;
import ee.taltech.java.dao.ProjectDao;
import ee.taltech.java.model.AssignProject;
import ee.taltech.java.model.PasswordManager;
import ee.taltech.java.model.Project;

/**
 * Servlet implementation class ProjectServlet
 */
@WebServlet("/newproject")
public class NewProjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
//	private ProjectDao projectDao = new ProjectDao();

    /**
     * Default constructor. 
     */
    public NewProjectServlet() {
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("title", "Project");
		
		HttpSession session = request.getSession(false);
        String created_by = (String) session.getAttribute("user_id");
		try {
			AssignProjectDao projectDao = new AssignProjectDao();
			ResultSet oldEntry = projectDao.showProjectsByUserId(created_by);
			oldEntry.beforeFirst();
			while (oldEntry.next()){
				PasswordManager pw = new PasswordManager();
				String oldEntryId = pw.encrypt(oldEntry.getString("id"));
				request.setAttribute("assigned_project", oldEntryId);
				request.setAttribute("assigned_project_name", oldEntry.getString("name"));
			}
			 
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/projectregister.jsp");
        dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String name = request.getParameter("name");
        String created_by = (String) session.getAttribute("user_id");
        String is_deleted = "false";
        
        if(projectExists(name) == null){
        	Project project = new Project(name, created_by, is_deleted);
            
            try {
            	ProjectDao projectDao = new ProjectDao();
    			ResultSet newEntry = projectDao.registerProject(project);
    			
    			try {
    				int newRecordId = newEntry.getInt(1);
    				AssignProject newAssign = new AssignProject(String.valueOf(newRecordId), created_by);
    				AssignProjectDao assingProjectDao = new AssignProjectDao();
    				assingProjectDao.assignProject(newAssign);
    				
    			} catch (SQLException e) {
    				e.printStackTrace();
    			} catch (Exception e) {
    				e.printStackTrace();
    			}
    			 
    		} catch (ClassNotFoundException e) {
    			e.printStackTrace();
    		}
        }
        else {
        	AssignProject newAssign = new AssignProject(projectExists(name), created_by);
			AssignProjectDao assingProjectDao = new AssignProjectDao();
			try {
				assingProjectDao.assignProject(newAssign);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
        }
        
        
        response.sendRedirect("newproject");
	}
	
	public String projectExists(String nameOrEncId){
		String project = null;
		PasswordManager pw;
		try {
			pw = new PasswordManager();
			String oldEntryId = pw.decryptInt(nameOrEncId);
			
			ProjectDao projectDao = new ProjectDao();
			ResultSet projectFound = projectDao.showProjectsByProjectId(oldEntryId);
			if (projectFound.next() ) {
				project = oldEntryId;
			} 			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return project;
	}

}
