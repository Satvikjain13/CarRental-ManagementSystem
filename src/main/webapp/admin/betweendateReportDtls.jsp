<%@page import="com.carrental.DbConnect"%>
<%@page import="java.sql.*"%>
<%@include file="adminNavbar.jsp"%>

<div class="content-wrapper">

<section class="content">
  <div class="row">
     <div class="col-xs-12">
        <div class="box">
          <div class="box-header">
             <h3 class="box-title"><i class="fa fa-cab"></i> Between Date Report Details</h3>

           <div class="box-body">
               
            <table id="example1" class="table table-bordered table-striped">
              <thead>
                <tr style="background-color: #c5c5c5;">
                 <th>#</th>
                 <th><i class="fa fa-user"></i> Full Name</th>
                 <th><i class="fa fa-list-ol"></i> Booking No.</th>
                 <th><i class="fa fa-calendar"></i> From Date</th>
                 <th><i class="fa fa-calendar"></i> To Date</th>
                 <th><i class="fa fa-list-ol"></i> Status</th>
                 <th><i class="fa fa-calendar"></i> Posting Date</th>
                 <th>Action</th>
                </tr>
              </thead>

              <tbody>

                <%
				  try {
							
					String fromDate = request.getParameter("fromDate").toString();
					String toDate = request.getParameter("toDate").toString();

					Connection con = DbConnect.Connect();
					Statement st = con.createStatement();
					ResultSet rs = st.executeQuery(
							"Select * from booking where date(PostingDate) between '" + fromDate + "' and '" + toDate + "'");
					int i = 0;
    				while (rs.next()) {
    					i++;
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
                        <td><%=rs.getString("FromDate")%></td>
                        <td><%=rs.getString("ToDate")%></td>
                        
                        <% if(rs.getString("Status") == null) { %>
                        <td>Not Update Yet</td>
                        <% } else { %>
                        <td><%=rs.getString("Status")%></td>
                        <% } %>
                        <td><%=rs.getString("PostingDate")%></td>
                        <td>
                            <div class="btn-group">
                                <a class="btn btn-primary" href="viewBooking.jsp?id=<%=rs.getInt("id")%>"><i class="fa fa-eye"></i></a>
                            </div>
                        </td>
                    </tr>
                    <%
				}
				%>
				<h3 align="center" style="color: blue">
					Report from
					<span style="color: red"><%
	    				out.println(fromDate);
					%> </span>
					to
					<span style="color: red"><%
						out.println(toDate);
					%> </span>
				</h3>
					
				<br>
				<%
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
<%@include file="adminFooter.jsp" %>