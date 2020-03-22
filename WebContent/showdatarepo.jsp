
<%

System.out.println("session:admin:id: " + session.getAttribute("id"));


if(session.getAttribute("id")==null)
{
	String s="you have logged out";
	System.out.println(s);
	response.sendRedirect("index.jsp?msg=" + s);
	
}
else
{
	System.out.println("valid session");

%>

<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Repositories</title>
</head>
<body>

                            <% String s=(String)request.getParameter("msg");
                            	System.out.println("from delete....." + s);
                            	
                            	if(s!=null){
                            %>
                    <script>
                    alert("<%=s%>");
                    </script>

                    <% } %>
                    

<jsp:include page="sheader.jsp"/>
 <div class="udb-sec udb-cour-stat">
                            <h4><img src="images/icon/db3.png" alt="" />Selected Repository</h4>
                            <div class="pro-con-table">
                                <table class="bordered responsive-table">
                                    <thead>
	<tr>
		<th>Department</th>
		<th>Domain</th>
		<th>Type</th>
		<th>Teacher name</th>
		<th>Download Link</th>
	</tr>
                                    </thead>

                                    <tbody>
	<% 
	ResultSet rs=(ResultSet)request.getAttribute("repo");
	if(rs.next())
	{
	do{
	%>
		<tr>
			<td><%=rs.getString("dept")%></td>
			<td><%=rs.getString("domain")%></td>
			<td><%=rs.getString("types")%></td>
			<td><%=rs.getString("tname")%></td>
			<td><form method="post" action="downloadrepository">
						<input type="hidden" name="rid" value="<%=rs.getString("rid")%>">
						<input type="submit"  value="<%=rs.getString("rname")%>"/>
			</form></td>
			
		</tr>
	<%
	}while(rs.next()); 
	}
	else
	{
	%>
	<tr>
			<td colspan=4>No repositories available for this domain</td>
	</tr>
	<%
	}
	%>
                                    </tbody>
                                </table>
                            </div>
                        </div>

	

</body>
</html>
<%}%>