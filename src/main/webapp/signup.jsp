<%@include file="navbar.jsp"%>

<!-- Signup Start -->
<div class="container-fluid py-5">
	<div class="container pt-5 pb-3">
		<h1 class="display-4 text-uppercase text-center mb-5">Signup Form</h1>
		<div class="row">
			<div class="col-lg-6 mb-2">
				<div
					class="px-5 bg-secondary d-flex align-items-center justify-content-between"
					style="height: 350px;">
					<img class="img-fluid flex-shrink-0 ml-n5 w-50 mr-4"
						src="img/banner-left.png" alt="">
					<div class="text-right">
						<h3 class="text-uppercase text-light mb-3">Want to be drive?</h3>
						<p class="mb-4">Then fill the all data and Enjoy them.</p>
					</div>
				</div>
			</div>

			<div class="col-lg-6 mb-2">
				<div class="contact-form bg-light mb-4" style="padding: 30px;">
					<form action="signup" method="post">

						<div class="row">
							<div class="col-6 form-group">
								<input type="text" name="FullName" class="form-control p-4"
									placeholder="Your Full Name" required>
							</div>
							<div class="col-6 form-group">
								<input type="email" name="EmailId" class="form-control p-4"
									placeholder="Your Email Id" required>
							</div>
						</div>
						<div class="row">
							<div class="col-6 form-group">
								<input type="password" name="Password" class="form-control p-4"
									placeholder="Enter Password" required>
							</div>
							<div class="col-6 form-group">
								<input type="text" name="ContactNo" class="form-control p-4"
									placeholder="Your Contact Number" required>
							</div>
						</div>

						<div class="row">
							<div class="col-6 form-group">
								<input type="text" name="dob" onfocus="(this.type='date')"
									class="form-control p-4" placeholder="Your Date of Birth"
									required>
							</div>
							<div class="col-6 form-group">
								<input type="text" name="Address" class="form-control p-4"
									placeholder="Your Address" required>
							</div>
						</div>

						<div class="row">
							<div class="col-6 form-group">
								<input type="text" name="City" class="form-control p-4"
									placeholder="Your City" required>
							</div>
							<div class="col-6 form-group">
								<input type="text" name="Country" class="form-control p-4"
									placeholder="Your Country" required>
							</div>

						</div>
						
						<div>
							<button class="btn btn-primary py-3 px-5" type="submit">Submit</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Signup End -->

<!-- Vendor Start -->
<div class="container-fluid py-5">
	<div class="container py-5">
		<div class="owl-carousel vendor-carousel">
			<div class="bg-light p-4">
				<img src="img/vendor-1.png" alt="">
			</div>
			<div class="bg-light p-4">
				<img src="img/vendor-2.png" alt="">
			</div>
			<div class="bg-light p-4">
				<img src="img/vendor-3.png" alt="">
			</div>
			<div class="bg-light p-4">
				<img src="img/vendor-4.png" alt="">
			</div>
			<div class="bg-light p-4">
				<img src="img/vendor-5.png" alt="">
			</div>
			<div class="bg-light p-4">
				<img src="img/vendor-6.png" alt="">
			</div>
			<div class="bg-light p-4">
				<img src="img/vendor-7.png" alt="">
			</div>
			<div class="bg-light p-4">
				<img src="img/vendor-8.png" alt="">
			</div>
		</div>
	</div>
</div>
<!-- Vendor End -->
<%
    String msg=request.getParameter("msg");
    if("valid".equals(msg))
    {
  %>
    <script>
		alert("Your Registration Successfully.");
		window.location.assign("user_login.jsp");
	</script>  	
  <%
    }
  %>
<%@include file="footer.jsp"%>