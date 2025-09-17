<%@page import="com.carrental.VehicleDAO"%>
<%@page import="com.carrental.Vehicles"%>
<%@include file="adminNavbar.jsp"%>

<div class="content-wrapper">

	<section class="content-header">
		<h1 align="center">
			<i class="fa fa-cab"></i> Manage Vehicles <small></small>
		</h1>
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
					<div class="box-header">
						<h3 class="box-title">
							<i class="fa fa-cab"></i> Manage Vehicles
						</h3>

						<!-- /.box-header -->
						<div class="box-body">
							<table id="example1" class="table table-bordered table-striped">
								<thead>
									<tr style="background-color: #c5c5c5;">
										<th>#</th>
										<th><i class="fa fa-list-ol"></i> Vehicle Title</th>
										<th><i class="fa fa-list-ol"></i> Brand</th>
										<th><i class="fa fa-list-ol"></i> Price Per Day</th>
										<th><i class="fa fa-list-ol"></i> Fuel Type</th>
										<th><i class="fa fa-list-ol"></i> Model Year</th>
										<th>Action</th>
									</tr>
								</thead>
								<tbody>
									<%
										int i = 0;
										for (Vehicles c : VehicleDAO.getVehicle(false, false)) {
											i++;
									%>
									<tr>
										<td><%=i%></td>
										<td><%=c.getVehiclesTitle()%></td>
										<td><%=c.getVehiclesBrand()%></td>
										<td><%=c.getPricePerDay()%> Rs.</td>
										<td><%=c.getFuelType()%></td>
										<td><%=c.getModelYear()%></td>
										<td align="center"><a class="btn btn-primary btn-sm"
											href="editVehicle.jsp?id=<%=c.getId()%>"><i class="fa fa-pencil"></i></a> <a
											class="btn btn-danger btn-sm" href="deleteVehicle.jsp?id=<%=c.getId()%>"
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
<%@include file="adminFooter.jsp"%>