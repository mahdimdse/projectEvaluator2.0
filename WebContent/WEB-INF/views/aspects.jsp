<%@ include file="template/dashboardHeader.jsp"%>
<%@ include file="template/sideBar.jsp"%>
<%@ page import="java.sql.ResultSet" %> 

<main>
  <section id="main" class="main table-involved">
  		<h4>${title}</h4>
       <div class="table-container table-responsive">
      		<table class="table table-striped table-hover border" id="dataTable">
      		<thead>
	      		<tr>
	      			<th>Name</th>
	      			<th>Created By</th>
	      			<th>Created At</th>
	      		</tr>
      		</thead>
      		<tbody>
      			<%
				ResultSet aspcts = (ResultSet)request.getAttribute("dataAspects");
				while (aspcts.next()){
				    %>
				    <tr>
				      <td>
				        <%= aspcts.getString("name") %>
				      </td>	
				      <td>
				        <%= aspcts.getString("first_name") %>
				        <%= aspcts.getString("last_name") %>
				      </td>	  
				      <td>
				        <%= aspcts.getString("created_at") %>
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
    <div class="statistics-body">
      <div class="function">
      <% if(role_id.equals("1")) {%>
        <p>Add New Aspect</p>
        <div class="row">
          <form action="<%= request.getContextPath() %>/aspects" method="post">
               
                <div class="form-group position-relative mb-2 d-flex">
                    <input type="text" class="col-12 form-control border-top-0 border-right-0 border-left-0 rounded-0 shadow-none"
                        placeholder="Name of the Aspect" name="name" required="required">
                        </div>
                <button type="submit" class="btn btn-success btn-block shadow border-0 py-2 text-uppercase mt-4">
                    Save
                </button>

            </form>
        </div>
        <% } %>
      </div>
    </div>
  </section>
</main>
<%@ include file="template/dashboardFooter.jsp"%>