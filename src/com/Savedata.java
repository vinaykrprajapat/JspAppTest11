package com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Scanner;

public class Savedata 
{
	Connection con;
	PreparedStatement prepare;
 public String name,address;

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
 public int savedata() throws SQLException
 { 
	 Conn connection =new Conn();
	 try{
	  con=connection.conn11();
	 }catch(Exception e){System.out.println(e);}
	 prepare=con.prepareStatement("insert into Student(Name,Address) values(?,?)");
	 prepare.setString(1,name);
	 prepare.setString(2,address);
	 int i=prepare.executeUpdate();
	 return i;
	 
 }
 public int deletedata()throws Exception
 {
	 Conn connection=new Conn();
	 con=connection.conn11();
	prepare= con.prepareStatement("delete from student where Name=?");
	prepare.setString(1,name);
	int i=prepare.executeUpdate();
	return i;
 
 }
 
 public ArrayList fetchdata() throws Exception
 {
	 ArrayList arr=new ArrayList();
	 ResultSet rs=null;
	 Conn connection =new Conn();
	 con=connection.conn11();
	 prepare= con.prepareStatement("select * from student");
	 rs=prepare.executeQuery();
	 while(rs.next())
	 {
		 Savedata l=new Savedata();
		  l.name=rs.getString("name");
		  l.address=rs.getString("address");
		  arr.add(l);
		  
 	 
 	 }
	 return arr;
 
 }
 
 public ArrayList fetchdata1() throws Exception
 {
	 ArrayList arr=new ArrayList();
	 ResultSet rs=null;
	 Conn connection =new Conn();
	 con=connection.conn11();
	 prepare= con.prepareStatement("select * from student where Name=?");
	 prepare.setString(1,name);
	 rs=prepare.executeQuery();
	 while(rs.next())
	 {
		 Savedata l=new Savedata();
		  l.name=rs.getString(1);
		  l.address=rs.getString(2);
		  arr.add(l);
		  
 	 
 	 }
	 return arr;
 
 }
 
 
 
 public int update(String new_name,String new_address)throws Exception
 {
	 Conn connection =new Conn();
	 con=connection.conn11();
	 prepare=con.prepareStatement("update student set Name=?,Address=? where Name=?");
	 prepare.setString(1,new_name);
	 prepare.setString(2, new_address);
	 prepare.setString(3,name);
	 int i=prepare.executeUpdate();
	 return i;
	 
 }
 public static void main(String args[]) throws Exception
 { 
	 Savedata obj=new Savedata();
	 
	 
 }
}
