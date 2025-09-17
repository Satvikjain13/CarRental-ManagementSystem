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
							<i class="fa fa-cab"></i> View Queries Details
						</h3>
						<%
							int id = Integer.parseInt(request.getParameter("id"));
							try {

								Connection con = DbConnect.Connect();
								Statement st = con.createStatement();
								ResultSet rs = st.executeQuery("select * from contactusquery where id=" + id + "");
								while (rs.next()) {
						%>
						<div class="box-body">
							<table id="example1" class="table table-bordered table-striped">
								<h3 style="color: red; text-align: center">View Queries
									Details</h3>
								<tr>
									<th>Full Name</th>
									<td><%=rs.getString("name")%></td>
								</tr>

								<tr>
									<th>Email Id</th>
									<td><%=rs.getString("EmailId")%></td>
								</tr>

								<tr>
									<th>Contact Number</th>
									<td><%=rs.getString("ContactNumber")%></td>
								</tr>

								<tr>
									<th>Message</th>
									<td><%=rs.getString("Message")%></td>
								</tr>

								<tr>
									<th>Query Date</th>
									<td><%=rs.getString("PostingDate")%></td>
								</tr>
							</table>
						</div>
						<%
							}
							} catch (Exception e) {
								System.out.println(e);
							}

							try {
								Connection conn1 = DbConnect.Connect();
								Statement st1 = conn1.createStatement();
								st1.executeUpdate("update contactusquery set status='yes' where id=" + id + "");
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