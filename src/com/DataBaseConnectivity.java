package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

public class DataBaseConnectivity
{
  String name,address;

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

public String getAddress() {
	return address;
}

public void setAddress(String address) {
	this.address = address;
}
  
public int  save() throws Exception
{
	int i=0;
	//Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	//Connection con=DriverManager.getConnection("jdbc:odbc:abc","","");
	Conn c=new Conn();
	Connection con=c.conn11();
	//Statement st=con.createStatement();
	// i=st.executeUpdate("insert into student values('"+name+"','"+address+"')");
	PreparedStatement  prepare;
	prepare=con.prepareStatement("insert into student values(?,?)");
	prepare.setString(1,name);
	prepare.setString(2,address);
	i=prepare.executeUpdate();
	
	
return i;
}
public static void main(String args[]) throws Exception
{
	DataBaseConnectivity obj=new DataBaseConnectivity();
	obj.setName("manish");
	obj.setAddress("abc");
	 int i=obj.save();
	 if(i==1)
	 {
		 
		 System.out.println("data is saved");
	 }
	 else
	 {
		 System.out.println("not saved");
	 }
	
}
}
