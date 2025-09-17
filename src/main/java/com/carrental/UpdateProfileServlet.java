package com.carrental;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/updateProfile")
public class UpdateProfileServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	  try {
		    int id=Integer.parseInt(req.getParameter("id"));
			String FullName = req.getParameter("FullName");
			String ContactNo = req.getParameter("ContactNo");
			String Address = req.getParameter("Address");
			String City = req.getParameter("City");
			String Country = req.getParameter("Country");
			String EmailId = req.getParameter("EmailId");
			
			Users u = new Users();
			u.setId(id);
			u.setFullName(FullName);
			u.setContactNo(ContactNo);
			u.setAddress(Address);
			u.setCity(City);
			u.setCountry(Country);
			u.setEmailId(EmailId);
			
			
		    UserDAO dao = new UserDAO(DbConnect.Connect());
			boolean f=dao.updateUserProfile(u);
			
			HttpSession session=req.getSession();
			
			if(f) {
				session.setAttribute("succMsg", "Profile Updated Successfully..");
				resp.sendRedirect("user/myProfile.jsp?id="+id);
			}else {
				session.setAttribute("failedMsg", "Something went wrong..!!!");
				resp.sendRedirect("user/myProfile.jsp?id="+id);
			}		
	} catch (Exception e) {
		e.printStackTrace();
	}	
	}
}
