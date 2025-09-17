package com.carrental;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class ContactDAO {
	
	private Connection con;

	public ContactDAO(Connection con) {
		super();
		this.con = con;
	}
	
	// Insert Contact Details
	public static void addContact(Contactusquery c) throws Exception {
        Connection con = DbConnect.Connect();
        PreparedStatement ps = con
                .prepareStatement("INSERT into contactusquery(name,EmailId,ContactNumber,Message) VALUES(?,?,?,?)");
        ps.setString(1, c.getName());
        ps.setString(2, c.getEmailId());
        ps.setString(3, c.getContactNumber());
        ps.setString(4, c.getMessage());
        ps.executeUpdate();        
        con.close();
    }

}
