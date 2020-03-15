<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="signin" >

	Email:<input type="email" id="email" name="email"/><br/>
	Password:<input type="password" id="cpass" name="cpass"/><br/>
	SignUp as:	<select id="designation" name="designation">
					<option>Student</option>
					<option>Teacher</option>
					<option>Admin</option>
	</select><br/>
	<input type="submit" id="submit" value="submit"/><input type="reset" id="reset" value="reset"/><br/>
</form>
<p><script>${msg}</script></p>
</body>
</html>