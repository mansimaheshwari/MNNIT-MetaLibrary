<%@page import="experiments.AllMethods"%>
<%@page import="java.sql.ResultSet" %>
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
<title>Insert title here</title>
</head>


<body>
	<%
		String domain=request.getParameter("domain");
		request.setAttribute("domain",domain);
		System.out.println("from get type..." + domain);
		AllMethods am=new AllMethods();
		//ResultSet rs=am.getType(domain);
		ResultSet rs=am.getType();
		while(rs.next()){
			System.out.println(rs.getString("types"));
			
	%>
	<option value="<%=rs.getString("types")%>"><%=rs.getString("types")%></option>
	<%
		}
	%>
	
	

                    
</body>
</html>