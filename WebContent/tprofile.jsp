
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Teacher profile</title>
</head>
<body>
	<%
	ResultSet rs=(ResultSet)session.getAttribute("details");
	String c=rs.getString("tid");
	%>
	Registration no. : <%=rs.getString("tid") %><br>
	Name : <%=rs.getString("tname") %><br>
	Email : <%=rs.getString("temail") %><br>
	Pass : <%=rs.getString("tpass") %><br>
	Mob. : <%=rs.getString("tmobile") %><br>
	Department : <%=rs.getString("dept") %><br>
    <img src="data:image/jpg;base64,${image}" width="100" height="100"/>
	<!--  <a href="TeachProfile/rajeshtripathi.pdf">Profile</a><br>-->
    <br>
    <br>
	<form method="post" action="cv">
		<input type="hidden" name="tid" value="<%=c%>"/>
		<input type="submit" value="profile" id="profile"/>
	</form>
</body>
</html>