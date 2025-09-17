package com.carrental;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.Part;

public class VehicleDAO {

	private Connection con;

	public VehicleDAO(Connection con) {
		super();
		this.con = con;
	}

	// Insert Product
	public static void addVehicle(Vehicles p, Part part, Part part1, Part part2, Part part3, Part part4,
			ServletContext ctx) throws Exception {
		Connection con = DbConnect.Connect();
		PreparedStatement ps = con.prepareStatement(
				"INSERT into vehicles(VehiclesTitle,VehiclesBrand,VehiclesOverview,PricePerDay,FuelType,ModelYear,SeatingCapacity,AirConditioner,"
						+ "PowerDoorLocks,AntiLockBrakingSystem,BrakeAssist,PowerSteering,DriverAirbag,PassengerAirbag,PowerWindows,CDPlayer,CentralLocking,CrashSensor,LeatherSeats) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
				Statement.RETURN_GENERATED_KEYS);
		ps.setString(1, p.getVehiclesTitle());
		ps.setInt(2, p.getVehiclesBrand());
		ps.setString(3, p.getVehiclesOverview());
		ps.setFloat(4, p.getPricePerDay());
		ps.setString(5, p.getFuelType());
		ps.setInt(6, p.getModelYear());
		ps.setInt(7, p.getSeatingCapacity());
		ps.setString(8, p.getAirConditioner());
		ps.setString(9, p.getPowerDoorLocks());
		ps.setString(10, p.getAntiLockBrakingSystem());
		ps.setString(11, p.getBrakeAssist());
		ps.setString(12, p.getPowerSteering());
		ps.setString(13, p.getDriverAirbag());
		ps.setString(14, p.getPassengerAirbag());
		ps.setString(15, p.getPowerWindows());
		ps.setString(16, p.getCDPlayer());
		ps.setString(17, p.getCentralLocking());
		ps.setString(18, p.getCrashSensor());
		ps.setString(19, p.getLeatherSeats());
		ps.executeUpdate();
		ResultSet rs = ps.getGeneratedKeys();
		rs.next();
		String id = rs.getString(1);
		ps = con.prepareStatement("update vehicles set Vimage1=?,Vimage2=?,Vimage3=?,Vimage4=?,Vimage5=? where id=?");
		ps.setString(1, id + "1.jpg");
		ps.setString(2, id + "2.jpg");
		ps.setString(3, id + "3.jpg");
		ps.setString(4, id + "4.jpg");
		ps.setString(5, id + "5.jpg");
		ps.setString(6, id);
		ps.executeUpdate();
		fileCopy(ctx, part, id + "1.jpg");
		fileCopy1(ctx, part1, id + "2.jpg");
		fileCopy2(ctx, part2, id + "3.jpg");
		fileCopy3(ctx, part3, id + "4.jpg");
		fileCopy4(ctx, part4, id + "5.jpg");

		con.close();
	}

	public static void fileCopy(ServletContext ctx, Part part, String filename) throws Exception {
		Files.copy(part.getInputStream(), Paths.get(ctx.getRealPath("/images1/"), filename),
				StandardCopyOption.REPLACE_EXISTING);
	}

	public static void fileCopy1(ServletContext ctx, Part part1, String filename) throws Exception {
		Files.copy(part1.getInputStream(), Paths.get(ctx.getRealPath("/images1/"), filename),
				StandardCopyOption.REPLACE_EXISTING);
	}

	public static void fileCopy2(ServletContext ctx, Part part2, String filename) throws Exception {
		Files.copy(part2.getInputStream(), Paths.get(ctx.getRealPath("/images1/"), filename),
				StandardCopyOption.REPLACE_EXISTING);
	}

	public static void fileCopy3(ServletContext ctx, Part part3, String filename) throws Exception {
		Files.copy(part3.getInputStream(), Paths.get(ctx.getRealPath("/images1/"), filename),
				StandardCopyOption.REPLACE_EXISTING);
	}

	public static void fileCopy4(ServletContext ctx, Part part4, String filename) throws Exception {
		Files.copy(part4.getInputStream(), Paths.get(ctx.getRealPath("/images1/"), filename),
				StandardCopyOption.REPLACE_EXISTING);
	}

