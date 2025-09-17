<%@include file="adminNavbar.jsp"%>

<div class="content-wrapper">

<section class="content">
    <div class="row">
      <div class="col-xs-12">
        <div class="box">
         <div class="box-header">
           <h3 class="box-title"><i class="fa fa-cab"></i> Update Password</h3>
             <form action="changePasswordAction.jsp" method="post" name="changepassword" onsubmit="return checkpassword()">
            
              <div class="modal-body mt-3">
                  <div class="box box-primary">
                    <div class="box-body">

                      <div class="form-group">
                        <label>Current Password</label>
                        <input type="password" name="oldpassword" class="form-control" required>
                      </div>

                      <div class="form-group">
                        <label>New Password</label>
                        <input type="password" name="newpassword" class="form-control" required>
                      </div>

                      <div class="form-group">
                        <label>Confirm password</label>
                        <input type="password" name="confirmpassword" class="form-control" required>
                      </div>
                    </div>
                  </div>
              </div>
              <div class="modal-footer">
                  <button type="submit" class="btn btn-primary">Update</button>
              </div>
            </form>
         </div>
        </div>
      </div>
    </div>
</section>
<%
				String msg = request.getParameter("msg");
				if ("notMatch".equals(msg)) {
			%>
			<script>
				alert("New password and Confirm password does not match!");
				window.location.assign("changePassword.jsp");
			</script>
			<%
				}
			%>
			<%
				if ("wrong".equals(msg)) {
			%>
			<script>
				alert("Your old Password is wrong!");
				window.location.assign("changePassword.jsp");
			</script>
			<%
				}
			%>
			<%
				if ("done".equals(msg)) {
			%>
			<script>
				alert("Password changed successfully!");
				window.location.assign("../index.jsp");
			</script>

			<%
				}
			%>

</div>
<%@include file="adminFooter.jsp" %>