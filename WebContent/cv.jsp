<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.mysql.jdbc.Clob"%>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
hiii...
		<script>alert("hi cv.jsp");</script>
<br>
<br>
<br>

	<%

	%>
	
    			<%
    			
				//RequestDispatcher rd=request.getRequestDispatcher("/cv");
				//rd.forward(request,response);
				

	Clob clob = (Clob)request.getAttribute("profile");
	if(clob==null)
	{
		%>
		<script>alert("clob null");</script>
		<%
	}

		            System.out.println("inside cv.java..." + clob + "  ... ");

		response.setContentType("application/pdf");
		OutputStream output = null; //response.getOutputStream();
if(clob!=null)
{
			InputStream is=null;
			try {
				is = clob.getAsciiStream();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			is.transferTo(output);
			/*byte[] b=new is.;
			while(is.read(b)>0)
			{
				output.write(b);
			}*/
			output.flush();
}
else{
				%>
<br>
<br>
    hii..2
    <%} %>
</body>
</html>