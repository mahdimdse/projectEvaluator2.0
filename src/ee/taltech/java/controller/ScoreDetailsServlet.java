package ee.taltech.java.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ee.taltech.java.dbconfig.BasicDBAccessCloud;

/**
 * Servlet implementation class ScoreDetailsServlet
 */
@WebServlet("/scoreDetails")
public class ScoreDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ScoreDetailsServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String project_id = request.getParameter("project_id");
		String user_id = request.getParameter("user_id");
		String htmlWrite = "<thead><tr><th>Aspect</th><th>Score</th></tr><thead><tbody>";
		
		String EA_SQL = "SELECT evaluation_aspect.name, evaluation_aspect.id, COALESCE(scores.score, 0) as score FROM evaluation_aspect FULL OUTER JOIN scores ON scores.aspect_id = evaluation_aspect.id WHERE scores.score_to = '" + user_id + "';";
		BasicDBAccessCloud q2 = new BasicDBAccessCloud(EA_SQL);
		ResultSet aspectResult = q2.executeQuery();
		String evaluatedIds = "";
		try {
			aspectResult.beforeFirst();
			while (aspectResult.next()){
				evaluatedIds += ","+aspectResult.getString("id");
				htmlWrite += "<tr><td>" + aspectResult.getString("name") + "</td><td>" + makeDropdown(aspectResult.getString("score"), user_id, aspectResult.getString("id")) + "</td></tr>";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		evaluatedIds = evaluatedIds.startsWith(",") ? evaluatedIds.substring(1) : evaluatedIds;
		
		if(evaluatedIds.equals("")){
			String NEA_SQL = "SELECT evaluation_aspect.name, evaluation_aspect.id FROM evaluation_aspect;";
			BasicDBAccessCloud q3 = new BasicDBAccessCloud(NEA_SQL);
			ResultSet naspectResult = q3.executeQuery();
			try {
				naspectResult.beforeFirst();
				while (naspectResult.next()){
					htmlWrite += "<tr><td>" + naspectResult.getString("name") + "</td><td>" + makeDropdown("0", user_id, naspectResult.getString("id")) + "</td></tr>";
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		else {
			String NEA_SQL = "SELECT evaluation_aspect.name, evaluation_aspect.id FROM evaluation_aspect WHERE evaluation_aspect.id NOT IN ("+evaluatedIds+");";
			BasicDBAccessCloud q3 = new BasicDBAccessCloud(NEA_SQL);
			ResultSet naspectResult = q3.executeQuery();
			try {
				naspectResult.beforeFirst();
				while (naspectResult.next()){
					htmlWrite += "<tr><td>" + naspectResult.getString("name") + "</td><td>" + makeDropdown("0", user_id, naspectResult.getString("id")) + "</td></tr>";
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		htmlWrite += "</tbody>";
		
		response.getWriter().append(htmlWrite);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private String makeDropdown(String selectedValue, String user_id, String aspect_id){
		String selectHtml = "<select data-userid="+user_id+" data-aspectid="+aspect_id+" class='form-control form-control-sm changeScore'>";
		for(int i=0;i<=10;i++){
			String isSelected = "";
			if(selectedValue.equals(String.valueOf(i))) {
				isSelected = "selected";
			}
			selectHtml += "<option value='"+i+"' "+isSelected+">"+i+"</option>";
		}
		selectHtml += "</select>";
		return selectHtml;
	}

}
