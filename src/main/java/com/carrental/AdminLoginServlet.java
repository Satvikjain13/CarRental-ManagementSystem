package com.carrental;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class AdminLoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("username");
		String pass = req.getParameter("password");
				
		UserDAO dao = new UserDAO(DbConnect.Connect());
		Users e = dao.loginAdmin(email, pass);
		
		HttpSession session = req.getSession();
		
		if(e!=null) {
			session.setAttribute("username", email);
			session.setAttribute("validMsg", "Logged in Successfully");
			resp.sendRedirect("admin_login.jsp");			
		}
		else {
			session.setAttribute("invalidMsg", "Invalid Creadential !! Please Try Again..");
			resp.sendRedirect("admin_login.jsp");			
		}
	}	
}