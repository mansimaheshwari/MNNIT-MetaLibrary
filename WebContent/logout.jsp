
<%@page import="org.apache.log4j.Logger" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%final Logger log = Logger.getLogger("logout.jsp");
if(session!=null)
{
	log.info("logging out : "+session.getAttribute("id"));
	session.setAttribute("id",null);
}
session.invalidate();

log.info("session invalidated" );
	
	//String msg="logging out";
	//response.sendRedirect("index.jsp?msg="+msg);
%>

<script >
window.close();
window.open("index.jsp");
</script>
</body>
</html>