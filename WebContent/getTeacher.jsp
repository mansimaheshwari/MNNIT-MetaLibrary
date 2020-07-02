<%@page import="experiments.AllMethods"%>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.*" %>
<%@page import="org.apache.log4j.Logger" %>

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
 <%final Logger log = Logger.getLogger("getTeacher.jsp");


		String dept=request.getParameter("dept");
		String domain=request.getParameter("domain");
		String types=request.getParameter("types");
		log.info("domain in t:" + domain);
		log.info("type in t:" + types);
		AllMethods am=new AllMethods();
		ResultSet rs=am.getTeacher(dept,domain,types);
		
		if(rs.next())
		{
		do
		{
			log.info(rs.getString("tname"));
			
		%>
			<option value="<%=rs.getString("tid")%>"><%=rs.getString("tname")%></option>
		<%
		}while(rs.next());
		}
		else
		{
		%>
			<option value="0">None of the teachers have uploaded any material of this type in this domain</option>
		<%
		}
		%>

</body>
</html>