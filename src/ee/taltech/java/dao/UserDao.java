package ee.taltech.java.dao;

import java.sql.ResultSet;

import ee.taltech.java.dbconfig.BasicDBAccessCloud;
import ee.taltech.java.model.User;

public class UserDao {
	public ResultSet registerUser(User user) throws Exception  {
		String INSERT_SQL = "INSERT INTO users" +
	            " (first_name, last_name, username, email, password, role_id, is_deleted) VALUES " +
	            " ('" + user.getFirst_name() + "', '" + user.getLast_name() + "', '" + user.getUsername() + "', '" + user.getEmail() + "', '" + user.getPassword() + "', '" + user.getRole_id() + "', '" + user.getIs_deleted() + "');";

		BasicDBAccessCloud q1 = new BasicDBAccessCloud(INSERT_SQL);
		ResultSet queryResult = q1.executeQuery();  
		return queryResult;
	}
	
	public ResultSet authenticateUser(String email, String password) throws ClassNotFoundException  {
		String SELECT_SQL = "SELECT * FROM users WHERE email = '" + email + "' AND password = '" + password + "';";
		BasicDBAccessCloud q1 = new BasicDBAccessCloud(SELECT_SQL);
		ResultSet queryResult = q1.executeQuery();
		return queryResult;
	}
	
	public ResultSet getUsersbyId(int id) throws ClassNotFoundException  {
		String SELECT_SQL = "SELECT * FROM users WHERE id = '" + id + "';";
		BasicDBAccessCloud q1 = new BasicDBAccessCloud(SELECT_SQL);
		ResultSet queryResult = q1.executeQuery();
		return queryResult;
	}
	
	public ResultSet getAllUsersByRole(int role_id) throws ClassNotFoundException  {
		String SELECT_SQL = "SELECT * FROM users WHERE role_id = '" + role_id + "';";
		BasicDBAccessCloud q1 = new BasicDBAccessCloud(SELECT_SQL);
		ResultSet queryResult = q1.executeQuery();
		return queryResult;
	}
	
	public ResultSet getAllUsersRole() throws ClassNotFoundException  {
		String SELECT_SQL = "SELECT * FROM user_role;";
		BasicDBAccessCloud q1 = new BasicDBAccessCloud(SELECT_SQL);
		ResultSet queryResult = q1.executeQuery();
		return queryResult;
	}
	
	public ResultSet getStudentRole() throws ClassNotFoundException  {
		String SELECT_SQL = "SELECT * FROM user_role WHERE id = 2;";
		BasicDBAccessCloud q1 = new BasicDBAccessCloud(SELECT_SQL);
		ResultSet queryResult = q1.executeQuery();
		return queryResult;
	}
	
	public ResultSet countUsersByRole(int role_id) throws ClassNotFoundException  {
		String SELECT_SQL = "SELECT COUNT(*) FROM users WHERE role_id = '" + role_id + "';";
		BasicDBAccessCloud q1 = new BasicDBAccessCloud(SELECT_SQL);
		ResultSet queryResult = q1.executeQuery();
		return queryResult;
	}
	
	public ResultSet getUsersbyEmail(String email) throws ClassNotFoundException  {
		String SELECT_SQL = "SELECT * FROM users WHERE email = '" + email + "';";
		BasicDBAccessCloud q1 = new BasicDBAccessCloud(SELECT_SQL);
		ResultSet queryResult = q1.executeQuery();
		return queryResult;
	}
	
	public ResultSet getScorebyUserSorted() throws ClassNotFoundException  {
		String SELECT_SQL = "SELECT users.id as userid, users.first_name, users.last_name, projects.id as projectid, projects.name, SUM(scores.score) as scored FROM users, projects, scores, assigned_table WHERE scores.score_to = users.id AND assigned_table.project_id = projects.id AND assigned_table.user_id = users.id GROUP BY projects.id, users.id ORDER BY scored DESC;";
		BasicDBAccessCloud q1 = new BasicDBAccessCloud(SELECT_SQL);
		ResultSet queryResult = q1.executeQuery();
		return queryResult;
	}
}
