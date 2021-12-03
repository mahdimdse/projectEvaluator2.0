package ee.taltech.java.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ee.taltech.java.dao.AspectsDao;
import ee.taltech.java.dao.UserDao;

/**
 * Servlet implementation class SortedScoreServlet
 */
@WebServlet("/scoressorted")
public class SortedScoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SortedScoreServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("title", "Scores");
		
		try {
        	UserDao userDao = new UserDao();
        	ResultSet scrs = userDao.getScorebyUserSorted();
        	request.setAttribute("scoreData", scrs);
        	
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
		request.getRequestDispatcher("/WEB-INF/views/scoressorted.jsp").forward(request, response);
	}

}
