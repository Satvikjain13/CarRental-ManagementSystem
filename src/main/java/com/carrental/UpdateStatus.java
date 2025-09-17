package com.carrental;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/updateStatus")
public class UpdateStatus extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
		    int bid=Integer.parseInt(req.getParameter("id"));
			String Status = req.getParameter("Status");
						
			Booking ap = new Booking();
			ap.setId(bid);
			ap.setStatus(Status);
			
			
			BookDAO dao = new BookDAO(DbConnect.Connect());
			boolean f=dao.updateStatus(ap);
			
			HttpSession session=req.getSession();
			
			if(f) {
				session.setAttribute("succMsg", "Status has been Updated");
				resp.sendRedirect("admin/viewBooking.jsp?id="+bid);
			}else {
				session.setAttribute("failedMsg", "somethng went wrong..!!!");
				resp.sendRedirect("admin/viewBooking.jsp?id="+bid);
			}		
	} catch (Exception e) {
		e.printStackTrace();
	}		
	}
}
