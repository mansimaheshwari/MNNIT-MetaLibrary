<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="experiments.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Students</title>
</head>
<body>


<jsp:include page="header.jsp"/>


<table border=5>
	<tr>
		<th>REG. NO.</th>
		<th>NAME</th>
		<th>EMAIL</th>
		<th>MOBILE</th>
		<th>DEPRTMENT</th>
		<th>IMAGE</th>
		<th>PROFILE</th>
	</tr>
	<br><br>
	<% 
	AllMethods am=new AllMethods();
	ResultSet rs=am.getStudent();
	if(rs.next())
	{
	do{
		int c=rs.getInt("sid");
		Blob blob = rs.getBlob("image");
		String image=am.getImage(blob);
	%>
		<tr>
			<td><%=rs.getString("sid")%></td>
			<td><%=rs.getString("sname")%></td>
			<td><%=rs.getString("semail")%></td>
			<td><%=rs.getString("smobile")%></td>
			<td><%=rs.getString("dept")%></td>
    		<td><img src="data:image/jpg;base64,<%=image%>" width="100" height="100"/></td>
			<td><form method="post" action="cv">
				<input type="hidden" name="desig" value="student"/>
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
			<td colspan=6>No students available</td>
	</tr>
	<%
	}
	%>
	

</table>

<jsp:include page="footer.jsp"/>


</body>
</html>