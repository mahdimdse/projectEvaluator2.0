package ee.taltech.java.controller;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ee.taltech.java.dao.AspectsDao;
import ee.taltech.java.model.Aspects;


/**
 * Servlet implementation class AspectsServlet
 */
@WebServlet("/aspects")
public class AspectsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AspectsServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("title", "Aspects");
		
		AspectsDao aspectDao = new AspectsDao();
    	ResultSet aspcts;
		try {
			aspcts = aspectDao.showAspects();
			request.setAttribute("dataAspects", aspcts);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/aspects.jsp");
        dispatcher.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String name = request.getParameter("name");
        String created_by = (String)session.getAttribute("user_id");
        String is_deleted = "false";
        
        Aspects aspct = new Aspects(name, created_by, is_deleted);
        
        try {
        	AspectsDao aspectDao = new AspectsDao();
        	aspectDao.registerAspects(aspct);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
        
        request.setAttribute("is_success", 1);
        request.setAttribute("message", "Successfully Created");
        doGet(request, response);
	}

}
