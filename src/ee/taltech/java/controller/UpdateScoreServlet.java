package ee.taltech.java.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ee.taltech.java.dao.ProjectDao;

/**
 * Servlet implementation class UpdateScoreServlet
 */
@WebServlet("/updateScore")
public class UpdateScoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public UpdateScoreServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String status = "0";
		HttpSession session = request.getSession(false);
		String scoreTo = request.getParameter("userid");
		String score = request.getParameter("score");
		String aspectid = request.getParameter("aspectid");
		String scoreBy = (String)session.getAttribute("user_id");
		
		ProjectDao projectDao = new ProjectDao();
		
		try {
			projectDao.updateScore(score, scoreTo, scoreBy, aspectid);
			status = "1";
		}
		catch (ClassNotFoundException e){
			e.printStackTrace();
		}
		response.getWriter().append(status);
	}


}
