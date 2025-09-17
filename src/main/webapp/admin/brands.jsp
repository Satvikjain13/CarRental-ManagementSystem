<%@page import="com.carrental.BrandDAO"%>
<%@page import="com.carrental.Brand"%>
<%@include file="adminNavbar.jsp"%>

<div class="content-wrapper">

	<section class="content-header">
		<h1 align="center">
			<i class="fa fa-cab"></i> Manage Brands <small></small>
		</h1>
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
					<div class="box-header">
						<h3 class="box-title">
							<i class="fa fa-cab"></i> Manage Brand
						</h3>
						<button type="button" class="btn btn-success btn-sm"
							style="margin-left: 2%" data-toggle="modal" data-target="#add">
							<i class="fa fa-plus"></i> Add
						</button>
						<div class="modal fade" id="add">
							<div class="modal-dialog">
								<form action="../addBrand" method="post">

									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
											<h4 class="modal-title">Add Brand</h4>
										</div>

										<div class="modal-body">
											<div class="box box-primary">
												<div class="box-body">
													<div class="form-group">
														<label>Brand Name</label> <input type="text"
															name="BrandName" class="form-control"
															placeholder="Enter Brand Name">
													</div>
												</div>
											</div>
										</div>

										<div class="modal-footer">
											<button type="button" class="btn btn-danger pull-left"
												data-dismiss="modal">Close</button>
											<button type="submit" class="btn btn-primary">Submit</button>
										</div>
									</div>
								</form>
							</div>
						</div>



						<!-- /.box-header -->
						<div class="box-body">
							<table id="example1" class="table table-bordered table-striped">
								<thead>
									<tr style="background-color: #c5c5c5;">
										<th>#</th>
										<th><i class="fa fa-list-ol"></i> Brand Name</th>
										<th><i class="fa fa-calendar"></i> Creation Date</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody>
									<%
										int i = 0;
										for (Brand b : BrandDAO.getBrand(false, false)) {
											i++;
									%>
									<tr>
										<td><%=i%></td>
										<td><%=b.getBrandName()%></td>
										<td><%=b.getCreationDate()%></td>
										<td align="center"><a class="btn btn-primary btn-sm"
											href="editBrand.jsp?id=<%=b.getId()%>"><i class="fa fa-pencil"></i></a> <a
											class="btn btn-danger btn-sm" href="deleteBrand.jsp?id=<%=b.getId()%>"
											onclick="return confirm('Are you sure to Delete ?')"><i
												class="fa fa-trash"></i></a></td>
									</tr>
									<%
										}
									%>
								</tbody>
							</table>

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>
		<%
			String msg = request.getParameter("msg");
			if ("valid".equals(msg)) {
		%>
		   <script>
				alert("New Brand has been Added");
		   </script>
		<%
			}
		%>
		
<%@include file="adminFooter.jsp"%>