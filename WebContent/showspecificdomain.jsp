
<%@page import="java.sql.*" %>
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

<%final Logger log = Logger.getLogger("showspecificdomain.jsp");
String s=(String)request.getParameter("msg");
                            	log.info("from profile....." + s);
                            	
                            	if(s!=null){
                            %>
                    <script>
                    alert("<%=s%>");
                    </script>

                    <% } %>


<jsp:include page="header.jsp"/>

<br>

<table>
	<tr>
		<th><b>DEPARTMENT</b></th>
		<th><b>Domain</b></th>
	</tr>
	
	<% 
	ResultSet rs=(ResultSet)request.getAttribute("deptdomain");
	if(rs.next())
	{
	do{
	%>
		<tr>
			<td><%=rs.getString("dept")%></td>
			<td><%=rs.getString("domain")%></td>
		</tr>
	<%
	}while(rs.next());
	}
	else
	{
	%>
	<tr>
			<td colspan=4>No subjects</td>
	</tr>
	<%
	}
	%>
	

</table>

<jsp:include page="footer.jsp"/>

</body>
</html>