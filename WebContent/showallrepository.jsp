<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="experiments.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<table border=5>
	<tr>
		<th>Name</th>
		<th>Domain</th>
		<th>Type</th>
		<th>Teacher name</th>
		<th>Download Link</th>
	</tr>
	
	<% 
	AllMethods am=new AllMethods();
	ResultSet rs=am.allBooks();
	if(rs.next())
	{
	do{
	%>
		<tr>
			<td><%=rs.getString("rname")%></td>
			<td><%=rs.getString("domain")%></td>
			<td><%=rs.getString("types")%></td>
			<td><%=rs.getString("tname")%></td>
			<td><form method="post" action="downloadrepository">
						<input type="hidden" name="rid" value="<%=rs.getString("rid")%>">
						<input type="submit"  value="Download"/>
			</form></td>
			
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
</body>
</html>