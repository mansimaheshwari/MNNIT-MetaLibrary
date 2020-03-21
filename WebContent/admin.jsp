
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


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="experiments.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <title>Admin</title>
</head>

<body>


<%!Object p;%>
<% p=request.getAttribute("msg");
   String s=(String)p;
        	
   if(s!=null){
%>
<script>
alert("${msg}");
</script>
<% } %>


<jsp:include page="adminheader.jsp"/>

            <!--== BODY INNER CONTAINER ==-->
            <div class="sb2-2">
                <!--== breadcrumbs ==-->
                
                <!--== DASHBOARD INFO ==-->
                <%

            	AllMethods am=new AllMethods();
                int c=0;
                %>
                
                <div class="sb2-2-1">
                    <h2>Admin Dashboard</h2>
                    <p></p>
                    <div class="db-2">
                        <ul>
                            <li>
                                <div class="dash-book dash-b-1">
                                    <h5>Total Teachers</h5>
                                    <%
                                	c=am.totTeacher();
                                	%>
                                    <h4><%=c%></h4>
                                </div>
                            </li>
                            <li>
                                <div class="dash-book dash-b-2">
                                    <h5>Total Students</h5>
                                    <%
                                	c=am.totStudent();
                                	%>
                                    <h4><%=c%></h4>
                                </div>
                            </li>
                            <li>
                                <div class="dash-book dash-b-3">
                                    <h5>Total No. of Books</h5>
                                    <%
                                	c=am.totBook();
                                	%>
                                    <h4><%=c%></h4>
                                </div>
                            </li>
                            <li>
                                <div class="dash-book dash-b-4">
                                    <h5>Total Repositories</h5>
                                    <%
                                	c=am.totRepo();
                                	%>
                                    <h4><%=c%></h4>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
             </div>
             
                
                


<%
}
%>
</body>
</html>

