package com.carrental;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BookDAO {

	private Connection con;

	public BookDAO(Connection con) {
		super();
		this.con = con;
	}

	// Book Now
	public static void BookingCar(Booking b) throws Exception {
		Connection con = DbConnect.Connect();
		PreparedStatement ps = con.prepareStatement(
				"insert into booking(BookingNumber,userEmail,VehicleId,FromDate,ToDate,message) values(?,?,?,?,?,?)");
		ps.setInt(1, b.getBookingNumber());
		ps.setString(2, b.getUserEmail());
		ps.setInt(3, b.getVehicleId());
		ps.setString(4, b.getFromDate());
		ps.setString(5, b.getToDate());
		ps.setString(6, b.getMessage());

		ps.executeUpdate();
		con.close();
	}

	// Update Status
	public boolean updateStatus(Booking ap) {
		boolean f = false;
		try {
			String sql = "update booking set Status=? where id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, ap.getStatus());
			ps.setInt(2, ap.getId());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	//View my Booking
  	public List<Booking> getAllBooking(String email){  		
  		List<Booking> list = new ArrayList<Booking>();
  		Booking b=null;
		
	    try {        
		   String sql="select * from booking where userEmail='"+email+"'";
		   PreparedStatement ps = con.prepareStatement(sql);
		   ResultSet rs = ps.executeQuery();
		   
		   while(rs.next()) {
			   
			b=new Booking();
			b.setId(rs.getInt(1));
			b.setBookingNumber(rs.getInt(2));
			b.setUserEmail(rs.getString(3));
			b.setVehicleId(rs.getInt(4));
			b.setFromDate(rs.getString(5));
			b.setToDate(rs.getString(6));
			b.setMessage(rs.getString(7));
			b.setStatus(rs.getString(8));
			b.setPostingDate(rs.getString(9));
			b.setLastUpdationDate(rs.getString(10));
			list.add(b);			
		   }		   
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return list;
  	}
}
