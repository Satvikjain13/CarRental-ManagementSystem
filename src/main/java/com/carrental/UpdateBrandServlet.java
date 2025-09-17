package com.carrental;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/updateBrand")
public class UpdateBrandServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	String id = req.getParameter("id");
    	String BrandName = req.getParameter("BrandName");
      
        try {            
            Brand b=new Brand();
            b.setId(Integer.parseInt(id));
            b.setBrandName(BrandName);
                        
            BrandDAO.updateBrand(b);

            resp.sendRedirect("admin/editBrand.jsp?msg=valid&id="+id);

        } catch (Exception e) {
            resp.getWriter().println("Error " + e.getMessage());
        }
    }
}
