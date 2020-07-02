
<%@page import="org.apache.log4j.Logger" %>
<%final Logger log = Logger.getLogger("deleteReview.jsp");


log.info("session:admin:id: " + session.getAttribute("id"));


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
    <title>Delete Reviews</title>
</head>

<body>




                            <% String s=(String)request.getParameter("msg");
                            	log.info("from delete....." + s);
                            	
                            	if(s!=null){
                            %>
                    <script>
                    alert("<%=s%>");
                    </script>

                    <% } %>
                    
                    

<jsp:include page="adminheader.jsp"/>

<%

            	AllMethods am=new AllMethods();
%>
                
            <div class="sb2-2">
                <!--== User Details ==-->
                <div class="sb2-2-3">
                    <div class="row">
                        <!--== Country Campaigns ==-->
                        <div class="col-md-12">
                            <div class="box-inn-sp">
                                <div class="inn-title">
                                    <h4>All Reviews</h4>
                                
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
													<th>Delete</th>
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
                                                    
                                                    <td>
                 <form method="post" action="delete">
				<input type="hidden" name="desig" value="review"/>
				<input type="hidden" name="id" value="<%=rb.getString("id")%>"/>
				<input type="submit" value="delete" class="ad-st-view"/>
				</form>
													</td>
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
				

</body>
</html>
<%
}
%>