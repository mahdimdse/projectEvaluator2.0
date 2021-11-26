<%@ include file="template/dashboardHeader.jsp"%>
<%@ include file="template/sideBar.jsp"%>
<%@ page import="java.sql.ResultSet" %> 
<%@ page import="java.util.ArrayList" %> 
<%@ page import="ee.taltech.java.dbconfig.BasicDBAccessCloud" %> 

<main>
  <section id="main" class="main table-involved table-involved-full">
  		<h4>${title}</h4>
       <div class="table-container table-responsive">
      		<table class="table table-striped table-hover border">
      		<thead>
	      		<tr>
	      			<th>Project Title</th>
	      			<th>Created At</th>
	      			<th>Created By</th>
	      		</tr>
      		</thead>
      		<tbody>
      			<%
      			ResultSet projs = (ResultSet)request.getAttribute("data");
      			projs.beforeFirst();
				while (projs.next()){
				    %>
				    <tr>
				      <td>
				        <%= projs.getString("name") %>
				      </td>	
				      <td>
				        <%= projs.getString("created_at") %>
				      </td> 
				      <td>
				        <%= projs.getString("first_name") %>
				        <%= projs.getString("last_name") %>
				      </td>
				    </tr>
				    <% 
				    String evaluatedIds = "";
				    String SELECT_SQL = "SELECT assigned_table.*, users.id AS userid, users.first_name, users.last_name  FROM assigned_table, users WHERE assigned_table.user_id = users.id AND assigned_table.project_id = '"+ projs.getString("id") +"';";
					BasicDBAccessCloud q1 = new BasicDBAccessCloud(SELECT_SQL);
					ResultSet queryResult = q1.executeQuery();
					queryResult.beforeFirst();
					while (queryResult.next()){
				    %>
				    <tr style="background-color: #747474; color: #fff; ">
				    	<td colspan="2"><i class="fa fa-user"></i> <%= queryResult.getString("first_name") %> <%= queryResult.getString("last_name") %></td>
				    	<td><i class="fas fa-sort-numeric-up"></i> Score</td>
				    </tr>
				   	<% 
				   	
				    String EA_SQL = "SELECT evaluation_aspect.name, evaluation_aspect.id, scores.score FROM evaluation_aspect LEFT OUTER JOIN scores ON scores.aspect_id = evaluation_aspect.id WHERE scores.score_to = '" + queryResult.getString("userid") + "' AND scores.score_by = '" + user_id + "';";
					BasicDBAccessCloud q2 = new BasicDBAccessCloud(EA_SQL);
					ResultSet aspectResult = q2.executeQuery();
					aspectResult.beforeFirst();
					while (aspectResult.next()){
						String score = aspectResult.getString("score");
						String evid = aspectResult.getString("id");
						evaluatedIds += (evid.equals("") | evid == null) ? "" : "," + evid + "";
						if(!evid.equals("") | evid != null){
							evaluatedIds += "," + evid;
						}
				    %>
				    <tr>
				    	<td></td>
				    	<td><%= aspectResult.getString("name") %> </td>
				    	<td>
				    	<form class="score-form" action="" method="post">				   
				    	<div class="form-group row">
					    	<select class="form-control form-control-sm" name="score">
						    	<% for(int i = 0; i<=10; i++){ %>
						    	<option <% if(score.equals(String.valueOf(i))) { %> selected <% } %> value="<%= i %>"><%= i %></option>
					    		<% } %>
					    	</select>
					    	<button class="btn btn-sm btn-success ml-2" type="submit">Save</button>
				    	</div>
				    	</form>
				    	</td>
				    </tr>
				   <%
				   		} 
					
					while(evaluatedIds != null | !evaluatedIds.equals("")){
						evaluatedIds = evaluatedIds.startsWith(",") ? evaluatedIds.substring(1) : evaluatedIds;
						String NEW_EA_SQL = "SELECT evaluation_aspect.name, evaluation_aspect.id FROM evaluation_aspect WHERE evaluation_aspect.id NOT IN (" + evaluatedIds + ");";
						if(!evaluatedIds.equals("") | evaluatedIds != null){
							BasicDBAccessCloud q3 = new BasicDBAccessCloud(NEW_EA_SQL);
							ResultSet newEaResult = q3.executeQuery();
							newEaResult.beforeFirst();
							while (newEaResult.next()){										
				    %>
				    <tr>
				    	<td></td>
				    	<td><%= newEaResult.getString("name") %> </td>
				    	<td>
				    	<form class="score-form" action="" method="post">				   
				    	<div class="form-group row">
					    	<select class="form-control form-control-sm" name="score">
						    	<% for(int i = 0; i<=10; i++){ %>
						    	<option value="<%= i %>"><%= i %></option>
					    		<% } %>
					    	</select>
					    	<button class="btn btn-sm btn-success ml-2" type="submit">Save</button>
				    	</div>
				    	</form>
				    	</td>
				    </tr>
				    <%
						}
					}
					}
					} 
				} %>
      		</tbody>
      		</table>
    	</div>
  </section>
  <section id="statistics" class="statistics form-fields">
    <%@ include file="template/dashboardHeadNav.jsp"%>
   </section>
</main>
<%@ include file="template/dashboardFooter.jsp"%>