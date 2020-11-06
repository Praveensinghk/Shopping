<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>


<%
 String name=request.getParameter("name");
 String email=request.getParameter("email");

try{
    	Class.forName("com.mysql.jdbc.Driver");
    	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shoppingdb","root","root");
    	Statement stmt = con.createStatement();
    	
    	ResultSet rs=stmt.executeQuery("Select * from shoptb where name='"+name+"' and email='"+email+"'");
    	if(rs.next())
    	{
    	
    	String nm=rs.getString(1);
    	System.out.println(name);
    	session.setAttribute("name",nm);
    	response.sendRedirect("index.jsp");
    	
    	}
    	else {
        out.print("User id or password is wrond");
    		request.getRequestDispatcher("login.jsp");
    	}
    }catch(Exception e){
    	out.println(e);
     }
 %>





</body>
</html>