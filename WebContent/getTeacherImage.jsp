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


	String tid=request.getParameter("tid");
	//String tid="20182018";
		AllMethods am=new AllMethods();
		ResultSet rs=am.getTeacher(tid);
		
		
		if(rs.next())
		{
			

			Blob blob = rs.getBlob("image");
			String image=am.getImage(blob);
		%>
		<td></td>
        <td align="center"><img src="data:image/jpg;base64,<%=image%>" width="100" height="100"/></td>
		<%
		}
		else
		{
		%>
			<img alt="no image found" width="100" height="100"/>
		<%
		}
		%>

</body>
</html>