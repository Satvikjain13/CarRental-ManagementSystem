package com.carrental;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BrandDAO {
	
	private Connection con;

	public BrandDAO(Connection con) {
		super();
		this.con = con;
	}
	
	// Insert Brand
		public static void addBrand(Brand b) throws Exception {
	        Connection con = DbConnect.Connect();
	        PreparedStatement ps = con
	                .prepareStatement("INSERT into brands(BrandName) VALUES(?)");
	        ps.setString(1, b.getBrandName());
	        ps.executeUpdate();
	        
	        con.close();
	    }
		
		// Manage Brand
		public static List<Brand> getBrand(boolean sort, boolean desc) throws Exception {
	        List<Brand> list = new ArrayList<Brand>();
	        Connection con = DbConnect.Connect();
	        ResultSet rs = null;
	        if (sort) {
	            rs = con.createStatement().executeQuery("SELECT * FROM brands order by BrandName");
	            if (desc) {
	                rs = con.createStatement().executeQuery("SELECT * FROM brands order by BrandName desc");
	            }
	        } else {
	            rs = con.createStatement().executeQuery("SELECT * FROM brands order by id");
	        }
	        while (rs.next()) {
	        	Brand p = new Brand();
	            p.setId(rs.getInt("id"));
	            p.setBrandName(rs.getString("BrandName"));
	            p.setCreationDate(rs.getString("CreationDate"));
	            list.add(p);
	        }
	        con.close();
	        return list;
	    }

	    
		//Edit Package
	    public Brand getBrandById(int id) {
	    	Brand b = null;
			
			try {
				String sql="select * from brands where id=?";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setInt(1, id);
				
				ResultSet rs = ps.executeQuery();
				while(rs.next()) {
					b=new Brand();
					b.setId(rs.getInt(1));
					b.setBrandName(rs.getString(2));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return b;
		}

	    
	    //update Brand
	    public static void updateBrand(Brand b) throws Exception {
	        Connection con = DbConnect.Connect();

	        PreparedStatement ps = con
	                .prepareStatement("UPDATE brands set BrandName=? where id=?");
	        ps.setString(1, b.getBrandName());
	        ps.setInt(2, b.getId());

	        ps.executeUpdate();
	        con.close();
	    }
}
