<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%!Savedata save=new Savedata();
String nam;%>
<%if(request.getParameter("txtName")!=null)
{
  if(request.getParameter("save").equals("Save"))
  {
String name=request.getParameter("txtName");
String address=request.getParameter("txtAddress");
save.setName(name);
save.setAddress(address);
int i=save.savedata();
if(i==1)
{
out.println("data is saved");	
}
else
{out.println("data is not saved");
	}
  }
  if(request.getParameter("save").equals("delete"))
  {
	  int i1=0;
	  String []name=request.getParameterValues("chk");
	  for(int i=0;i<name.length;i++)
	  {
		  save.setName(name[i]);
		  i1=save.deletedata();
	  }
	  
	  
	  if(i1==1)
	  {
	  	out.println("data is deleted");
	  }
	  else
	  {
		  out.println("data is not deleted");
	  }
	  
  }
  if(request.getParameter("save").equals("update"))
  { 
	  String name=request.getParameter("chk");
	   session.setAttribute("chk",name);
	   response.sendRedirect("update.jsp");
  	  
  }
}
%>
</head>
<body>	
<form action="">
NAME :<input type="text" name="txtName">
ADDRESS:<input type="text" name="txtAddress">
<input type="submit" value="Save" name="save"><BR/><br/>

<table>
<tr><td>Select</td><td>Name</td><td>Address</td></tr>
<% 
  ArrayList arr=new ArrayList();
  arr= save.fetchdata();
  for(int i=0;i<arr.size();i++)
  {
    save=(Savedata)arr.get(i);  
	  %>
	  
<tr><td><input type="checkbox" value="<%=save.name%>" name="chk"></td>
<td><%=save.name%></td><td><%out.print(save.address);%></td></tr>
  <%
	 
  }

%>
<tr><td colspan="2"><input type="submit" value="delete" name="save"></td>
<td><input type="submit" name="save" value="update"></td>
</tr>
</table>	  
	  
	

</form>
</body>
</html>