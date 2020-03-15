<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form method="post" action="signup" enctype="multipart/form-data">

	Name:<input type="text" id="name" name="name"/><br/>
	Email:<input type="email" id="email" name="email"/><br/>
	Password:<input type="password" id="pass" name="pass"/><br/>
	Confirm Password:<input type="password" id="cpass" name="cpass"/><br/>
	Mobile No.:<input type="number" id="mob" name="mob" required/><br/>
	Department:<input type="text" id="dept" name="dept"/><br/>	
	Passport size photo:<input type="file" id="pic" name="pic" placeholder="only jpg/jpeg/png images are acceptable" ACCEPT="image/jpg , image/jpeg , image/png"/><br/>
	Profile:<input type="file" id="profile" name="profile" placeholder="only pdf/html/docx files are acceptable"  ACCEPT="application/pdf"/><br/>
	SignUp as:	<select id="designation" name="designation">
					<option>Student</option>
					<option>Teacher</option>
	</select><br/>
	<input type="submit" id="submit" value="submit"/><input type="reset" id="reset" value="reset"/><br/>
</form>

<p><script>${msg}</script></p>


<script>

</script>
</body>
</html>