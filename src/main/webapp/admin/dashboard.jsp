<%@page import="com.carrental.DbConnect"%>
<%@page import="java.sql.*"%>
<%@include file="adminNavbar.jsp"%>

<div class="content-wrapper">
	<section class="content-header">
		<h1 align="center">
			<i class="fa fa-cab"></i> Dashboard
		</h1>
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
					<div class="box-header">
						<h3 class="box-title">
							<i class="fa fa-cab"></i> Dashboard
						</h3>
					</div>
				</div>
			</div>

			<div class="col-md-12">
				<div class="row">
				<%
						try {
							int count = 0;
							Connection con = DbConnect.Connect();
							Statement st = con.createStatement();
							ResultSet rs = st.executeQuery("Select * from users");
							while (rs.next()) {
								count++;
							}
					%>
					<a href="regUser.jsp">
						<div class="col-md-3">
							<div class="panel panel-default">
								<div class="panel-body bk-primary text-primary">
									<div class="stat-panel text-center">
										<div class="stat-panel-number h1 "><%out.print(count);%></div>
										<div class="stat-panel-title text-uppercase">Reg Users</div>
									</div>
								</div>
							</div>
						</div>
					</a> 
					<%
						
					%>
					
					
					<a href="manageVehicle.jsp">
						<div class="col-md-3">
						<%
							int count1 = 0;
								ResultSet rs1 = st.executeQuery("SELECT * from vehicles");
								while (rs1.next()) {
									count1++;
								}
						%>
							<div class="panel panel-default">
								<div class="panel-body bk-success text-danger">
									<div class="stat-panel text-center">
										<div class="stat-panel-number h1 "><%out.print(count1);%></div>
										<div class="stat-panel-title text-uppercase">Listed
											Vehicles</div>
									</div>
								</div>
							</div>
						</div>
					</a> 
					
					<a href="allBooking.jsp">
						<div class="col-md-3">
						<%
							int count2 = 0;
								ResultSet rs2 = st.executeQuery("SELECT * from booking");
								while (rs2.next()) {
									count2++;
								}
						%>
							<div class="panel panel-default">
								<div class="panel-body bk-info text-success">
									<div class="stat-panel text-center">
										<div class="stat-panel-number h1 "><%out.print(count2);%></div>
										<div class="stat-panel-title text-uppercase">Total
											Bookings</div>
									</div>
								</div>
							</div>
						</div>
					</a> 
					
					<a href="brands.jsp">
						<div class="col-md-3">
						<%
							int count3 = 0;
								ResultSet rs3 = st.executeQuery("SELECT * from brands");
								while (rs3.next()) {
									count3++;
								}
						%>
							<div class="panel panel-default">
								<div class="panel-body bk-warning text-warning">
									<div class="stat-panel text-center">
										<div class="stat-panel-number h1 "><%out.print(count3);%></div>
										<div class="stat-panel-title text-uppercase">Listed
											Brands</div>
									</div>
								</div>
							</div>
						</div>
					</a> <a href="unreadQuery.jsp">
						<div class="col-md-3">
						<%
							int count4 = 0;
								ResultSet rs4 = st.executeQuery("SELECT * from contactusquery where status is null");
								while (rs4.next()) {
									count4++;
								}
						%>
							<div class="panel panel-default">
								<div class="panel-body bk-success text-light">
									<div class="stat-panel text-center">
										<div class="stat-panel-number h1 "><%out.print(count4);%></div>
										<div class="stat-panel-title text-uppercase">Unread
											Queries</div>
									</div>
								</div>
							</div>
						</div>
					</a> <a href="readQuery.jsp">
						<div class="col-md-3">
						<%
							int count5 = 0;
								ResultSet rs5 = st.executeQuery("SELECT * from contactusquery where status='yes'");
								while (rs5.next()) {
									count5++;
								}
						%>
							<div class="panel panel-default">
								<div class="panel-body bk-success text-light">
									<div class="stat-panel text-center">
										<div class="stat-panel-number h1 "><%out.print(count5);%></div>
										<div class="stat-panel-title text-uppercase">Read
											Queries</div>
									</div>
								</div>
							</div>
						</div>
					</a>
					<%
						} catch (Exception e) {
							System.out.println(e);
						}
					%>
				</div>
			</div>
		</div>
</div>
</section>
</div>
<%@include file="adminFooter.jsp"%>