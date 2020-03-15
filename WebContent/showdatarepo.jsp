
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


<table border=5>
	<tr>
		<th>File Domain</th>
		<th>File Name</th>
		<th>File Type</th>
		<th>Download Link</th>
	</tr>
	
	<% 
	ResultSet rs=(ResultSet)request.getAttribute("repo");
	if(rs.next())
	{
	do{
	%>
		<tr>
			<td><%=rs.getString("rname")%></td>
			<td><%=rs.getString("domain")%></td>
			<td><%=rs.getString("type")%></td>
			<td>Download</td>
		</tr>
	<%
	}while(rs.next()); 
	}
	else
	{
	%>
	<tr>
			<td colspan=4>No repositories available for this domain</td>
	</tr>
	<%
	}
	%>

	
	

</table>


<jsp:include page="footer.jsp"/>
</body>
</html>