package ee.taltech.java.dao;

import java.sql.ResultSet;
//import java.util.ArrayList;

import ee.taltech.java.dbconfig.BasicDBAccessCloud;
import ee.taltech.java.model.Project;

public class ProjectDao {
	public ResultSet registerProject(Project project) throws ClassNotFoundException  {
		String INSERT_SQL = "INSERT INTO projects" +
	            " (name, created_by, is_deleted) VALUES " +
	            " ('" + project.getName() + "', '" + project.getCreated_by() + "', '" + project.isIs_deleted() + "');";

		BasicDBAccessCloud q1 = new BasicDBAccessCloud(INSERT_SQL);
		ResultSet queryResult = q1.executeQuery();
		
//		int isSuccess = queryResult == null ? 1 : 0 ;  
		
		return queryResult;
	}
	
	public ResultSet showProjects() throws ClassNotFoundException  {
		String SELECT_SQL = "SELECT *, users.id AS userid FROM projects, users WHERE users.id = projects.created_by;";
		BasicDBAccessCloud q1 = new BasicDBAccessCloud(SELECT_SQL);
		ResultSet queryResult = q1.executeQuery();
		return queryResult;
	}
	
	public ResultSet showProjectsByUserId(String user_id) throws ClassNotFoundException  {
		String SELECT_SQL = "SELECT * FROM projects, users, assigned_table WHERE assigned_table.project_id = projects.id AND users.id = projects.created_by AND assigned_table.user_id = '" + user_id + "';";
		BasicDBAccessCloud q1 = new BasicDBAccessCloud(SELECT_SQL);
		ResultSet queryResult = q1.executeQuery();
		return queryResult;
	}
	
	public ResultSet countProjects() throws ClassNotFoundException  {
		String SELECT_SQL = "SELECT COUNT(*) FROM projects;";
		BasicDBAccessCloud q1 = new BasicDBAccessCloud(SELECT_SQL);
		ResultSet queryResult = q1.executeQuery();
		return queryResult;
	}
	
	public ResultSet showProjectsByProjectId(String project_id) throws ClassNotFoundException  {
		String SELECT_SQL = "SELECT * FROM assigned_table, projects WHERE projects.id = assigned_table.project_id AND assigned_table.project_id = '"+ project_id +"';";
		BasicDBAccessCloud q1 = new BasicDBAccessCloud(SELECT_SQL);
		ResultSet queryResult = q1.executeQuery();
		return queryResult;
	}
}
