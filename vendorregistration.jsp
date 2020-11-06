<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert an image into database</title>
</head>
<body>
<form action = "imagesave.jsp" method ="post">
<table>
<tr><td>PName:</td><td><input type = "text" name ="pname"></td></tr>
<tr><td>PPrice:</td><td><input type = "text" name ="pprice"></td></tr>
<tr><td>PDesc:</td><td><input type = "text" name ="pdesc"></td></tr>
<tr><td>Add Image:</td><td><input type = "file" name ="image"></td></tr>
<tr><td><input type ="submit" value ="submit"></td></tr>


</table>
</form>
</body>
</html>