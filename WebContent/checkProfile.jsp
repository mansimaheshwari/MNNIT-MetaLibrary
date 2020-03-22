<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Check</title>
</head>
<body>
<%
String stype=(String)session.getAttribute("signintype");

if(stype!=null){

if(stype.equals("admin"))
		{
	RequestDispatcher rd=request.getRequestDispatcher("admin.jsp");
	rd.forward(request,response);
	
		}

if(stype.equals("teacher"))
{
	RequestDispatcher rd=request.getRequestDispatcher("teacher.jsp");
	rd.forward(request,response);

}
else if(stype.equals("student"))
{
	RequestDispatcher rd=request.getRequestDispatcher("student.jsp");
	rd.forward(request,response);
	
}
}
else
{
	String msg="signin first";
	response.sendRedirect("index.jsp?msg="+msg);
}



%>

</body>
</html>