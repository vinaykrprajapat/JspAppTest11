package com;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conn
{

	Connection conn11() throws Exception
	{ //Connection con;
		
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		Connection con=DriverManager.getConnection("jdbc:odbc:abc","","");	
		return con;
		
	}
}  
