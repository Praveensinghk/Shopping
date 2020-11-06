<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Show product</title>
</head>
<body>
<table style="width:100%">
<tr>
<th> p name </th>
<th>p price</th>
<th>p description</th>
<th>image</th>
</tr>




<% 

try
{
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
	Statement st=con.createStatement();
	ResultSet rs=(ResultSet) st.executeQuery("Select * from akash");
	
		while(rs.next()) 
		{
		
	    %>
	    <tr>
	    <th><%=rs.getString("pname")%></th> 
	    <th><%=rs.getString("pprice")%></th> 
	    <th><%=rs.getString("pdesc")%></th> 
	    <th><img src="C:/TEMP/<%=rs.getString("f_name")%>" height="100" width="100"></th>
	     </tr>
	     <%
	    
		}
}


catch(Exception e)
{
	out.println(e);
	}
%>
</table>
</body>
</html>