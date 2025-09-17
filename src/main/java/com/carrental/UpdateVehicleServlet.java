package com.carrental;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/updateVehicle")
@MultipartConfig
public class UpdateVehicleServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	String id = req.getParameter("id");
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

        try {
            if (!req.getPart("Vimage1").getSubmittedFileName().isEmpty()) {
                Part Vimage1 = req.getPart("Vimage1");
                VehicleDAO.fileCopy(getServletContext(), Vimage1, id + "1.jpg");
            }
            if (!req.getPart("Vimage2").getSubmittedFileName().isEmpty()) {
                Part Vimage2 = req.getPart("Vimage2");
                VehicleDAO.fileCopy1(getServletContext(), Vimage2, id + "2.jpg");
            }
            if (!req.getPart("Vimage3").getSubmittedFileName().isEmpty()) {
                Part Vimage3 = req.getPart("Vimage3");
                VehicleDAO.fileCopy2(getServletContext(), Vimage3, id + "3.jpg");
            }
            if (!req.getPart("Vimage4").getSubmittedFileName().isEmpty()) {
                Part Vimage4 = req.getPart("Vimage4");
                VehicleDAO.fileCopy3(getServletContext(), Vimage4, id + "4.jpg");
            }
            if (!req.getPart("Vimage5").getSubmittedFileName().isEmpty()) {
                Part Vimage5 = req.getPart("Vimage5");
                VehicleDAO.fileCopy4(getServletContext(), Vimage5, id + "5.jpg");
            }
            Vehicles p=new Vehicles();
            p.setId(Integer.parseInt(id));
            p.setVehiclesTitle(VehiclesTitle);
            p.setVehiclesBrand(VehiclesBrand);
            p.setVehiclesOverview(VehiclesOverview);
            p.setPricePerDay(PricePerDay);
            p.setFuelType(FuelType);
            p.setModelYear(ModelYear);
            p.setSeatingCapacity(SeatingCapacity);
            p.setAirConditioner(AirConditioner);
            p.setPowerDoorLocks(PowerDoorLocks);
            p.setAntiLockBrakingSystem(AntiLockBrakingSystem);
            p.setBrakeAssist(BrakeAssist);
            p.setPowerSteering(PowerSteering);
            p.setDriverAirbag(DriverAirbag);
            p.setPassengerAirbag(PassengerAirbag);
            p.setPowerWindows(PowerWindows);
            p.setCDPlayer(CDPlayer);
            p.setCentralLocking(CentralLocking);
            p.setCrashSensor(CrashSensor);
            p.setLeatherSeats(LeatherSeats);
            
            VehicleDAO.updateVehicle(p);

            resp.sendRedirect("admin/editVehicle.jsp?msg=valid&id="+id);

        } catch (Exception e) {
            resp.getWriter().println("Error " + e.getMessage());
        }

    }

}
