<%@ page import="java.sql.ResultSet" %> 
<%@ include file="template/header.jsp"%>
 <div class="container h-100">
        <div class="row h-100 justify-content-center align-items-center">
            <form class="col-md-9" action="<%= request.getContextPath() %>/signup" method="post">
                <div class="AppForm shadow-lg">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="AppFormRight position-relative d-flex justify-content-center flex-column align-items-center text-center p-5 text-white">
                                <h2 class="position-relative px-4 pb-3 mb-4">Welcome</h2>
                                <p>This project helps to evaluate the JAVA projects done by students. You can register and login as a lecturer/student.</p>
                            </div>
                        </div>
                        <div class="col-md-6 d-flex justify-content-center align-items-center">
                            <div class="AppFormLeft signUpRight">
                                <h1>Sign Up</h1>
                                <div class="form-group position-relative mb-2 d-flex">
                                    <input type="text" class="col-md-6 form-control border-top-0 border-right-0 border-left-0 rounded-0 shadow-none"
                                        placeholder="First Name" name="first_name" required="required">
                                        <input type="text" class="col-md-6 form-control border-top-0 border-right-0 border-left-0 rounded-0 shadow-none"
                                        placeholder="Last Name" name="last_name" required="required">
                                </div>
                                <div class="form-group position-relative mb-2">
                                    <input type="text" class="form-control border-top-0 border-right-0 border-left-0 rounded-0 shadow-none"
                                        placeholder="Username" name="username" required="required">
                                </div>
                                <div class="form-group position-relative mb-2">
                                    <input type="email" class="form-control border-top-0 border-right-0 border-left-0 rounded-0 shadow-none" id="username"
                                        placeholder="Email Address" name="email" required="required">
                                </div>
                                <div class="form-group position-relative mb-2">
                                    <input type="password" class="form-control border-top-0 border-right-0 border-left-0 rounded-0 shadow-none" id="password"
                                        placeholder="Password" name="password" required="required">
                                </div>
                                <div class="form-group position-relative mb-2">
                                	<select class="form-control border-top-0 border-right-0 border-left-0 rounded-0 shadow-none text-capitalize" name="role_id" required="required">
                                		<%
											ResultSet prods = (ResultSet)request.getAttribute("roleData");
											while (prods.next()){
											    %>
											    <option value="<%= prods.getString("id") %>">
											        <%= prods.getString("title") %>
											     </option>
												<% 		
											}
										%>                                		
                                	</select>
                                </div>

                                <button type="submit" class="btn btn-success btn-block shadow border-0 py-2 text-uppercase mt-4">
                                    Submit
                                </button>

                                <p class="text-center mt-5">
                                    Have an account?
                                    <a href="login">
                                        Login here
                                    </a>
                                </p>
                            </div>

                        </div>
                    </div>
                </div>

            </form>
        </div>
    </div>
</body>
<%@ include file="template/footer.jsp"%>