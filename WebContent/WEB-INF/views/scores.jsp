<%@ include file="template/dashboardHeader.jsp"%>
<%@ include file="template/sideBar.jsp"%>
<%@ page import="java.sql.ResultSet" %> 
<%@ page import="java.util.ArrayList" %> 
<%@ page import="ee.taltech.java.dbconfig.BasicDBAccessCloud" %> 

<main>
  <section id="main" class="main table-involved table-involved-full">
  		<h4>${title} <a href="<%= request.getContextPath() %>/scoressorted"><button class="btn btn-secondary btn-sm">Show Sorted Score <i class="fas fa-sort-numeric-down"></i></button></a> <button class="btn btn-primary btn-sm" id="clickToRefresh">Click to Refresh</button></h4>
  		<div class="updatedMessage">
  			<div class="dot"></div><span>You have updated the scores! Please refresh to see them!</span>
  		</div>
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
				    	<td colspan="2"><a target="_blank" class="user-link" href="<%= request.getContextPath() %>/studentdetails?id=<%= queryResult.getString("userid") %>"><i class="fa fa-user"></i> <%= queryResult.getString("first_name") %> <%= queryResult.getString("last_name") %></a></td>
				    	<td>Score : <%= queryResult.getString("total") %> / <%= totalSum %> <a title="Edit Score" class="ml-1 editScore" href="<%= request.getContextPath() %>/scoreDetails?project_id=<%=projs.getString("id")%>&user_id=<%=queryResult.getString("userid")%>"><i class="fa fa-pencil"></i></a></td>
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
<div class="modal fade" id="scoreModal" tabindex="-1" role="dialog" aria-labelledby="scoreModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    <div id="please-wait" class="">
	     <p>Updating <i class="fa fa-spin fa-spinner"></i></p>
    </div>
      <div class="modal-header">
        <h5 class="modal-title">Scores</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <table id="scoreDetails" class="table table-sm table-stripped table-bordered">
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<%@ include file="template/dashboardFooter.jsp"%>