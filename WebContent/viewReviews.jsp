
<%@page import="java.sql.*" %>
<%@page import="experiments.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reviews</title>
</head>
<body>


<jsp:include page="header.jsp"/>

<br>
<table border=5>
	<tr>
		<th><b>Name</b></th>
		<th><b>Email</b></th>
		<th><b>Education</b></th>
		<th><b>Profession</b></th>
		<th><b>Review</b></th>
	</tr>
	
	<% 
	AllMethods am=new AllMethods();
	ResultSet rs=am.allReviews();
	if(rs.next())
	{
	do{
	%>
		<tr>
			<td><%=rs.getString("name")%></td>
			<td><%=rs.getString("email")%></td>
			<td><%=rs.getString("education")%></td>
			<td><%=rs.getString("profession")%></td>
			<td><%=rs.getString("review")%></td>
		</tr>
	<%
	}while(rs.next());
	}
	else
	{
	%>
	<tr>
			<td colspan=4>No reviews available</td>
	</tr>
	<%
	}
	%>
	

</table>

<jsp:include page="footer.jsp"/>

</body>
</html>