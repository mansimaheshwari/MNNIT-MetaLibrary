
<%@page import="org.apache.log4j.Logger"%>
<%final Logger log = Logger.getLogger("astudyMaterial.jsp");
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
    <title>Study Material</title>
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

                    <% } 
	log.info("session:admin:id: " + session.getAttribute("id"));
%>
	<jsp:include page="adminheader.jsp"/>
  

            <!--== BODY INNER CONTAINER ==-->
            <div class="sb2-2">
                <!--== breadcrumbs ==-->
                
                <!--== DASHBOARD INFO ==-->
                <%

            	AllMethods am=new AllMethods();
                int c=0;
                %>
                
                <!--== User Details ==-->
                <div class="sb2-2-3">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="box-inn-sp admin-form">
				<div class="sb2-2-add-blog sb2-2-1">
                    <h2>Showing All Study Material</h2>

                    <ul class="nav nav-tabs tab-list">
                        <li class="active"><a data-toggle="tab" href="#home" aria-expanded="true"><i class="fa fa-book" aria-hidden="true"></i> <span>Books</span></a>
                        </li>
                        <li class=""><a data-toggle="tab" href="#menu2" aria-expanded="false"><i class="fa fa-book" aria-hidden="true"></i> <span>Notes</span></a>
                        </li>
                        <li class=""><a data-toggle="tab" href="#menu3" aria-expanded="false"><i class="fa fa-book" aria-hidden="true"></i> <span>Papers</span></a>
                        </li>
                        <li class=""><a data-toggle="tab" href="#menu4" aria-expanded="false"><i class="fa fa-picture-o" aria-hidden="true"></i> <span>Videos</span></a>
                        </li>
                    </ul>








                    <div class="tab-content">
                        <div id="home" class="tab-pane fade active in">
                            <div class="box-inn-sp">
                                <div class="inn-title">
                                    <h4>Books Download</h4>
                                </div>
                                <div class="bor">
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th>Department</th>
                                                    <th>Subject</th>
                                                    <th>ISBN</th>
													<th>File name</th>
													<th>Download</th>
                                                </tr>
                                            </thead>
                                            
                                            
			<% 
			ResultSet rb=am.allBooks();
			%>
			
			
                                            <tbody>
                                            
          	<%
          	if(rb.next())
			{
				do{
			%>

                                                <tr>
                                                	<td><%=rb.getString("dept")%></td>
                                                    <td><%=rb.getString("domain")%></td>
                                                    <td><%=rb.getString("isbn")%></td>
                                                    <td><%=rb.getString("bname")%></td>
                                                    
                                                    <td>
                                        	<form method="post" action="downloadbook">
												<input type="hidden" name="isbn" value="<%=rb.getString("isbn")%>">
												<input type="submit"  value="Download" class="btn-success"/>
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
		
                    <td> No Books available</td>
	<%
	}
	%>
                                            </tbody>
                                        </table>
                                </div>
                            </div>
                        </div>
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        <div id="menu2" class="tab-pane fade">
                            <div class="inn-title">
                                <h4>Notes Download</h4>
                            </div>
                            <div class="bor ad-cou-deta-h4">
                                <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th>Teacher Name/Department</th>
                                                    <th>Subject Name/Department</th>
													<th>File name</th>
													<th>Download</th>
                                                </tr>
                                            </thead>
                                            
                                            
			<% 
			ResultSet rrepo=am.allrepository("notes");
			%>
			
			
                                            <tbody>
                                            
          	<%
          	if(rrepo.next())
			{
				do{
			%>

                                                <tr>
                                                	<td><%=rrepo.getString("tname")%> (<%=rrepo.getString("dept")%>)</td>
                                                    <td><%=rrepo.getString("domain")%> (<%=rrepo.getString("rdept")%>)</td>
                                                    <td><%=rrepo.getString("rname")%></td>
                                                    <td>
                                        	<form method="post" action="downloadrepository">
                            							<input type="hidden" name="rid" value="<%=rrepo.getString("rid")%>">
                            							<input type="submit"  value="Download" class="btn-success"/>
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
		
                    <td> No Notes available</td>
	<%
	}
	%>
                                            </tbody>
                                        </table>
                            </div>
                        </div>
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        <div id="menu3" class="tab-pane fade">
                            <div class="inn-title">
                                <h4>Papers Download</h4>
                            </div>
                            <div class="bor"><table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th>Teacher Name/Department</th>
                                                    <th>Subject Name/Department</th>
													<th>File name</th>
													<th>Download</th>
                                                </tr>
                                            </thead>
                                            
                                            
			<% 
			rrepo=am.allrepository("papers");
			%>
			
			
                                            <tbody>
                                            
          	<%
          	if(rrepo.next())
			{
				do{
			%>

                                                <tr>
                                                	<td><%=rrepo.getString("tname")%> (<%=rrepo.getString("dept")%>)</td>
                                                    <td><%=rrepo.getString("domain")%> (<%=rrepo.getString("rdept")%>)</td>
                                                    <td><%=rrepo.getString("rname")%></td>
                                                    <td>
                                        	<form method="post" action="downloadrepository">
                            							<input type="hidden" name="rid" value="<%=rrepo.getString("rid")%>">
                            							<input type="submit"  value="Download" class="btn-success"/>
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
		
                    <td> No Papers available</td>
	<%
	}
	%>
                                            </tbody>
                                        </table>
                            </div>
                        </div>
                        
                        
                        
                        
                        
                        
                        
                        
                        <div id="menu4" class="tab-pane fade">
                            <div class="inn-title">
                                <h4>Videos Download</h4>
                            </div>
                            <div class="bor ad-cou-deta-h4">
                                <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th>Teacher Name/Department</th>
                                                    <th>Subject Name/Department</th>
													<th>File name</th>
													<th>Download</th>
                                                </tr>
                                            </thead>
                                            
                                            
			<% 
			rrepo=am.allrepository("videos");
			%>
			
			
                                            <tbody>
                                            
          	<%
          	if(rrepo.next())
			{
				do{
			%>

                                                <tr>
                                                	<td><%=rrepo.getString("tname")%> (<%=rrepo.getString("dept")%>)</td>
                                                    <td><%=rrepo.getString("domain")%> (<%=rrepo.getString("rdept")%>)</td>
                                                    <td><%=rrepo.getString("rname")%></td>
                                                    <td>
                                        	<form method="post" action="downloadrepository">
                            							<input type="hidden" name="rid" value="<%=rrepo.getString("rid")%>">
                            							<input type="submit"  value="Download" class="btn-success"/>
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
		
                    <td> No Videos available</td>
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
                </div>
            </div>


<%
}
%>
</body>
</html>

