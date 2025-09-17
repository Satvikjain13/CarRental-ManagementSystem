<%@page import="com.carrental.Brand"%>
<%@page import="com.carrental.DbConnect"%>
<%@page import="com.carrental.BrandDAO"%>
<%@include file="adminNavbar.jsp"%>

<div class="content-wrapper">

	<section class="content-header">
		<h1 align="center">
			<i class="fa fa-cab"></i> Update Brands <small></small>
		</h1>
	</section>

	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
					<div class="box-header">
						<h3 class="box-title">
							<i class="fa fa-cab"></i> Update Brand
						</h3>
						<%
							int id = Integer.parseInt(request.getParameter("id"));
							BrandDAO dao = new BrandDAO(DbConnect.Connect());
							Brand b = dao.getBrandById(id);
						%>
						<form action="../updateBrand" method="post">
							<input type="hidden" name="id" value="<%= id%>">
							<div class="modal-body">
								<div class="box box-primary">
									<div class="box-body">
										<div class="form-group">
											<label>Brand Name</label> <input type="text" name="BrandName"
												class="form-control" value="<%= b.getBrandName()%>">
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
		if ("valid".equals(msg)) {
	%>
	<script>
		alert("Brand has been Updated");
		window.location.assign("brands.jsp");
	</script>
	<%
		}
	%>
</div>
<%@include file="adminFooter.jsp"%>