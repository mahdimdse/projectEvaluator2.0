<%@ include file="template/header.jsp"%>
 <div class="container h-100">
        <div class="row h-100 justify-content-center align-items-center">
            <form class="col-12 col-md-9" action="<%= request.getContextPath() %>/login" method="post">
                <div class="AppForm shadow-lg">
                    <div class="row">
                        <div class="col-12 col-md-6 d-flex justify-content-center align-items-center">
                            <div class="AppFormLeft">

                                <h1>Login</h1>
                                <div class="form-group position-relative mb-4">
                                    <input type="email" class="form-control border-top-0 border-right-0 border-left-0 rounded-0 shadow-none" id="username"
                                        placeholder="Email Address" name="email" required="required">
                                        <i class="fa fa-user"></i>
                                </div>
                                <div class="form-group position-relative mb-4">
                                    <input type="password" class="form-control border-top-0 border-right-0 border-left-0 rounded-0 shadow-none" id="password"
                                        placeholder="Password" name="password" required="required">
                                        <i class="fa fa-key"></i>

                                </div>

                                <button type="submit" class="btn btn-success btn-block shadow border-0 py-2 text-uppercase ">
                                    Login
                                </button>

                                <p class="text-center mt-5">
                                    Don't have an account?
                                    <a href="signup">
                                        Create your account
                                    </a>
                                </p>
                            </div>

                        </div>
                        <div class="d-none d-md-block col-md-6">
                            <div class="AppFormRight position-relative d-flex justify-content-center flex-column align-items-center text-center p-5 text-white">
                                <h2 class="position-relative px-4 pb-3 mb-4">Welcome</h2>
                                <p>This project helps to evaluate the JAVA projects done by students. You can register and login as a lecturer/student.</p>
                            </div>
                        </div>
                    </div>
                </div>

            </form>
        </div>
    </div>
</body>
<%@ include file="template/footer.jsp"%>