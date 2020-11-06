<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %>

<%
	String email=request.getParameter("email");

	String password=request.getParameter("password");
	
	session.setAttribute("email",email);
	session.setAttribute("password",password);


try
{

	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
	PreparedStatement pst=conn.prepareStatement("select * from akash  where email=? and password=?"); 
	pst.setString(1,email);
	pst.setString(2,password);
	
	
	ResultSet rs=pst.executeQuery();
	
	if (rs.next())
	{
				
		session.setAttribute("msg","Welcome Akash Sharma");
		response.sendRedirect("index.jsp");
	}
	else
		{
		out.println("invaild User");
		}
}

	catch (Exception e)
	{
	out.println(e);
	}

%>

