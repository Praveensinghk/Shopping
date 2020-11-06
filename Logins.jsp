<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1> you enter to your profile</h1>
<%@page import ="java.sql.*" %>
<%@page import ="javax.sql.*" %>
<% 
String name= request.getParameter("name");
String password= request.getParameter("password");

	try
	{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
	Statement st= con.createStatement();
	ResultSet rs= st.executeQuery("select * from sharma where name ='"+name+"' and password='"+password+"'");
	
	
	if(rs.next())
	{
		
		name=rs.getString(1);
		password=rs.getString(2);
	
		session.setAttribute("name",name);
		session.setAttribute("password",password);
		
		session.setAttribute("msg","welcome user");
		
		response.sendRedirect("shop.jsp");
		

		
	}
	else
	
{
	session.setAttribute("msg","invailed username and password");
		
		response.sendRedirect("error.jsp");	
		
	}
	
	
	
}
	catch(Exception ex)
	{
	
	}
%>

</body>
</html>