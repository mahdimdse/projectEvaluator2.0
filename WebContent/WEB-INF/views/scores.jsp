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
      			int totalSum = (int)request.getAttribute("totalSum");
      			ResultSet projs = (ResultSet)request.getAttribute("data");
      			projs.beforeFirst();
				while (projs.next()){
				    %>
				    <tr style="background-color: #747474; color: #fff; ">
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
				    String SELECT_SQL = "SELECT users.id AS userid, users.first_name, users.last_name, SUM(COALESCE(scores.score, 0)) AS total FROM users, assigned_table LEFT OUTER JOIN scores ON scores.score_to = assigned_table.user_id WHERE assigned_table.user_id = users.id AND assigned_table.project_id = '" + projs.getString("id") + "' GROUP BY scores.score_to, users.id;";
					BasicDBAccessCloud q1 = new BasicDBAccessCloud(SELECT_SQL);
					ResultSet queryResult = q1.executeQuery();
					queryResult.beforeFirst();
					while (queryResult.next()){
				    %>
				    <tr>
				    	<td colspan="2"><i class="fa fa-user"></i> <%= queryResult.getString("first_name") %> <%= queryResult.getString("last_name") %></td>
				    	<td>Score : <%= queryResult.getString("total") %> / <%= totalSum %> <a title="Edit Score" class="ml-1 editScore" href="<%= request.getContextPath() %>/scoreDetails?project_id=<%=projs.getString("id")%>&user_id=<%=projs.getString("userid")%>"><i class="fa fa-pencil"></i></a></td>
				    </tr>
				   	<% 
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