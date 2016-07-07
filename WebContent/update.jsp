<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%!Savedata data=new Savedata(); %>
<%
out.println(data.getName());
//String name=request.getParameter("chk");
request.getAttribute("chk");
out.println(session.getAttribute("chk"));
String name=(String)session.getAttribute("chk");
out.println(name);

ArrayList arr=new ArrayList();
data.setName(name);
arr=data.fetchdata1();
for(int i=0;i<arr.size();i++)
{
  
  data=(Savedata)arr.get(i);

 %>
<form>
Name :<input type="text" name="txtName" value="<%=data.name %>"/><br/>
Addesss :<input type="text" name="txtAddress" value="<%=data.address %>"/><br/>
<input type="submit" value="Update">

<% 
}

%>
</form> 
 
 <% 
 
 if(request.getParameter("txtName")!=null)
 {
	 String name1=request.getParameter("txtName");
	 String address=request.getParameter("txtAddress");
	 int i=data.update(name1,address);

   if(i==1)
   {
	   //out.print("asdsfsdfd");
	 response.sendRedirect("save.jsp");
   }
   else
   {
	   out.println("data is not updated");
   }
 }
 
 
 %>


</body>
</html>