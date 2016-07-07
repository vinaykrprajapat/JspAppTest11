<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% if(request.getParameter("txtName")!=null)
{
	%>
	<jsp:useBean id="obj" class="com.DataBaseConnectivity"></jsp:useBean>
	<jsp:setProperty property="*" name="obj"/>
	<%
	String name=request.getParameter("txtName");
	String address=request.getParameter("txtAddress");
	//DataBaseConnectivity obj=new DataBaseConnectivity();
	obj.setName(name);
	obj.setAddress(address);
	int i=obj.save();
	 if(i==1)
	 {
		 
		out.println("data is saved");
	 }
	 else
	 {
		 out.println("not saved");
	 }
}
%>
<form action="">

Enter name<input type="text" name="txtName"><br/>
Enter Address<input type="text" name="txtAddress"><br/>
<input type="submit">


</form>
</body>
</html>