<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.ResultSet.*" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@page import="javax.sql.*" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.io.File"%>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.sql.DriverManager"%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
		<%
			String v1=request.getParameter("productid");
			String v2=request.getParameter("name");
			String v3=request.getParameter("cost");
			String v4=request.getParameter("description");
			String v5=request.getParameter("image");
			
			FileInputStream fis=null;
			
			
			try{
				
				Class.forName("com.mysql.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","akash");
				PreparedStatement st=con.prepareStatement("insert into img values(?,?,?,?,?,?)");
				
				st.setString(1, v1);
				st.setString(2, v2);
				st.setString(3, v3);
				st.setString(4, v4);
				File f=new File(v5);
				String img_name=f.getName();
				System.out.println(v1);
				
				 fis=new FileInputStream(v5);
				st.setBinaryStream(5,fis,fis.available());
				st.setString(6,img_name);
				
				
				int k=st.executeUpdate();
				
				
				if(k>0)
				{
					out.println("Data upload successfully");
				}
				
				}catch(Exception ex){
				
				System.out.println(ex);	
				}
			
		%>
</body>
</html>