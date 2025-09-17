<%@page import="com.carrental.DbConnect"%>
<%@page import="java.sql.*"%>
<%@include file="adminNavbar.jsp"%>

<div class="content-wrapper">
	<section class="content-header">
		<h1 align="center">
			<i class="fa fa-cab"></i> Search <small></small>
		</h1>
	</section>

	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
					<div class="box-header">
						<h3 class="box-title">
							<i class="fa fa-cab"></i> Search
						</h3>
						<form action="" method="post">

							<div class="modal-body">
								<div class="box box-primary">
									<div class="box-body">
										<div class="form-group">
											<label>Search By Booking Number</label> <input type="text"
												name="searchdata" class="form-control"
												placeholder="Enter Booking Number" required>
										</div>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-primary">Search</button>
							</div>
						</form>


						<div class="box-body">

							<table id="example1" class="table table-bordered table-striped">
								<thead>
									<tr>
										<th>S.No</th>
										<th>Full Name</th>
										<th>Booking No.</th>
										<th>Email ID</th>
										<th>Action</th>
									</tr>
								</thead>

								<tbody>
									<%
										int i = 0;
										try {
											String search = request.getParameter("searchdata");
											Connection con = DbConnect.Connect();
											Statement st = con.createStatement();
											ResultSet rs = st.executeQuery("select * from booking where BookingNumber like '%" + search + "%'");
											while (rs.next()) {
												i = i + 1;
									%>
									<tr>
										<td><%=i%></td>
										<%
											String usermail = rs.getString("userEmail");
											try {
											Connection con1 = DbConnect.Connect();
											Statement st1 = con1.createStatement();
											ResultSet rs1 = st1.executeQuery("select * from users where EmailId='"+ usermail +"' ");
											if (rs1.next()) {
										%>
										<td><%=rs1.getString("FullName")%></td>
										<%
											}
										%>
										<%
											} catch (Exception e) {
														System.out.println(e);
													}
										%>
										<td><%=rs.getString("BookingNumber")%></td>
										<td><%=rs.getString("userEmail")%></td>
										<td>
											<div class="btn-group">
												<a class="btn btn-primary"
													href="viewBooking.jsp?id=<%=rs.getInt("id")%>"><i
													class="fa fa-eye"></i></a>
											</div>
										</td>
									</tr>
									<%
										if (i == 1) {
									%>
									<h4 align="center">
										Result against "<%
										out.println(search);
									%>" keyword
									</h4>
									<%
										} else {
									%>
									<h4>No record found against this search</h4>
									<%
										}
									%>
									</tr>
									<br>
									<%
										}
										} catch (Exception e) {
											System.out.println(e);
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