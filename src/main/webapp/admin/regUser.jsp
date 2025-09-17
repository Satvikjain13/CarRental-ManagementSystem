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
							<i class="fa fa-user"></i> Register User
						</h3>
						<br>
						<br>
						<br>
						<div class="box-body">
							<table id="example1" class="table table-bordered table-striped">
								<thead>
									<tr style="background-color: #c5c5c5;">
										<th>#</th>
										<th><i class="fa fa-user"></i> Full Name</th>
										<th><i class="fa fa-list-ol"></i> Email Id</th>
										<th><i class="fa fa-phone"></i> Contact No.</th>
										<th><i class="fa fa-calendar"></i> DOB</th>
										<th><i class="fa fa-map-marker"></i> Address</th>
										<th><i class="fa fa-map-marker"></i> City</th>
										<th><i class="fa fa-map-marker"></i> Country</th>
										<th><i class="fa fa-calendar"></i> Reg Date</th>
										<th>Action</th>
									</tr>
								</thead>

								<tbody>
									<%
									 try{
										 Connection con = DbConnect.Connect();
										 Statement st = con.createStatement();
										 ResultSet rs = st.executeQuery("select * from users");
										 int i = 0;
										 while (rs.next()) {
												i++;
									%>

									<tr>
										<td><%=i %></td>
										<td><%=rs.getString("FullName") %></td>
										<td><%=rs.getString("EmailId") %></td>
										<td><%=rs.getString("ContactNo") %></td>
										<td><%=rs.getString("dob") %></td>
										<td><%=rs.getString("Address") %></td>
										<td><%=rs.getString("City") %></td>
										<td><%=rs.getString("Country") %></td>
										<td><%=rs.getString("RegDate") %></td>
										<td align="center"><a class="btn btn-danger btn-sm"
											onclick="return confirm('Are you sure to Delete ?')" href="#"><i
												class="fa fa-trash"></i></a></td>
									</tr>
									<%
										 }
									 }catch(Exception e){
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
<%@include file="adminFooter.jsp"%>