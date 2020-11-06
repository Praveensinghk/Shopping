<!DOCTYPE html>
<html lang="en">
<head>
    
    <title>Cart | E-Shopper</title>
    
</head><!--/head-->

<body>
					
				<%@ page import="java.sql.*" %>	<%@page import="java.io.*" %>
					
			<% 		String uname=request.getParameter("uname"); 
			
			String pprice = request.getParameter("pprice"); 
			String image=request.getParameter("image");
					try
 {
	 Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
	PreparedStatement st=con.prepareStatement("insert into cart(uname,pprice,image) values(?,?,?)");
	st.setString(1,uname);	st.setString(2,pprice);	st.setString(3,image);
	int rs=st.executeUpdate();
	
	if(rs>0)
	{
		%>
		
							
							<img src='c:/Temp/<%=image%>'  height="250" width="42"/>
							
								<h4><%=uname %></h4>
								
							
								<p><%=pprice %></p>
						
							
									<a  href=""> + </a>
									<input  type="text" name="quantity" value="1" autocomplete="off" size="2">
									<a  href=""> - </a>
								
							
								<p >$59</p>
							
						
						<%
	}
 
	else out.println("product not found");}
			catch(Exception e)
			{
			    e.printStackTrace();
			    }
						%>

</body>
</html>
						
						
					
				
			
		
		
		
		
	