<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert an Image into MySQL Database</title>
    </head>
    <body> 
        
        <%
        try
        {
        String v1 = request.getParameter("pname");
        String v2 = request.getParameter("pprice");
        String v3 = request.getParameter("pdesc");
        String v4 = request.getParameter("image");
        
        
          
         FileInputStream fis = null;
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
        PreparedStatement ps = con.prepareStatement("insert into akash values(?,?,?,?,?)");
        
        ps.setString(1,v1);
        ps.setString(2,v2);
        ps.setString(3,v3);
   

        File f=new File(v4);
        String img_name=f.getName();

        System.out.println( img_name);
        fis = new FileInputStream(v4);
        ps.setBinaryStream(4,fis,fis.available());
        ps.setString(5,img_name);
        int count=ps.executeUpdate();
        System.out.println("All is Well");
        
        if(count>0)
        {
        	out.println("Data Insert Successfully");
        	
        	
        }
        else
        {
        	out.println("Data Inserted Failed");
        	
        }}catch(Exception ee)
        {
        	System.out.println(ee);
        	
        }
        
            %>
    </body>
</html>

