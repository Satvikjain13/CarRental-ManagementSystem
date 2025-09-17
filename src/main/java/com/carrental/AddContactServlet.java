package com.carrental;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/contact")
public class AddContactServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
    	String name = req.getParameter("name");
    	String EmailId = req.getParameter("EmailId");
    	String ContactNumber = req.getParameter("ContactNumber");
    	String Message = req.getParameter("Message");
    	String status = req.getParameter("status");
        
        try {
            Contactusquery c=new Contactusquery(name, EmailId,ContactNumber,Message,status);
            ContactDAO.addContact(c);
            resp.sendRedirect("contact.jsp?msg=valid");

        } catch (Exception e) {
            resp.getWriter().println("Error " + e.getMessage());
        }
    }
}