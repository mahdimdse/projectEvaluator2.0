<%@ include file="template/dashboardHeader.jsp"%>
<%@ include file="template/sideBar.jsp"%>
<%@ page import="java.sql.ResultSet" %> 

<main>
  <section id="main" class="main table-involved table-involved-full">
  		<h4><i class="fa fa-chevron-left" onCLick="history.back()"></i> Student Detail</h4>
       <div class="table-container table-responsive">
      			<%
				ResultSet stdnt = (ResultSet)request.getAttribute("dataStudents");
      			stdnt.beforeFirst();
				while (stdnt.next()){
				    %>
				    <div class="form-group row">
					    <label for="staticEmail" class="col-sm-2 col-form-label">Name</label>
					    <div class="col-sm-7">
					      <input type="text" readonly class="form-control" disabled value="<%= stdnt.getString("first_name") %> <%= stdnt.getString("last_name") %>">
					    </div>
					</div>
					<div class="form-group row">
					    <label for="staticEmail" class="col-sm-2 col-form-label">Email</label>
					    <div class="col-sm-7">
					      <input type="text" readonly class="form-control" disabled value="<%= stdnt.getString("email") %>">
					    </div>
					</div>
					<div class="form-group row">
					    <label for="staticEmail" class="col-sm-2 col-form-label">Username</label>
					    <div class="col-sm-7">
					      <input type="text" readonly class="form-control" disabled value="<%= stdnt.getString("username") %>">
					    </div>
					</div>
					<div class="form-group row">
					    <label for="staticEmail" class="col-sm-2 col-form-label">Signed Up at</label>
					    <div class="col-sm-7">
					      <input type="text" readonly class="form-control" disabled value="<%= stdnt.getString("created_at") %>">
					    </div>
					</div>
				<% 		
				}
				%>
    	</div>
    	
    	<h4>Project Info</h4>
       	<div class="table-container table-responsive">
      			<%
				ResultSet prj = (ResultSet)request.getAttribute("dataProjects");
				if(prj.isBeforeFirst()){
				prj.beforeFirst();
				while (prj.next()){
				    %>
				    <div class="form-group row">
					    <label for="staticEmail" class="col-sm-2 col-form-label">Project Name</label>
					    <div class="col-sm-7">
					      <input type="text" readonly class="form-control" disabled value="<%= prj.getString("name") %>">
					    </div>
					</div>
					<div class="form-group row">
					    <label for="staticEmail" class="col-sm-2 col-form-label">Created By</label>
					    <div class="col-sm-7">
					      <input type="text" readonly class="form-control" disabled value="<%= prj.getString("first_name") %> <%= prj.getString("last_name") %>">
					    </div>
					</div>
					<div class="form-group row">
					    <label for="staticEmail" class="col-sm-2 col-form-label">Created at</label>
					    <div class="col-sm-7">
					      <input type="text" readonly class="form-control" disabled value="<%= prj.getString("created_at") %>">
					    </div>
					</div>
				<% 		
				}
				}
				else {
					%>
					Not assigned to a project yet!
					<%
				}
				%>
    	</div>
  </section>
  <section id="statistics" class="statistics form-fields">
    <%@ include file="template/dashboardHeadNav.jsp"%>
   </section>
</main>
<%@ include file="template/dashboardFooter.jsp"%>