package com.carrental;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/bookCar")
public class BookingCarServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	String email=req.getParameter("email");
    	email = email.trim();
    	int VehicleId = Integer.parseInt(req.getParameter("id"));
        int BookingNumber = (int) (Math.random() * 100000000);
    	String FromDate = req.getParameter("FromDate");
        String ToDate = req.getParameter("ToDate");
        String message = req.getParameter("message");
        String Status = req.getParameter("Status");
               
        try {
            Booking b=new Booking(BookingNumber,email,VehicleId,FromDate,ToDate,message,Status);
            BookDAO.BookingCar(b);
            resp.sendRedirect("user/vehicleDetails.jsp?msg=valid&id="+VehicleId);

        } catch (Exception e) {
            resp.getWriter().println("Error " + e.getMessage());
        }
    }
}