
<%@page import="org.apache.log4j.Logger" %>
<%final Logger log = Logger.getLogger("admin.jsp");

log.info("session:teacher:id: " + session.getAttribute("id"));


if(session.getAttribute("id")==null)
{
	String s="you have logged out";
	log.info(s);
	response.sendRedirect("index.jsp?msg=" + s);
	
}
else
{
	log.info("valid session");

%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="experiments.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <title>Teacher</title>
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



                            <% s=(String)request.getParameter("msg");
                            	log.info("from profile....." + s);
                            	
                            	if(s!=null){
                            %>
                    <script>
                    alert("<%=s%>");
                    </script>

                    <% } %>



<jsp:include page="teachheader.jsp"/>

            <!--== BODY INNER CONTAINER ==-->
            <div class="sb2-2">
                <!--== breadcrumbs ==-->
                
                <!--== DASHBOARD INFO ==-->
                <%

            	AllMethods am=new AllMethods();
                int c=0;
                %>
                
                <div class="sb2-2-1">
                    <h2>Teacher Dashboard</h2>
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



                <!--== User Details ==-->
                <div class="sb2-2-3">
                    <div class="row">
                        <!--== Country Campaigns ==-->
                        <div class="col-md-12">
                            <div class="box-inn-sp">
                                <div class="inn-title">
                                    <h4>Display All Reviews</h4>
                                
		                                        <a href="#!" class="s17-sprit age-dwarr-btn time-hide-3-btn">
												<i class="fa fa-angle-down"></i>
											</a>
		                                        <a href="#!" class="s17-sprit age-dwarr-btn time-hide-33-btn hb-com">
												<i class="fa fa-angle-up"></i>
											</a></div>
                                <div class="tab-inn time-hide time-hide-3">
                                    <div class="table-responsive table-desi">
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th>Name</th>
                                                    <th>Email</th>
                                                    <th>Education</th>
													<th>Profession</th>
													<th>Review</th>
                                                </tr>
                                            </thead>
                                            
                                            
			<% 
			ResultSet rb=am.allReviews();
			%>
			
			
                                            <tbody>
                                            
          	<%
          	if(rb.next())
			{
				do{
			%>

                                                <tr>
                                                	<td><%=rb.getString("name")%></td>
                                                    <td><%=rb.getString("email")%></td>
                                                    <td><%=rb.getString("education")%></td>
                                                    <td><%=rb.getString("profession")%></td>
                                                    <td><%=rb.getString("review")%></td>
                                                </tr>
							<%
								}while(rb.next());
							%>                             
	<%
	}
	else
	{
	%>
		
                    <td> No Reviews available</td>
	<%
	}
	%>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                      </div>
                    </div>

                
             </div>
				
             
                
                


<%
}
%>
</body>
</html>

