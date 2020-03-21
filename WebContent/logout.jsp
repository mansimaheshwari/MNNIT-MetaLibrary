
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%

if(session!=null)
{
	System.out.println("logging out : "+session.getAttribute("id"));
	session.setAttribute("id",null);
}
session.invalidate();

System.out.println("session invalidated" );
	
	//String msg="logging out";
	//response.sendRedirect("index.jsp?msg="+msg);
%>

<script >
window.close();
window.open("index.jsp");
</script>
</body>
</html>