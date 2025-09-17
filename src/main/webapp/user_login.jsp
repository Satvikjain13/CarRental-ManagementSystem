<%@include file="navbar.jsp" %>

<!-- Contact Start -->
    <div class="container-fluid py-5">
        <div class="container pt-5 pb-3">
            <h1 class="display-4 text-uppercase text-center mb-5">User Login</h1>
            <div class="row">
                <div class="col-lg-7 mb-2">
                    <div class="contact-form bg-light mb-4" style="padding: 30px;">
                        <form action="userlogin" method="post">

                            <div class="form-group">
                                <input type="email" name="EmailId" class="form-control p-4" placeholder="Enter Email Id" required>
                            </div>
                            <div class="form-group">
                                <input type="password" name="Password" class="form-control p-4" placeholder="Enter Password" required>
                            </div>
                            <div>
                                <button class="btn btn-primary py-3 px-5" type="submit">Submit</button>
                                <button class="btn btn-primary"><a href="signup.jsp" class="btn btn-primary py-2 px-5">Signup</a></button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-lg-5 mb-2">
                    <img src="img/login.jpg" height="250px">
                </div>
            </div>
        </div>
    </div>
    <!-- User Login End -->
<%
			String validMsg = (String) session.getAttribute("validMsg");
			String invalidMsg = (String) session.getAttribute("invalidMsg");

			if (validMsg != null) {
		%>
		<script>
			alert("Logged in Successfully");
			window.location.assign("user/userindex.jsp");
		</script>
		<%
			session.removeAttribute("validMsg");
			}
		%>
		<%
			if (invalidMsg != null) {
		%>
		<script>
			alert("Invalid Creadential !! Please Try Again..");
		</script>
		<%
			session.removeAttribute("invalidMsg");
			}
		%>
		
<%@include file="footer.jsp" %>