<%@page import="com.carrental.DbConnect"%>
<%@page import="java.sql.*"%>

<%
	int id = Integer.parseInt(request.getParameter("id"));
	try {
		Connection con = DbConnect.Connect();
		Statement st = con.createStatement();
		st.executeUpdate("delete from vehicles where id="+id+"");
		response.sendRedirect("manageVehicle.jsp");
	} catch (Exception e) {
		System.out.println(e);
	}
%>