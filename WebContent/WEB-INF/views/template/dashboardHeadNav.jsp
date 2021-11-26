<div class="statistics-header">
  <div class="pb-4">
  	<div class="user-name">
  	<%= firstName +" "+ lastName %>
  	</div>
  	<div class="dropdown">
	    <img class="dropdown-toggle img-profile" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" src="http://www.atexctg.com/images/demo.png" alt="">
	  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
	    <a class="dropdown-item" href="<%= request.getContextPath() %>/logout">Logout <i class="fas fa-sign-out-alt"></i></a>
	  </div>
	</div>
  </div>
</div>