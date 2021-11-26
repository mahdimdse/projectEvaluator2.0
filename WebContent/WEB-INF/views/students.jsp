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
	      			<th>Name</th>
	      			<th>Email</th>
	      			<th>Username</th>
	      			<th>Signed Up At</th>
	      		</tr>
      		</thead>
      		<tbody>
      			<%
				ResultSet stdnt = (ResultSet)request.getAttribute("dataStudents");
      			stdnt.beforeFirst();
				while (stdnt.next()){
				    %>
				    <tr>
				      <td>
				        <%= stdnt.getString("first_name") %>
				        <%= stdnt.getString("last_name") %>
				      </td>	
				      <td>
				        <%= stdnt.getString("email") %>
				      </td>	 
				      <td>
				        <%= stdnt.getString("username") %>
				      </td> 
				      <td>
				        <%= stdnt.getString("created_at") %>
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