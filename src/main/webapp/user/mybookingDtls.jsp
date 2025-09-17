<%@page import="com.carrental.Booking"%>
<%@page import="java.util.List"%>
<%@page import="com.carrental.BookDAO"%>
<%@include file="usernavbar.jsp"%>

<!-- Page Header Start -->
<div class="container-fluid page-header"
	xmlns="http://www.w3.org/1999/html">
	<h1 class="display-3 text-uppercase text-white mb-3">My Booking
		Details</h1>
	<div class="d-inline-flex text-white">
		<h6 class="text-uppercase m-0">
			<a class="text-white" href="userindex.jsp">Home</a>
		</h6>
		<h6 class="text-body m-0 px-3">/</h6>
		<h6 class="text-uppercase text-body m-0">My Booking Details</h6>
	</div>
</div>
<!-- Page Header Start -->

<div class="container-fluid py-2">
	<div class="container pt-2 pb-3">
		<h1 class="display-4 text-uppercase text-center mb-2">My Booking
			Details</h1>
		<div class="row">

			<%
				String vid = request.getParameter("id");
				int grandtotal =0;
				try {
					Connection con = DbConnect.Connect();
					Statement st = con.createStatement();
					ResultSet rs = st.executeQuery("SELECT vehicles.VehiclesTitle,vehicles.id,brands.BrandName,booking.FromDate,booking.ToDate,booking.message,booking.Status,vehicles.PricePerDay,DATEDIFF(booking.ToDate,booking.FromDate) as totaldays,booking.BookingNumber from booking join vehicles on booking.VehicleId=vehicles.id join brands on brands.id=vehicles.VehiclesBrand where booking.id='"+vid+"' order by booking.id desc");
					if (rs.next()) {
						grandtotal = Integer.parseInt(rs.getString("totaldays")) * rs.getInt("PricePerDay");
			%>
			<div class="col-lg-12 mb-2">
				<div class="contact-form bg-light mb-4" style="padding: 30px;">
					<table id="example1" class="table table-bordered table-striped">
						<tr>
							<th>Booking No</th>
							<td colspan="3"><%=rs.getInt("BookingNumber")%></td>
						</tr>

						<tr>
							<th>Brand</th>
							<td><%=rs.getString("BrandName")%></td>
							
							<th>Vehicle Name</th>
							<td><%=rs.getString("VehiclesTitle")%></td>							
						</tr>

						<tr>
							<th>From Date</th>
							<td><%=rs.getString("FromDate")%></td>

							<th>To Date</th>
							<td><%=rs.getString("ToDate")%></td>
						</tr>

						<tr>
							<th>Message</th>
							<td><%=rs.getString("message")%></td>

							<th>Status</th>
							<%
								if (rs.getString("Status") == null) {
							%>
							<td>Not Update Yet</td>
							<%
								} else {
							%>
							<td><%=rs.getString("Status")%></td>
							<%
								}
							%>
						</tr>

						<tr>
							<th>Total Days</th>
							<td><%=rs.getString("totaldays")%></td>

							<th>Rent/Days</th>
							<td><%=rs.getFloat("PricePerDay")%></td>
						</tr>
						<tr>
							<th colspan="3" style="text-align: center; color: red">Grand
								Total</th>
							<td><%out.print(grandtotal);%>Rs.</td>
						</tr>
					</table>
				</div>
			</div>
			<%
				}
				} catch (Exception e) {
					System.out.println(e);
				}
			%>
		</div>
	</div>
</div>

<%@include file="userfooter.jsp"%>