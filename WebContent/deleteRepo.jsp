
<%@page import="org.apache.log4j.Logger" %>
<%final Logger log = Logger.getLogger("deleteRepo.jsp");


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
    <title>Delete Teacher</title>
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
                                    <h4>All Repositories</h4>
                                
		                                        <a href="#!" class="s17-sprit age-dwarr-btn time-hide-4-btn">
												<i class="fa fa-angle-down"></i>
											</a>
		                                        <a href="#!" class="s17-sprit age-dwarr-btn time-hide-44-btn hb-com">
												<i class="fa fa-angle-up"></i>
											</a></div>
                                <div class="tab-inn time-hide time-hide-4">
                                    <div class="table-responsive table-desi">
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th>Department</th>
                                                    <th>Subject</th>
                                                    <th>Type</th>
                                                    <th>Teacher</th>
													<th>File name</th>
													<th>Delete</th>
                                                </tr>
                                            </thead>
                                            
                                            
			<% 
			ResultSet rrepo=am.allrepository();
			%>
			
			
                                            <tbody>
                                            
          	<%
          	if(rrepo.next())
			{
				do{
			%>

                                                <tr>
                                                	<td><%=rrepo.getString("dept")%></td>
                                                    <td><%=rrepo.getString("domain")%></td>
                                                    <td><%=rrepo.getString("types")%></td>
                                                    <td><%=rrepo.getString("tname")%></td>
                                                    <td><%=rrepo.getString("rname")%></td>
                                                    
                                                    <td>
                 <form method="post" action="delete">
				<input type="hidden" name="desig" value="repo"/>
				<input type="hidden" name="rid" value="<%=rrepo.getString("rid")%>"/>
				<input type="submit" value="delete"class="ad-st-view"/>
				</form>
													</td>
                                                </tr>
							<%
								}while(rrepo.next());
							%>                             
	<%
	}
	else
	{
	%>
		
                    <td> No Repository available</td>
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