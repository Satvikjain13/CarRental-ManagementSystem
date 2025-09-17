<%@page import="com.carrental.Booking"%>
<%@page import="java.util.List"%>
<%@page import="com.carrental.BookDAO"%>
<%@include file="usernavbar.jsp"%>

<!-- Page Header Start -->
<div class="container-fluid page-header"
	xmlns="http://www.w3.org/1999/html">
	<h1 class="display-3 text-uppercase text-white mb-3">My Booking</h1>
	<div class="d-inline-flex text-white">
		<h6 class="text-uppercase m-0">
			<a class="text-white" href="userindex.jsp">Home</a>
		</h6>
		<h6 class="text-body m-0 px-3">/</h6>
		<h6 class="text-uppercase text-body m-0">My Booking</h6>
	</div>
</div>
<!-- Page Header Start -->

<div class="container-fluid py-2">
	<div class="container pt-2 pb-3">
		<h1 class="display-4 text-uppercase text-center mb-2">My Booking</h1>
		<div class="row">
			<div class="col-lg-12 mb-2">
				<div class="contact-form bg-light mb-4" style="padding: 30px;">
					<table id="example1" class="table table-bordered table-striped">
						<thead>
							<tr style="background-color: #c5c5c5;">
								<th>#</th>
								<th><i class="fa fa-list-ol"></i> Booking No.</th>
								<th><i class="fa fa-list-ol"></i> Vehicle</th>
								<th><i class="fa fa-calendar"></i> From Date</th>
								<th><i class="fa fa-calendar"></i> To Date</th>
								<th><i class="fa fa-list-ol"></i> Status</th>
								<th><i class="fa fa-calendar"></i> Booking Date</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<%
								BookDAO dao = new BookDAO(DbConnect.Connect());
								List<Booking> list = dao.getAllBooking(email);
								int i = 0;
								for (Booking n : list) {
									i++;
							%>
							<tr>
								<td><%=i%></td>
								<td><%=n.getBookingNumber()%></td>
								<%
									int vid = n.getVehicleId();
										try {
											Connection con = DbConnect.Connect();
											Statement st = con.createStatement();
											ResultSet rs = st.executeQuery("select * from vehicles where id="+vid);
											if (rs.next()) {
								%>
								<td><%=rs.getString("VehiclesTitle")%></td>
								<%
									}
								%>
								<%
									} catch (Exception e) {
											System.out.println(e);
										}
								%>
								<td><%=n.getFromDate()%></td>
								<td><%=n.getToDate()%></td>
								<% if (n.getStatus() == null) { %>
								<td>Not Update Yet</td>
								<% } else { %>
								<td><%=n.getStatus()%></td>
								<% } %>
								<td><%=n.getPostingDate()%></td>
								<td><a href="mybookingDtls.jsp?id=<%=n.getId()%>"
									class="btn btn-sm btn-primary"><i class="fas fa-eye"></i>
										View</a></td>
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

<%@include file="userfooter.jsp"%>