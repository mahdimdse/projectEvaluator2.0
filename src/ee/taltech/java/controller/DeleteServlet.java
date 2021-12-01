package ee.taltech.java.controller;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ee.taltech.java.dbconfig.BasicDBAccessCloud;

/**
 * Servlet implementation class DeleteServlet
 */
@WebServlet("/delete")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String isSuccess;
		String table_name = request.getParameter("table");
		String rec_id = request.getParameter("rec_id");
		if(table_name.equals("evaluation_aspect")){
			String PRE_DELETE_SQL = "DELETE FROM scores WHERE aspect_id = '" + rec_id + "';";
			BasicDBAccessCloud q = new BasicDBAccessCloud(PRE_DELETE_SQL);
			q.executeQuery();
		}
		String DELETE_SQL = "DELETE FROM " + table_name + " WHERE id = '" + rec_id + "';";
		BasicDBAccessCloud q1 = new BasicDBAccessCloud(DELETE_SQL);
		ResultSet queryResult = q1.executeQuery();
		
		isSuccess = queryResult == null ? "1" : "0" ;  
		
		response.getWriter().append(isSuccess);
	}

}
