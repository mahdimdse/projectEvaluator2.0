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

import ee.taltech.java.dao.AspectsDao;
import ee.taltech.java.dao.ProjectDao;

/**
 * Servlet implementation class ScoreServlet
 */
@WebServlet("/scores")
public class ScoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ScoreServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("title", "Scores");
		try {
        	ProjectDao projectDao = new ProjectDao();
        	ResultSet prjct = projectDao.showProjects();
        	request.setAttribute("data", prjct);
        	
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		try {
			AspectsDao aspectDao = new AspectsDao();
        	ResultSet countAspects = aspectDao.countAspects();
        	while (countAspects.next()){
        		String countedAspect = countAspects.getString("count");
        		request.setAttribute("totalSum", Integer.parseInt(countedAspect)*10);
        	}        	
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/scores.jsp");
        dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
