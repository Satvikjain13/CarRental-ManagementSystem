package com.carrental;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class DbConnect {
	
	private static Connection con;
	  public static Connection Connect()
	  {
		   try{
			   Class.forName("com.mysql.cj.jdbc.Driver");
			   con = DriverManager.getConnection("jdbc:mysql://localhost:3306/carrentaljsp","root","");
		   }
		   catch(Exception e)
		   {
			   e.printStackTrace();
		   }
		   return con;
	  }		  
}
