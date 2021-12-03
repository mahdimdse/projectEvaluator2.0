<%@ include file="template/dashboardHeader.jsp"%>
<%@ include file="template/sideBar.jsp"%>
<%@ page import="java.sql.ResultSet" %> 
<%@ page import="java.util.ArrayList" %> 
<%@ page import="ee.taltech.java.dbconfig.BasicDBAccessCloud" %> 

<main>
  <section id="main" class="main table-involved table-involved-full">
  		<h4><i class="fa fa-chevron-left" onCLick="history.back()"></i> ${title} <button class="btn btn-primary btn-sm" id="clickToRefresh">Click to Refresh</button></h4>
  		<div class="updatedMessage">
  			<div class="dot"></div><span>You have updated the scores! Please refresh to see them!</span>
  		</div>
       <div class="table-container table-responsive">
      		<table class="table table-striped table-hover border">
      		<thead>
	      		<tr>
	      			<th>Name</th>
	      			<th>Project</th>
	      			<th>Score</th>
	      		</tr>
      		</thead>
      		<tbody>
      			<%
      			int count_order = 0;
      			int totalSum = (int)request.getAttribute("totalSum");
      			ResultSet scrs = (ResultSet)request.getAttribute("scoreData");
      			scrs.beforeFirst();
				while (scrs.next()){
					count_order++;
				    %>
				    <tr>
				      <td>
				        <a target="_blank" class="user-link" href="<%= request.getContextPath() %>/studentdetails?id=<%= scrs.getString("userid") %>"><i class="fa fa-user"></i> <%= scrs.getString("first_name") %> <%= scrs.getString("last_name") %></a>
				      <% if(count_order == 1){
				    	  %>
				    	  <i class="fa fa-trophy champion"></i>
				    	  <%
				      } else if(count_order == 2) { %>
				    	  <i class="fa fa-trophy first-runnerup"></i>
				    	  <%
				    	  } else if(count_order == 3){ %>
				    	  <i class="fa fa-trophy second-runnerup"></i>
				      <% } %>
				      </td>
				      <td>
				        <%= scrs.getString("name") %>
				      </td>	
				      <td>
				        <%= scrs.getString("scored") %> / <%= totalSum %>
				        <a title="Edit Score" class="ml-1 editScore" href="<%= request.getContextPath() %>/scoreDetails?project_id=<%=scrs.getString("projectid")%>&user_id=<%=scrs.getString("userid")%>"><i class="fa fa-pencil"></i></a>
				      </td> 
				      
				    </tr>
				    <% 
					} 
				 %>
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