package com.carrental;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/addVehicle")
@MultipartConfig
public class AddVehicleServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String VehiclesTitle = req.getParameter("VehiclesTitle");
        int VehiclesBrand = Integer.parseInt(req.getParameter("VehiclesBrand"));
        String VehiclesOverview = req.getParameter("VehiclesOverview");
        float PricePerDay = Float.parseFloat(req.getParameter("PricePerDay"));
        String FuelType = req.getParameter("FuelType");
        int ModelYear = Integer.parseInt(req.getParameter("ModelYear"));
        int SeatingCapacity = Integer.parseInt(req.getParameter("SeatingCapacity"));
        
        String AirConditioner = ""; 
        if(req.getParameter("AirConditioner")==null)
        {
        	AirConditioner = "no";
        }
        else
        {
        	AirConditioner = "yes";
        }
        
        String PowerDoorLocks = ""; 
        if(req.getParameter("PowerDoorLocks")==null)
        {
        	PowerDoorLocks = "no";
        }
        else
        {
        	PowerDoorLocks = "yes";
        }
        
        String AntiLockBrakingSystem = ""; 
        if(req.getParameter("AntiLockBrakingSystem")==null)
        {
        	AntiLockBrakingSystem = "no";
        }
        else
        {
        	AntiLockBrakingSystem = "yes";
        }
        
        String BrakeAssist = ""; 
        if(req.getParameter("BrakeAssist")==null)
        {
        	BrakeAssist = "no";
        }
        else
        {
        	BrakeAssist = "yes";
        }
        
        String PowerSteering = ""; 
        if(req.getParameter("PowerSteering")==null)
        {
        	PowerSteering = "no";
        }
        else
        {
        	PowerSteering = "yes";
        }
        
        String DriverAirbag = ""; 
        if(req.getParameter("DriverAirbag")==null)
        {
        	DriverAirbag = "no";
        }
        else
        {
        	DriverAirbag = "yes";
        }
        
        String PassengerAirbag = ""; 
        if(req.getParameter("PassengerAirbag")==null)
        {
        	PassengerAirbag = "no";
        }
        else
        {
        	PassengerAirbag = "yes";
        }
        
        String PowerWindows = ""; 
        if(req.getParameter("PowerWindows")==null)
        {
        	PowerWindows = "no";
        }
        else
        {
        	PowerWindows = "yes";
        }
        
        String CDPlayer = ""; 
        if(req.getParameter("CDPlayer")==null)
        {
        	CDPlayer = "no";
        }
        else
        {
        	CDPlayer = "yes";
        }
        
        String CentralLocking = ""; 
        if(req.getParameter("CentralLocking")==null)
        {
        	CentralLocking = "no";
        }
        else
        {
        	CentralLocking = "yes";
        }
        
        String CrashSensor = ""; 
        if(req.getParameter("CrashSensor")==null)
        {
        	CrashSensor = "no";
        }
        else
        {
        	CrashSensor = "yes";
        }
        
        String LeatherSeats = ""; 
        if(req.getParameter("LeatherSeats")==null)
        {
        	LeatherSeats = "no";
        }
        else
        {
        	LeatherSeats = "yes";
        }
        
        Part Vimage1 = req.getPart("Vimage1");
        Part Vimage2 = req.getPart("Vimage2");
        Part Vimage3 = req.getPart("Vimage3");
        Part Vimage4 = req.getPart("Vimage4");
        Part Vimage5 = req.getPart("Vimage5");
       
        try {
            Vehicles p=new Vehicles(VehiclesTitle, VehiclesBrand, VehiclesOverview, PricePerDay, FuelType, ModelYear, SeatingCapacity, AirConditioner,
            		PowerDoorLocks, AntiLockBrakingSystem, BrakeAssist, PowerSteering, DriverAirbag, PassengerAirbag, PowerWindows, CDPlayer, CentralLocking, CrashSensor, LeatherSeats);
            VehicleDAO.addVehicle(p, Vimage1, Vimage2, Vimage3, Vimage4, Vimage5, getServletContext());
            resp.sendRedirect("admin/addVehicle.jsp?msg=valid");

        } catch (Exception e) {
            resp.getWriter().println("Error " + e.getMessage());
        }
    }
}