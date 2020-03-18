<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="experiments.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Departments</title>
</head>
<body>

<jsp:include page="header.jsp"/>

<hr>
    
<table border=5>
	<tr>
		<th>DEPARTMENT</th>
		<th>DOMAIN</th>
	</tr>
	
	<% 
	AllMethods am=new AllMethods();
	ResultSet rs=am.deptdomain();
	if(rs.next())
	{
	do{
	%>
		<tr>
			<td><%=rs.getString("dept")%></td>
			<td><%=rs.getString("domain")%></td>
			
		</tr>
	<%
	}while(rs.next());
	}
	else
	{
	%>
	<tr>
			<td colspan=5>No data available</td>
	</tr>
	<%
	}
	%>
	

</table>

<jsp:include page="footer.jsp"/>

    
</body>
</html>