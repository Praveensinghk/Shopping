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
String v1= request.getParameter("Name");
String v2 = request.getParameter("Email");
String v3= request.getParameter("password");
 String v4=("null");
 String v5 = ("null");
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/kishanpandey","root","root");
Statement st= con.createStatement();
int k= st.executeUpdate("insert into emp values('"+v1+"','"+v3+"','"+v4+"','"+v5+"','"+v2+"')");
out.print("done");

}
catch(Exception ee)
{
System.out.print(ee);	
}
%>

</body>
</html>