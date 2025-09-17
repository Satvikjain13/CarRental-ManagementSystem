<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.carrental.DbConnect"%>
<%@page import="java.sql.Connection"%>
<%@include file="adminNavbar.jsp"%>

<div class="content-wrapper">

	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
					<div class="box-header">
						<h3 class="box-title">
							<i class="fa fa-cab"></i> View Booking Details
						</h3>
					</div>

					<%
					int bid = Integer.parseInt(request.getParameter("id"));
					int grandtotal =0;
				  	try {
					  Connection con = DbConnect.Connect();
					  Statement st = con.createStatement();
					  ResultSet rs = st.executeQuery("SELECT users.*,brands.BrandName,vehicles.VehiclesTitle,booking.FromDate,booking.ToDate,booking.message,booking.VehicleId as vid,booking.Status,booking.PostingDate,booking.LastUpdationDate,booking.id,booking.BookingNumber,DATEDIFF(booking.ToDate,booking.FromDate) as totalnodays,vehicles.PricePerDay from booking join vehicles on vehicles.id=booking.VehicleId join users on users.EmailId=booking.userEmail join brands on vehicles.VehiclesBrand=brands.id where booking.id="+bid);
					  while(rs.next()){
						  grandtotal = Integer.parseInt(rs.getString("totalnodays")) * rs.getInt("PricePerDay");
				%>
				<div class="box-body">
						<table id="example1" class="table table-bordered table-striped">
							<tr>
								<h3 style="text-align: center; color: red">View Booking
									Details</h3>
							</tr>
							<tr>
								<th>Booking Number</th>
								<td><%=rs.getInt("BookingNumber") %></td>

								<th>Full Name</th>
								<td><%=rs.getString("FullName") %></td>
							</tr>

							<tr>
								<th>Email Id</th>
								<td><%=rs.getString("EmailId") %></td>

								<th>Contact No</th>
								<td><%=rs.getString("ContactNo") %></td>
							</tr>

							<tr>
								<th>Address</th>
								<td><%=rs.getString("Address") %></td>

								<th>City</th>
								<td><%=rs.getString("City") %></td>
							</tr>
							<tr>
								<th>Country</th>
								<td><%=rs.getString("Country") %></td>
							</tr>
						</table>
						<br>
						<table id="example1" class="table table-bordered table-striped">
							<tr>
								<h4 style="text-align: center; color: red">Booking Details</h4>
							</tr>
							<tr>
								<th>Vehicle Name</th>
								<td><%=rs.getString("VehiclesTitle") %></td>

								<th>Booking Date</th>
								<td><%=rs.getString("PostingDate") %></td>
							</tr>

							<tr>
								<th>From Date</th>
								<td><%=rs.getString("FromDate") %></td>

								<th>To Date</th>
								<td><%=rs.getString("ToDate") %></td>
							</tr>

							<tr>
								<th>Total Days</th>
								<td>
									<%=rs.getString("totalnodays")%>
								</td>

								<th>Rent Per Days</th>
								<td><%=rs.getFloat("PricePerDay") %></td>
							</tr>

							<tr>
								<th colspan="3" style="text-align: center; color: red">Grand
									Total</th>
								<td><%out.print(grandtotal);%></td>
							</tr>

							<tr>
								<th>Booking Status</th>
								<% 
                            	if(rs.getString("Status") == null){
                            %>
								<td>Not Update Yet</td>
								<% } else { %>
								<td><%=rs.getString("Status") %></td>
								<% } %>

								<th>Updation Date</th>
								<% 
                            	if(rs.getString("LastUpdationDate") == null){
                            %>
								<td>Not Update Yet</td>
								<% } else { %>
								<td><%=rs.getString("LastUpdationDate") %></td>
								<% } %>
							</tr>
						</table>

						<% 
                            	if(rs.getString("Status") == null){
                        %>
						<button type="button" class="btn btn-primary btn-sm"
							style="margin-left: 2%" data-toggle="modal" data-target="#add">
							Take Action</button>
						<%
                            }
						%>
						<div class="modal fade" id="add">
							<div class="modal-dialog">
								<form action="../updateStatus" method="post">

									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
											<h4 class="modal-title">Update Status</h4>
										</div>

										<div class="modal-body">
											<div class="box box-primary">
												<div class="box-body">
													<div class="form-group">
														<label>Status</label> 
														<select name="Status" class="form-control">
															<option value="Confirm">Confirm</option>
															<option value="Cancel">Cancel</option>
														</select>
													</div>
												</div>
											</div>
										</div>
										<input type="hidden" name="id" value="<%=bid%>">
										<div class="modal-footer">
											<button type="button" class="btn btn-danger pull-left"
												data-dismiss="modal">Close</button>
											<button type="submit" class="btn btn-primary">Submit</button>
										</div>
									</div>
								</form>
							</div>
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
	</section>
	
</div>

<%@include file="adminFooter.jsp"%>