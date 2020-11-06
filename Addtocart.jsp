<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="java.sql.*" %>
<%
String pname = request.getParameter("pname");
String pprice = request.getParameter("pprice");

String f_name = request.getParameter("f_name");
try
	{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
	PreparedStatement pst=conn.prepareStatement("insert into cart values(?,?,?)"); 
	

	pst.setString(1,pname);
	pst.setString(2,pprice);
	
	pst.setString(3,f_name); 
	pst.executeUpdate();
	
	out.println("Recored Add Succesfull");

	
	}
catch(Exception e)
{
	out.println(e);
	}
 %>
</body>
</html>