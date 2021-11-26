<%@ include file="template/dashboardHeader.jsp"%>
<%@ include file="template/sideBar.jsp"%>
<%@ page import="java.sql.ResultSet" %> 

<main>
  <section id="main" class="main table-involved">
  		<h4>${title}</h4>
       <div class="table-container table-responsive">
       <% 
       String assigned_project = (String)request.getAttribute("assigned_project");
       String assigned_project_name = (String)request.getAttribute("assigned_project_name");
       if(assigned_project == null){ %>
      		<form action="<%= request.getContextPath() %>/newproject" method="post">
               
                <div class="form-group position-relative mb-2 d-flex">
                    <input type="text" class="col-12 form-control border-top-0 border-right-0 border-left-0 rounded-0 shadow-none"
                        placeholder="Name of the New Project or Reference Code of Other Project" name="name" required="required">
                        </div>
                <button type="submit" class="btn btn-success btn-block shadow border-0 py-2 text-uppercase mt-4">
                    Save
                </button>

            </form>
            <% } else { %>
            <div class="baner banner-success">
		      <div class="baner-text">
		        <h1>Hello, 
		        <%= firstName + ' '+ lastName %>
		        !</h1>
		        <p>You are assigned to <b><%= assigned_project_name %></b> project. You can refer the project to others by sharing this code: <b><%= assigned_project %></b></p>
		      </div>
		      <div class="baner-png">
		      </div>
    		</div>
            <% } %>
    	</div>
  </section>
  <section id="statistics" class="statistics form-fields">
    <%@ include file="template/dashboardHeadNav.jsp"%>
    <div class="statistics-body">
      <div class="function">
      </div>
    </div>
  </section>
</main>
<%@ include file="template/dashboardFooter.jsp"%>