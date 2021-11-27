<%@ include file="template/dashboardHeader.jsp"%>
<%@ include file="template/sideBar.jsp"%>
<%@ page import="java.sql.ResultSet" %> 

<main>
  <section id="main" class="main">
    <div class="baner">
      <div class="baner-text">
        <h1>Hello, 
        <%= firstName + ' '+ lastName %>
        !</h1>
        <p>Welcome back to Project Evaluation System</p>
      </div>
      <div class="baner-png">
      <%
      if(role_id.equals("1")){
    	  %>    	  	
	        <img src="<%= request.getContextPath() %>/lecturer.jpg" alt="">
    	  <%
      }
      else {
    	 %>    	  	
	        <img src="<%= request.getContextPath() %>/student.png" alt="">
  	  	<%
      }
      %>
      </div>
    </div>
    <% if(role_id.equals("1")) {%>
    <div class="weekly">
      <div class="weekly-header">
        <div class="title">
          <p>Reports</p>
        </div>
      </div>
      <div class="weekly-body">
        <div class="item">
          <span class="bd-orange">
            <i class="fas fa-server c-orange"></i>
          </span>
          <p>Projects</p>
          <p class="item-size">
            <%
			ResultSet countProjects = (ResultSet)request.getAttribute("totalProjects");
			while (countProjects.next()){
			    %>
				<span>
			        <%= countProjects.getString("count") %>
			     </span>
			<% 		
			}
			%>
          </p>
        </div>
        <div class="item">
          <span class="bd-red">
            <i class="fa fa-users c-red"></i>
          </span>
          <p>Students</p>
          <p class="item-size">
            <%
			ResultSet countStudent = (ResultSet)request.getAttribute("totalStudents");
			while (countStudent.next()){
			    %>
				<span>
			        <%= countStudent.getString("count") %>
			     </span>
			<% 		
			}
			%>
          </p>
        </div>
        <div class="item">
          <span class="bd-cyn">
            <i class="fa fa-check-square c-cyn"></i>
          </span>
          <p>Evaluated</p>
          <p class="item-size">
            16
          </p>
        </div>
        <div class="item">
          <span class="bd-blue">
            <i class="fa fa-list c-blue"></i>
          </span>
          <p>Aspects</p>
          <p class="item-size">
            <%
			ResultSet countAspect = (ResultSet)request.getAttribute("totalAspects");
			while (countAspect.next()){
			    %>
				<span>
			        <%= countAspect.getString("count") %>
			     </span>
			<% 		
			}
			%>
          </p>
        </div>
      </div>
    </div>
    <% 
  		}
  	%>
  </section>
  <section id="statistics" class="statistics">
    <%@ include file="template/dashboardHeadNav.jsp"%>
    <div class="statistics-body">
      
    </div>
  </section>
</main>
<%@ include file="template/dashboardFooter.jsp"%>