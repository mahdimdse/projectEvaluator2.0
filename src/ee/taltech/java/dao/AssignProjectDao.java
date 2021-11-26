package ee.taltech.java.dao;

import java.sql.ResultSet;

import ee.taltech.java.dbconfig.BasicDBAccessCloud;
import ee.taltech.java.model.AssignProject;

public class AssignProjectDao {
	public int assignProject(AssignProject assignm) throws ClassNotFoundException  {
//		Delete old data
		String DELETE_SQL = "DELETE FROM assigned_table" +
	            " WHERE user_id =" + assignm.getUser_id() + ";";

		BasicDBAccessCloud de = new BasicDBAccessCloud(DELETE_SQL);
		ResultSet deletResult = de.executeQuery();
		
		String INSERT_SQL = "INSERT INTO assigned_table" +
	            " (project_id, user_id) VALUES " +
	            " ('" + assignm.getProject_id() + "', '" + assignm.getUser_id() + "');";

		BasicDBAccessCloud q1 = new BasicDBAccessCloud(INSERT_SQL);
		ResultSet queryResult = q1.executeQuery();
		
		int isSuccess = queryResult == null ? 1 : 0 ;  
		
		return isSuccess;
	}
	
	public ResultSet showProjectsByUserId(String user_id) throws ClassNotFoundException  {
		String SELECT_SQL = "SELECT projects.* FROM assigned_table, projects WHERE assigned_table.user_id = '"+ user_id +"';";
		BasicDBAccessCloud q1 = new BasicDBAccessCloud(SELECT_SQL);
		ResultSet queryResult = q1.executeQuery();
		return queryResult;
	}

}
