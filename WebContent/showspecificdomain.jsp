
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


<jsp:include page="header.jsp"/>

<hr>

<table border=5>
	<tr>
		<th>DEPARTMENT</th>
		<th>Domain</th>
	</tr>
	
	<% 
	ResultSet rs=(ResultSet)request.getAttribute("deptdomain");
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
			<td colspan=4>No subjects</td>
	</tr>
	<%
	}
	%>
	

</table>

<jsp:include page="footer.jsp"/>

</body>
</html>