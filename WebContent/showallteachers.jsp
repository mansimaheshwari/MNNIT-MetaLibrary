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
		<th>Email</th>
		<th>Mobile</th>
		<th>Department</th>
		<th>Image</th>
		<th>Profile</th>
	</tr>
	
	<% 
	AllMethods am=new AllMethods();
	ResultSet rs=am.getTeacher();
	if(rs.next())
	{
	do{
		int c=rs.getInt("tid");
		Blob blob = rs.getBlob("image");
		String image=am.getImage(blob);
	%>
		<tr>
			<td><%=rs.getString("tname")%></td>
			<td><%=rs.getString("temail")%></td>
			<td><%=rs.getString("tmobile")%></td>
			<td><%=rs.getString("dept")%></td>
    		<td><img src="data:image/jpg;base64,<%=image%>" width="100" height="100"/></td>
			<td><form method="post" action="cv">
				<input type="hidden" name="desig" value="teacher"/>
				<input type="hidden" name="tid" value="<%=c%>"/>
				<input type="submit" value="profile" id="profile"/>
				</form>
			</td>
		</tr>
	<%
	}while(rs.next());
	}
	else
	{
	%>
	<tr>
			<td colspan=6>No teachers available</td>
	</tr>
	<%
	}
	%>
	

</table>
</body>
</html>