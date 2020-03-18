<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="experiments.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All books</title>
</head>
<body>

<jsp:include page="header.jsp"/>

<hr>
    
<table border=5>
	<tr>
		<th>ISBN No.</th>
		<th>Name</th>
		<th>DEPARTMENT</th>
		<th>Domain</th>
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
			<td><%=rs.getString("isbn")%></td>
			<td><%=rs.getString("bname")%></td>
			<td><%=rs.getString("dept")%></td>
			<td><%=rs.getString("domain")%></td>
			<td><form method="post" action="downloadbook">
						<input type="hidden" name="isbn" value="<%=rs.getString("isbn")%>">
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
			<td colspan=4>No books available for this domain</td>
	</tr>
	<%
	}
	%>
	

</table>

<jsp:include page="footer.jsp"/>

    
</body>
</html>