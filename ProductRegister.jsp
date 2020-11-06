<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ProductRegister page</title>
</head>
<body>

<% String vv=(String)session.getAttribute("name");
   out.println("Welcome To Vender "+vv);
 %>	

  <%
  try{
		if(vv==null){
   %>
<li><a href="Vender.jsp"><i class="fa fa-lock"></i> Login</a></li>
	
<%
}
%><% else{
  %>
	<li><a href="Vender.jsp"><i class="fa fa-lock"></i> Logout</a></li>
	<% }
	  }     catch(Exception e1){
		  System.out.println(e1); }
	%>
	
	<br><br>
	<form action="ProductRegister1.jsp" enctype="multipart/form-data">
	<h3>All Products.</h3><br>
	
	Product name: <input type="text" name="name" placeholder="Name" required="required"/>
	Product size: <input type="text" name="size" placeholder="Size" required="required" />
	Product price: <input type="text" name="price" placeholder="Price" required="required" />
	Product image: <input type="file" name="image"><br><br>
	Product image_name: <input type="text" name="image_name" placeholder="Image_name" required="required" /><br><br>
	
    <input type="submit" name="goUpload" value="save"></input>
	
	</form>
	
</body>
</html>