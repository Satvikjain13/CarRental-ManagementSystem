package com.carrental;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/userlogin")
public class UserLoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("EmailId");
		String pass = req.getParameter("Password");
		
		UserDAO dao = new UserDAO(DbConnect.Connect());
		Users u = dao.login(email, pass);
		
		HttpSession session = req.getSession();
		if(u!=null) {
			session.setAttribute("email", email);
			session.setAttribute("userId", u.getId());
			session.setAttribute("validMsg", "Logged In Successfully");
			resp.sendRedirect("user_login.jsp");			
		}
		else {
			session.setAttribute("invalidMsg", "Invalid Credential, Try Again..");
			resp.sendRedirect("user_login.jsp");			
		}
	}
}