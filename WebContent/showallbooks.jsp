<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="experiments.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All books</title>
</head>
<body>

<jsp:include page="header.jsp"/>

	<% 
	AllMethods am=new AllMethods();
	ResultSet rs=am.allBooks();

    int	c=am.totBook();
	%>
    <section>
        <div class="container com-sp">
            <div class="row">
                <div class="cor about-sp">
                    <div class="ed-about-tit">
                        <div class="con-title">
                            <h2>Showing All<span> Books</span> ( <%=c%> )</h2>
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
                                            	<p>ISBN: <%=rs.getString("isbn")%></p>
                                            	<span><%=rs.getString("bname")%></span>
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
									No books available
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