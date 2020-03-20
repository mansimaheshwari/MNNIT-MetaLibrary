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
                                    <h4>All Books</h4>
                                
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
                                                    <th>Department</th>
                                                    <th>Subject</th>
                                                    <th>ISBN</th>
													<th>View</th>
													<th>Delete (File name)</th>
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
                                                    <td>
                 <form method="post" action="cv">
				<input type="hidden" name="desig" value="book"/>
				<input type="hidden" name="isbn" value="<%=rb.getString("isbn")%>"/>
				<input type="submit" value="view" id="profile" class="btn-success"/>
				</form>
													</td>
                                                    <td>
                 <form method="post" action="delete">
				<input type="hidden" name="desig" value="book"/>
				<input type="hidden" name="isbn" value="<%=rb.getString("isbn")%>"/>
				<input type="submit" value="<%=rb.getString("bname")%>"class="ad-st-view"/>
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
                        </div>
                      </div>
                    </div>

                
             </div>
				

</body>
</html>
