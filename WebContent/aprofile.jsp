
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
hii<br>
	<%
	ResultSet rs=(ResultSet)request.getAttribute("details");
	%>
	Name : <%=rs.getString("aname") %><br>
	Email : <%=rs.getString("aemail") %><br>
	Pass : <%=rs.getString("apass") %><br>
	Mob. : <%=rs.getString("amobile") %><br>
</body>
</html>