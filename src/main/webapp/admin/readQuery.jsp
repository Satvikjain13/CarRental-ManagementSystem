<%@include file="adminNavbar.jsp"%>
<%@page import="com.carrental.DbConnect"%>
<%@page import="java.sql.*"%>
<div class="content-wrapper">

<section class="content">
  <div class="row">
     <div class="col-xs-12">
        <div class="box">
          <div class="box-header">
             <h3 class="box-title"><i class="fa fa-cab"></i> Read Queries</h3>

           <div class="box-body">
            <table id="example1" class="table table-bordered table-striped">
              <thead>
                <tr style="background-color: #c5c5c5;">
                 <th>#</th>
                 <th><i class="fa fa-user"></i> Full Name</th>
                 <th><i class="fa fa-list-ol"></i> Email Id</th>
                 <th><i class="fa fa-calendar"></i> Contact No.</th>
                 <th><i class="fa fa-calendar"></i> Posting Date</th>
                 <th>Action</th>
                </tr>
              </thead>

              <tbody>

                <%
				  try{
					  Connection con = DbConnect.Connect();
					  Statement st = con.createStatement();
					  ResultSet rs = st.executeQuery("Select * from contactusquery where status='yes'");
					  int i=0;
					  while(rs.next()){
						  i++;
				%>
              
                <tr>
                  <td><%=i %></td>
                  <td><%=rs.getString("name") %></td>
                  <td><%=rs.getString("EmailId") %></td>
                  <td><%=rs.getString("ContactNumber") %></td>
                  <td><%=rs.getString("PostingDate") %></td>
                  <td align="center">
                    <a class="btn btn-primary btn-sm" href="viewQuery.jsp?id=<%=rs.getInt("id")%>"><i class="fa fa-eye"></i></a>
                  </td>
                </tr>
              </tbody>
              <%
					  }
				  }catch(Exception e){
					  e.printStackTrace();
				  }
              %>
              
            </table>
          </div>
        </div>
     </div>
  </div>
  </div>
</section>
</div>
<%@include file="adminFooter.jsp"%>
 