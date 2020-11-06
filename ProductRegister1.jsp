<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.io.InputStream"%>
    <%@page import="java.io.FileInputStream"%>
    <%@page import="java.io.File"%>
    <%@page import="java.sql.DriverManager"%>
    <%@page import="java.sql.ResultSet"%>
    <%@page import="java.sql.PreparedStatement"%>
    <%@page import="java.sql.Connection"%>
    
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page language="java"%>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>

<%

Connection conn=null;
PreparedStatement pstmts = null;
ResultSet rss=null;
String url="jdbc:mysql://localhost:3306/shoppingdb";
FileInputStream fis=null;
String name=request.getParameter("name"); 
String size=request.getParameter("size"); 
String price=request.getParameter("price"); 
String myloc=request.getParameter("image");
String image_name=request.getParameter("image_name");

//out.print("Name : "+name+" myloc= "+myloc);
try{
Class.forName("com.mysql.jdbc.Driver");
conn=DriverManager.getConnection(url, "root", "root");
File image= new File(myloc);
pstmts = conn.prepareStatement("insert into producttb(name, size, price, image, image_name) " + "values(?,?,?,?,?)");
pstmts.setString(1, name);
pstmts.setString(2, size);
pstmts.setString(3, price);
pstmts.setString(5, image_name);


fis=new FileInputStream(image);
pstmts.setBinaryStream(4, (InputStream) fis, (int) (image.length()));
int count = pstmts.executeUpdate();
while(count>0)
{
out.println("Insert successfully  ");
	
}
}
catch(Exception ex)
{
ex.printStackTrace();
}
finally{
try{
if(rss!=null){
rss.close();
rss= null;
}
if(pstmts !=null)
{
pstmts.close();
pstmts=null;
}
if(conn!=null)
{
conn.close();
conn=null;
}
}
catch(Exception e)
{
e.printStackTrace();
}
}
%>


<%
try
{
 Class.forName("com.mysql.jdbc.Driver");
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost/shoppingdb?useTimezone=true&serverTimezone=UTC",
         "root", "root");
         PreparedStatement pt= con.prepareStatement("select * from producttb");
ResultSet rs = pt.executeQuery();
out.println("So Product on the File");

while(rs.next())
{
	
	
	Blob b = rs.getBlob(4);
	byte barr[] = b.getBytes(1,(int)b.length());
	String image =rs.getString(4);
	
	//FileOutputStream fout = new FileOutputStream("D:/Shopping/WebContent/images/product-details/"+image_name);
FileOutputStream fout = new FileOutputStream("D:/Shopping/WebContent/images/shop/"+image_name);


	fout.write(barr);
	fout.close();
}

}

catch(Exception ee)
{
out.println(ee);	
}

%>





</body>
</html>