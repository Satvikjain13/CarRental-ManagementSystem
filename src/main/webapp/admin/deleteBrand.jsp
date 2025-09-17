<%@page import="com.carrental.DbConnect"%>
<%@page import="java.sql.*"%>

<%
	int id = Integer.parseInt(request.getParameter("id"));
	try {
		Connection con = DbConnect.Connect();
		Statement st = con.createStatement();
		st.executeUpdate("delete from brands where id="+id+"");
		response.sendRedirect("brands.jsp");
	} catch (Exception e) {
		System.out.println(e);
	}
%>