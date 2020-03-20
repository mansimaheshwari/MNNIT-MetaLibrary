
<%@page import="java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Logout</title>
</head>
<body>
<%

ResultSet rs=(ResultSet)session.getAttribute("details");

System.out.println(rs.getString("aname"));
	session.invalidate();
	System.out.println(rs.getString("aname"));
%>
<script>alert("from logout")</script>
<jsp:forward page="index.jsp"></jsp:forward>
</body>
</html>