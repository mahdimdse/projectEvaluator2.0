<%@ include file="template/dashboardHeader.jsp"%>
<%@ include file="template/sideBar.jsp"%>
<%@ page import="java.sql.ResultSet" %> 

<main>
  <section id="main" class="main table-involved table-involved-full">
  		<h4>${title}</h4>
       <div class="table-container table-responsive">
      		<table class="table table-striped table-hover border" id="dataTable">
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
<%@ include file="template/dashboardFooter.jsp"%>