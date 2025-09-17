package com.carrental;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
    	String FullName = req.getParameter("FullName");
        String EmailId = req.getParameter("EmailId");
        String Password = req.getParameter("Password");
        String ContactNo = req.getParameter("ContactNo");
        String dob =req.getParameter("dob");
        String Address = req.getParameter("Address");
        String City = req.getParameter("City");
        String Country = req.getParameter("Country");
       
        try {
            Users p=new Users(FullName, EmailId, Password, ContactNo, dob, Address, City, Country);
            UserDAO.addUser(p);
            resp.sendRedirect("signup.jsp?msg=valid");

        } catch (Exception e) {
            resp.getWriter().println("Error " + e.getMessage());
        }
	}
	
	

}
