package ee.taltech.java.dao;

import java.sql.ResultSet;

import ee.taltech.java.dbconfig.BasicDBAccessCloud;
import ee.taltech.java.model.Aspects;

public class AspectsDao {
	public int registerAspects(Aspects aspect) throws ClassNotFoundException  {
		String INSERT_SQL = "INSERT INTO evaluation_aspect" +
	            " (name, created_by, is_deleted) VALUES " +
	            " ('" + aspect.getName() + "', '" + aspect.getCreated_by() + "', '" + aspect.isIs_deleted() + "');";

		System.out.println(INSERT_SQL);
		BasicDBAccessCloud q1 = new BasicDBAccessCloud(INSERT_SQL);
		ResultSet queryResult = q1.executeQuery();
		
		int isSuccess = queryResult == null ? 1 : 0 ;  
		
		return isSuccess;
	}
	
	public ResultSet showAspects() throws ClassNotFoundException  {
		String SELECT_SQL = "SELECT evaluation_aspect.name, evaluation_aspect.created_at, users.first_name, users.last_name FROM evaluation_aspect, users WHERE users.id = evaluation_aspect.created_by;";
		BasicDBAccessCloud q1 = new BasicDBAccessCloud(SELECT_SQL);
		ResultSet queryResult = q1.executeQuery();
		return queryResult;
	}
	
	public ResultSet countAspects() throws ClassNotFoundException  {
		String SELECT_SQL = "SELECT COUNT(*) FROM evaluation_aspect;";
		BasicDBAccessCloud q1 = new BasicDBAccessCloud(SELECT_SQL);
		ResultSet queryResult = q1.executeQuery();
		return queryResult;
	}
}
