<%@ include file="template/dashboardHeader.jsp"%>
<%@ include file="template/sideBar.jsp"%>
<%@ page import="java.sql.ResultSet" %> 
<%@ page import="java.util.ArrayList" %> 
<%@ page import="ee.taltech.java.dbconfig.BasicDBAccessCloud" %> 

<main>
  <section id="main" class="main table-involved table-involved-full">
  		<h4>${title} <button class="btn btn-primary btn-sm" id="clickToRefresh">Click to Refresh</button></h4>
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
      			String project_id;
      			int totalSum = (int)request.getAttribute("totalSum");
      			ResultSet projs = (ResultSet)request.getAttribute("data");
      			projs.beforeFirst();
				while (projs.next()){
					project_id = projs.getString("id");
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
				    <% } %>
				    <%
				    int total = 0;
					String htmlWrite = "<tr><thead><tr><th></th><th>Aspect</th><th>Score</th></tr><thead><tbody>";
					
					String EA_SQL = "SELECT evaluation_aspect.name, evaluation_aspect.id, COALESCE(scores.score, 0) as score FROM evaluation_aspect FULL OUTER JOIN scores ON scores.aspect_id = evaluation_aspect.id WHERE scores.score_to = '" + user_id + "';";
					BasicDBAccessCloud q2 = new BasicDBAccessCloud(EA_SQL);
					ResultSet aspectResult = q2.executeQuery();
					String evaluatedIds = "";
						aspectResult.beforeFirst();
						while (aspectResult.next()){
							total += Integer.valueOf(aspectResult.getString("score"));
							evaluatedIds += ","+aspectResult.getString("id");
							htmlWrite += "<tr><td></td><td>" + aspectResult.getString("name") + "</td><td>" + aspectResult.getString("score") + "</td></tr>";
						}
					
					evaluatedIds = evaluatedIds.startsWith(",") ? evaluatedIds.substring(1) : evaluatedIds;
					
					if(evaluatedIds.equals("")){
						String NEA_SQL = "SELECT evaluation_aspect.name, evaluation_aspect.id FROM evaluation_aspect;";
						BasicDBAccessCloud q3 = new BasicDBAccessCloud(NEA_SQL);
						ResultSet naspectResult = q3.executeQuery();
						
							naspectResult.beforeFirst();
							while (naspectResult.next()){
								htmlWrite += "<tr><td></td><td>" + naspectResult.getString("name") + "</td><td>" + 0 + "(Not Scored)</td></tr>";
							}
					}
					else {
						String NEA_SQL = "SELECT evaluation_aspect.name, evaluation_aspect.id FROM evaluation_aspect WHERE evaluation_aspect.id NOT IN ("+evaluatedIds+");";
						BasicDBAccessCloud q3 = new BasicDBAccessCloud(NEA_SQL);
						ResultSet naspectResult = q3.executeQuery();
						
							naspectResult.beforeFirst();
							while (naspectResult.next()){
								htmlWrite += "<tr><td></td><td>" + naspectResult.getString("name") + "</td><td>" + 0 + "(Not Scored)</td></tr>";
							}
					}
					htmlWrite += "<tr><td></td><td></td><td>Total: "+total+"</td></tr>";
					htmlWrite += "</tbody></tr>";
				    %>
				    <%= htmlWrite %>
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