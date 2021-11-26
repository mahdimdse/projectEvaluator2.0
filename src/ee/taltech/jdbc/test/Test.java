package ee.taltech.jdbc.test;

import java.sql.ResultSet;
//import java.util.ArrayList;

import ee.taltech.java.dbconfig.BasicDBAccessCloud;

public class Test {

	public static void main(String[] args) {
		BasicDBAccessCloud q1 = new BasicDBAccessCloud("SELECT * FROM projects;");
		ResultSet queryResult = q1.executeQuery();
		String jsonText = queryResult.toString();  
		System.out.print(jsonText);
	}

}
