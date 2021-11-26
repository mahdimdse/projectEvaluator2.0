package ee.taltech.java.dbconfig;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

//import org.json.JSONArray;
//import org.json.JSONObject;
//
//import java.util.ArrayList;



public class BasicDBAccessCloud {
	private String query;

	public BasicDBAccessCloud(String query) {
		super();
		this.query = query;
		
	}
	
	public ResultSet executeQuery(){
		Connection c = null;
		
//		ArrayList<JSONArray> finalResult = new ArrayList<JSONArray>();
		ResultSet finalResult = null;
		
		try {
			String url = "jdbc:postgresql://fanny.db.elephantsql.com:5432/szciskhb";
			String username = "szciskhb";
			String password = "lgDSwcV5rc9w1xVzPBYMoSl6H_sAwiRA";
			Class.forName("org.postgresql.Driver");

	        c = DriverManager.getConnection(url, username, password);
	        c.setAutoCommit(false);
	        
	        Statement selectStatement = c.createStatement(
        			ResultSet.TYPE_SCROLL_SENSITIVE,
        			ResultSet.CONCUR_READ_ONLY
            	);
	        
	        // READ DATA
	        
	        if((this.query).contains("INSERT") | (this.query).contains("UPDATE") | (this.query).contains("DELETE")){
//	        	selectStatement.executeUpdate(
//        		this.query
//    		   );
	        	String[] returnId = { "id" };
	        	PreparedStatement statement = c.prepareStatement(this.query, returnId);
	        	int affectedRows = statement.executeUpdate();
	        	if (affectedRows == 0) {
	        	    
	        	}

	        	ResultSet rs = statement.getGeneratedKeys();
	        	    if (rs.next()) {
//	        	        System.out.println(rs.getInt(1)); // the insert id
	        	        finalResult = rs;
	        	    }
//	        	    rs.close();
	        	

	        	
	        }
	        else {
	        	ResultSet resultSet = selectStatement.executeQuery(
		        		this.query
		    		   );
	        	resultSet.beforeFirst();
	        	finalResult = resultSet;
	        }
        
	       
            selectStatement.close();
            c.commit();
            c.close();

		} catch (Exception e) {
			e.printStackTrace();
	        System.err.println(e.getClass().getName() +": " + e.getMessage());
	        System.exit(0);
		}
		
		return finalResult;
	}
	
//	public JSONArray convertToJSONArray(ResultSet resultSet)
//            throws Exception {
//        JSONArray jsonArray = new JSONArray();
//        while (resultSet.next()) {
//            JSONObject obj = new JSONObject();
//            int total_rows = resultSet.getMetaData().getColumnCount();
//            for (int i = 0; i < total_rows; i++) {
//                obj.put(resultSet.getMetaData().getColumnLabel(i + 1)
//                        .toLowerCase(), resultSet.getObject(i + 1));
//
//            }
//            jsonArray.put(obj);
//        }
//        return jsonArray;
//    }
	
}