	// Manage Brand
	public static List<Vehicles> getVehicle(boolean sort, boolean desc) throws Exception {
		List<Vehicles> list = new ArrayList<Vehicles>();
		Connection con = DbConnect.Connect();
		ResultSet rs = null;
		if (sort) {
			rs = con.createStatement().executeQuery("SELECT * FROM vehicles order by VehiclesTitle");
			if (desc) {
				rs = con.createStatement().executeQuery("SELECT * FROM vehicles order by VehiclesTitle desc");
			}
		} else {
			rs = con.createStatement().executeQuery("SELECT * FROM vehicles order by id");
		}
		while (rs.next()) {
			Vehicles p = new Vehicles();
			p.setId(rs.getInt("id"));
			p.setVehiclesTitle(rs.getString("VehiclesTitle"));
			p.setVehiclesBrand(rs.getInt("VehiclesBrand"));
			p.setPricePerDay(rs.getFloat("PricePerDay"));
			p.setFuelType(rs.getString("FuelType"));
			p.setModelYear(rs.getInt("ModelYear"));
			list.add(p);
		}
		con.close();
		return list;
	}
	
	//Edit Vehicle
	public Vehicles getVehicleById(int id) {
    	Vehicles v = null;
		
		try {
			String sql="select * from vehicles where id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				v=new Vehicles();
				v.setId(rs.getInt(1));
				v.setVehiclesTitle(rs.getString(2));
				v.setVehiclesBrand(rs.getInt(3));
				v.setVehiclesOverview(rs.getString(4));
				v.setPricePerDay(rs.getFloat(5));
				v.setFuelType(rs.getString(6));
				v.setModelYear(rs.getInt(7));
				v.setSeatingCapacity(rs.getInt(8));
				v.setVimage1(rs.getString(9));
				v.setVimage2(rs.getString(10));
				v.setVimage3(rs.getString(11));
				v.setVimage4(rs.getString(12));
				v.setVimage5(rs.getString(13));				
				v.setAirConditioner(rs.getString(14));
				v.setPowerDoorLocks(rs.getString(15));
				v.setAntiLockBrakingSystem(rs.getString(16));
				v.setBrakeAssist(rs.getString(17));
				v.setPowerSteering(rs.getString(18));
				v.setDriverAirbag(rs.getString(19));
				v.setPassengerAirbag(rs.getString(20));
				v.setPowerWindows(rs.getString(21));
				v.setCDPlayer(rs.getString(22));
				v.setCentralLocking(rs.getString(23));
				v.setCrashSensor(rs.getString(24));
				v.setLeatherSeats(rs.getString(25));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}
	
	//update vehicle
    public static void updateVehicle(Vehicles p) throws Exception {
        Connection con = DbConnect.Connect();

        PreparedStatement ps = con
                .prepareStatement("UPDATE vehicles set VehiclesTitle=?,VehiclesBrand=?,VehiclesOverview=?,PricePerDay=?,FuelType=?,ModelYear=?,SeatingCapacity=?,AirConditioner=?,PowerDoorLocks=?,AntiLockBrakingSystem=?,BrakeAssist=?,PowerSteering=?,DriverAirbag=?,PassengerAirbag=?,PowerWindows=?,CDPlayer=?,CentralLocking=?,CrashSensor=?,LeatherSeats=? where id=?");
        ps.setString(1, p.getVehiclesTitle());
        ps.setInt(2, p.getVehiclesBrand());
        ps.setString(3, p.getVehiclesOverview());
        ps.setFloat(4, p.getPricePerDay());
        ps.setString(5, p.getFuelType());
        ps.setInt(6, p.getModelYear());
        ps.setInt(7, p.getSeatingCapacity());
        ps.setString(8, p.getAirConditioner());
        ps.setString(9, p.getPowerDoorLocks());
        ps.setString(10, p.getAntiLockBrakingSystem());
        ps.setString(11, p.getBrakeAssist());
        ps.setString(12, p.getPowerSteering());
        ps.setString(13, p.getDriverAirbag());
        ps.setString(14, p.getPassengerAirbag());
        ps.setString(15, p.getPowerWindows());
        ps.setString(16, p.getCDPlayer());
        ps.setString(17, p.getCentralLocking());
        ps.setString(18, p.getCrashSensor());
        ps.setString(19, p.getLeatherSeats());
        ps.setInt(20, p.getId());

        ps.executeUpdate();
        con.close();
    }


}
