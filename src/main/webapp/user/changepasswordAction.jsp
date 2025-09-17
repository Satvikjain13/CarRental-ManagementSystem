<%@page import="com.carrental.DbConnect"%>
<%@page import="java.sql.*"%>
<%
	String email = session.getAttribute("email").toString();
	String oldPassword = request.getParameter("oldpassword");
	String newPassword = request.getParameter("newpassword");
	String confirmPassword = request.getParameter("confirmpassword");

	if (!confirmPassword.equals(newPassword))
		response.sendRedirect("mychangePassword.jsp?msg=notMatch");
	else {
		int check = 0;
		try {
			Connection con = DbConnect.Connect();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(
					"select * from users where EmailId='" + email + "' and Password='" + oldPassword + "'");
			while (rs.next()) {
				check = 1;
				st.executeUpdate("update users set Password='" + newPassword + "' where EmailId='" + email + "'");
				response.sendRedirect("mychangePassword.jsp?msg=done");
			}
			if (check == 0)
				response.sendRedirect("mychangePassword.jsp?msg=wrong");
		} catch (Exception e) {
			System.out.println(e);
		}
	}
%>