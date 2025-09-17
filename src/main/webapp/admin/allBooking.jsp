<%@page import="com.carrental.DbConnect"%>
<%@page import="java.sql.*"%>
<%@include file="adminNavbar.jsp"%>

<div class="content-wrapper">
	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
					<div class="box-header">
						<h3 class="box-title">
							<i class="fa fa-cab"></i> All Booking
						</h3>

						<div class="box-body">
							<table id="example1" class="table table-bordered table-striped">
								<thead>
									<tr style="background-color: #c5c5c5;">
										<th>#</th>
										<th><i class="fa fa-user"></i> Full Name</th>
										<th><i class="fa fa-list-ol"></i> Booking No.</th>
										<th><i class="fa fa-list-ol"></i> Vehicle</th>
										<th><i class="fa fa-calendar"></i> From Date</th>
										<th><i class="fa fa-calendar"></i> To Date</th>
										<th><i class="fa fa-list-ol"></i> Status</th>
										<th><i class="fa fa-calendar"></i> Posting Date</th>
										<th>Action</th>
									</tr>
								</thead>

								<%
									try {
										Connection con = DbConnect.Connect();
										Statement st = con.createStatement();
										ResultSet rs = st.executeQuery("SELECT * from booking");
										int i = 0;
										while (rs.next()) {
											i++;
								%>
								<tbody>
									<tr>
										<td><%=i%></td>
										
										<%
											String usermail = rs.getString("userEmail");
											try {
											Connection con2 = DbConnect.Connect();
											Statement st2 = con2.createStatement();
											ResultSet rs2 = st2.executeQuery("select * from users where EmailId='"+ usermail +"' ");
											if (rs2.next()) {
										%>
										<td><%=rs2.getString("FullName")%></td>
										<%
											}
										%>
										<%
											} catch (Exception e) {
														System.out.println(e);
													}
										%>
										
										<td><%=rs.getString("BookingNumber")%></td>
										<%
											String vid = rs.getString("VehicleId");
													try {

														Connection con1 = DbConnect.Connect();
														Statement st1 = con1.createStatement();
														ResultSet rs1 = st1.executeQuery("select * from vehicles where id=" +vid);
														if (rs1.next()) {
										%>
										<td><%=rs1.getString("VehiclesTitle")%></td>
										<%
											}
										%>
										<%
											} catch (Exception e) {
														System.out.println(e);
													}
										%>
										<td><%=rs.getString("FromDate")%></td>
										<td><%=rs.getString("ToDate")%></td>
										
										<%
										  if (rs.getString("Status") == null){
										%>
										<td>Not Update Yet</td>
										<% } else { %>
										<td><%=rs.getString("Status")%></td>
										<% } %>
										
										<td><%=rs.getString("PostingDate")%></td>
										<td align="center"><a class="btn btn-primary btn-sm"
											href="viewBooking.jsp?id=<%=rs.getInt("id")%>"><i class="fa fa-eye"></i></a></td>
									</tr>
									<%
										}
										} catch (Exception e) {
											e.printStackTrace();
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
<%@include file="adminFooter.jsp" %>