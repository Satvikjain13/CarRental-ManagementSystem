package com.carrental;

import java.sql.*;

public class UserDAO {
	private Connection con;

	public UserDAO(Connection con) {
		super();
		this.con = con;
	}

	// Insert User Details
	public static void addUser(Users p) throws Exception {
		Connection con = DbConnect.Connect();
		PreparedStatement ps = con.prepareStatement(
				"INSERT into users(FullName,EmailId,Password,ContactNo,dob,Address,City,Country) VALUES(?,?,?,?,?,?,?,?)");
		ps.setString(1, p.getFullName());
		ps.setString(2, p.getEmailId());
		ps.setString(3, p.getPassword());
		ps.setString(4, p.getContactNo());
		ps.setString(5, p.getDob());
		ps.setString(6, p.getAddress());
		ps.setString(7, p.getCity());
		ps.setString(8, p.getCountry());
		ps.executeUpdate();
		con.close();
	}

	// Admin login Here
	public Users loginAdmin(String e, String p) {
		Users u = null;
		try {
			String sql = "select * from admin where username=? and password=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, e);
			ps.setString(2, p);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				u = new Users();
				u.setEmailId(rs.getString(1));
				u.setPassword(rs.getString(2));

			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return u;
	}

	// User Login
	public Users login(String email, String password) {
		Users us = null;

		try {
			String sql = "select * from users where EmailId=? and Password=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				us = new Users();
				us.setId(rs.getInt(1));
				us.setFullName(rs.getString(2));
				us.setEmailId(rs.getString(3));
				us.setPassword(rs.getString(4));
				us.setContactNo(rs.getString(5));
				us.setDob(rs.getString(6));
				us.setAddress(rs.getString(7));
				us.setCity(rs.getString(8));
				us.setCountry(rs.getString(9));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return us;
	}

	// Update Profile code here
	public boolean updateUserProfile(Users u) {
		boolean f = false;
		try {
			String sql = "update users set FullName=?,ContactNo=?,Address=?,City=?,Country=? where id=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, u.getFullName());
			ps.setString(2, u.getContactNo());
			ps.setString(3, u.getAddress());
			ps.setString(4, u.getCity());
			ps.setString(5, u.getCountry());
			ps.setInt(6, u.getId());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
}
