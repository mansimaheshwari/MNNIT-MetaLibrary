<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="experiments.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Repository</title>
</head>
<body>

<jsp:include page="header.jsp"/>


	<% 
	String type=request.getParameter("type");
	AllMethods am=new AllMethods();
	ResultSet rs=am.allrepository(type);

    int	c=am.totRepo(type);
	%>
    <section>
        <div class="container com-sp">
            <div class="row">
                <div class="cor about-sp">
                    <div class="ed-about-tit">
                        <div class="con-title">
                            <h2>Showing All<span> <%=type%></span> ( <%=c%> )</h2>
                            <p></p>
                        </div>
                        <div>
                            <div class="ho-event pg-eve-main">
                            <%
							if(rs.next())
							{
							%>
                                <ul>
                                <%
                            	do{
                            		%>
                                    <li>
                                        <div class="ho-ev-date"><span><%=rs.getString("dept")%></span>
                                        </div>
                                        <div class="ho-ev-link pg-eve-desc">
                                                <h4>Subject: <%=rs.getString("domain")%></h4>
                                            	<p>Teacher name: <%=rs.getString("tname")%></p>
                                            	<span><%=rs.getString("rname")%></span>
                                        </div>
                                        
                                    </li>
                            		<%
                            		}while(rs.next());%>
                            		
                                </ul>
                                <%
                    			}
                        		else
                        		{
                        		%>
									No data available
                        		<%
                        		}
                        		%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
<jsp:include page="footer.jsp"/>

    
</body>
</html>