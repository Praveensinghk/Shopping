<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import ="java.sql.*" %>
<%@page import ="javax.sql.*" %>
<%
String v1 = request.getParameter("t1");
String v2 = request.getParameter("t2");

try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
	Statement st= con.createStatement();
	ResultSet rs= st.executeQuery("select * from karan where name ='"+v1+"' and password='"+v2+"'");
	if(rs.next())
	{
		response.sendRedirect("vendorregistration.jsp");
		
		
	}
	else
	{
		//session.setAttribute("msg","invalid username try again");
				out.println("invailed username and password");
		response.sendRedirect("vendor.jsp");
	}
	}
	catch(Exception ex)
	{
	out.print(ex);	
	}
	%>	

</body>
</html>