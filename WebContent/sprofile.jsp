
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
hii
<br>
	<%
	ResultSet rs=(ResultSet)request.getAttribute("details");
	String c=rs.getString("sid");
	%>
	Registration no. : <%=rs.getString("sid") %><br>
	Name : <%=rs.getString("sname") %><br>
	Email : <%=rs.getString("semail") %><br>
	Pass : <%=rs.getString("spass") %><br>
	Mob. : <%=rs.getString("smobile") %><br>
	Department : <%=rs.getString("dept") %><br>
    <img src="data:image/jpg;base64,${image}" width="100" height="100"/>
	<%
	%>

</body>
</html>