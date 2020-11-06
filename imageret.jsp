<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>image retrieve from database</title>
</head>
<body>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<% 
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
Statement pst= conn.createStatement();
ResultSet rs = pst.executeQuery("Select * from akash");
while(rs.next())
{
	String pname =rs.getString(1);
	String pprice = rs.getString(2);
	String pdesc= rs.getString(3);
	
	Blob b = rs.getBlob(4);
	byte barr[] = b.getBytes(1,(int)b.length());
	
	String img_name=rs.getString(5);
	System.out.println(img_name);
	FileOutputStream fout = new FileOutputStream("C:/TEMP/"+img_name);  
	fout.write(barr);
	fout.close();
	
}
System.out.println("All is Well");
}
catch(Exception ee)
{
System.out.println(ee);
}
%>
</body>
</html>