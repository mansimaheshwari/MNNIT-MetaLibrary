
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
<title>Books</title>
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
                            <h4><img src="images/icon/db3.png" alt="" />Selected Books</h4>
                            <div class="pro-con-table">
                                <table class="bordered responsive-table">
                                    <thead>
	<tr>
		<th>ISBN No.</th>
		<th>Name</th>
		<th>DEPARTMENT</th>
		<th>Domain</th>
		<th>Download Link</th>
	</tr>
                                    </thead>

                                    <tbody>
	<% 
	ResultSet rs=(ResultSet)request.getAttribute("books");
	if(rs.next())
	{
	do{
	%>
		<tr>
			<td><%=rs.getString("isbn")%></td>
			<td><%=rs.getString("bname")%></td>
			<td><%=rs.getString("dept")%></td>
			<td><%=rs.getString("domain")%></td>
			<td><form method="post" action="downloadbook">
						<input type="hidden" name="isbn" value="<%=rs.getString("isbn")%>">
						<input type="submit"  value="Download"/>
			
			</form></td>
		</tr>
	<%
	}while(rs.next());
	}
	else
	{
	%>
	<tr>
			<td colspan=4>No books available for this domain</td>
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