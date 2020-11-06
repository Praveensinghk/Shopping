
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
		<center>
		<h2>FileUpload</h2>
		<form action="UploadBackend.jsp">
			<table border="5" bordercolor="#FGSDFSDFSAD">
				<tr>
				<td>ProductId</td>
				<td><input type="text"  placeholder="ProductId" name="productid"></td>
				</tr>
				
				<tr>
				<td>Name</td>
				<td><input type="text"  placeholder="Name" size="50" name="name"></td>
				</tr>
				
				<tr>
				<td>Cost</td>
				<td><input type="text"  placeholder="Cost" size="50"  name="cost"></td>
				</tr>
				
				<tr>
				<td>Description</td>
				<td><input type="text"  placeholder="Description"  size="50"  name="description"></td>
				</tr>
				
				<tr>
				<td>Image</td>
				<td><input type="file" name="image"></td>
				</tr>
				
				<tr>
				<td align="center"><input type="submit" name="submit"  value="submit"></td>
				<td><input type="reset" name="reset"  value="reset"></td>
				</tr>
				
			</table>
		</form>
		</center>
</body>
</html>