<nav class="navbar">
  <div class="logo">
    <a href="<%= request.getContextPath() %>/dashboard" class="barnd">
      <p title="Evaluate Projects">Eva <span>Pro</span></p>
    </a>
  </div>
  	<%
  		if(role_id != null & role_id.equals("1")){
	%>
	<ul class="navbar-nav">
    <li class="nav-item active">
      <a title="Dashboard" href="<%= request.getContextPath() %>/dashboard" class="nav-link ${title.equals("Dashboard") ? 'active' : '' }">
        <i class="fas fa-tv"></i>
      </a>
    </li>
    <li class="nav-item">
      <a title="Aspects" href="<%= request.getContextPath() %>/aspects" class="nav-link ${title.equals("Aspects") ? 'active' : '' }">
        <i class="fa fa-list"></i>
      </a>
    </li>
    <li class="nav-item">
      <a title="Students" href="<%= request.getContextPath() %>/students" class="nav-link ${title.equals("Students") ? 'active' : '' }">
        <i class="fa fa-users"></i>
      </a>
    </li>
    <li class="nav-item">
      <a title="Projects" href="<%= request.getContextPath() %>/projects" class="nav-link ${title.equals("Projects") ? 'active' : '' }">
        <i class="fas fa-server"></i>
      </a>
    </li>
    <li class="nav-item">
      <a title="Scores" href="<%= request.getContextPath() %>/scores" class="nav-link ${title.equals("Scores") ? 'active' : '' }">
        <i class="fas fa-sort-numeric-up"></i>
      </a>
    </li>
    <li class="nav-item mt-3 logout">
      <a title="Logout" href="<%= request.getContextPath() %>/logout" class="logout-btn">
        <i class="fas fa-sign-out-alt"></i>
      </a>
    </li>
  </ul>
	<% 
  		}
  		else if(role_id != null & role_id.equals("2")) {
  	%>
  	<ul class="navbar-nav">
    <li class="nav-item active">
      <a title="Dashboard" href="<%= request.getContextPath() %>/dashboard" class="nav-link ${title.equals("Dashboard") ? 'active' : '' }">
        <i class="fas fa-tv"></i>
      </a>
    </li>
    <li class="nav-item">
      <a title="Aspects" href="<%= request.getContextPath() %>/aspects" class="nav-link ${title.equals("Aspects") ? 'active' : '' }">
        <i class="fa fa-list"></i>
      </a>
    </li>
    <li class="nav-item">
      <a title="Project" href="<%= request.getContextPath() %>/newproject" class="nav-link ${title.equals("Project") ? 'active' : '' }">
        <i class="fa fa-briefcase"></i>
      </a>
    </li>
    <li class="nav-item">
      <a title="Score" href="<%= request.getContextPath() %>/scores" class="nav-link ${title.equals("Score") ? 'active' : '' }">
        <i class="fa fa-clipboard"></i>
      </a>
    </li>
    <li class="nav-item mt-3 logout">
      <a title="Logout" href="<%= request.getContextPath() %>/logout" class="logout-btn">
        <i class="fas fa-sign-out-alt"></i>
      </a>
    </li>
  </ul>
  	<% 
  		}
  	%>
</nav>