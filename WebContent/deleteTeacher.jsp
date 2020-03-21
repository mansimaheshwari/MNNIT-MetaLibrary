
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
    <title>Delete Teacher</title>
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
                    
                    
                    
<jsp:include page="adminheader.jsp"/>

<%

            	AllMethods am=new AllMethods();
%>
                
            <div class="sb2-2">
                <!--== User Details ==-->
                <div class="sb2-2-3">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="box-inn-sp">
                                <div class="inn-title">
                                    <h4>All Teachers Details</h4>
                                
		                                        <a href="#!" class="s17-sprit age-dwarr-btn time-hide-2-btn">
												<i class="fa fa-angle-down"></i>
											</a>
		                                        <a href="#!" class="s17-sprit age-dwarr-btn time-hide-22-btn hb-com">
												<i class="fa fa-angle-up"></i>
											</a></div>
                                <div class="tab-inn time-hide time-hide-2">
                                    <div class="table-responsive table-desi">
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                <tr>
                                                    <th>User</th>
                                                    <th>Name</th>
                                                    <th>Phone</th>
                                                    <th>Email</th>
                                                    <th>Department</th>
													<th>Profile</th>
													<th>Delete (reg. no.)</th>
													
                                                </tr>
                                            </thead>
                                            
                                            
			<% 
			ResultSet rt=am.getTeacher();
			%>
			
			
                                            <tbody>
                                            
          	<%
          	if(rt.next())
			{
				do{
					Blob blob = rt.getBlob("image");
					String image=am.getImage(blob);
			%>

                                                <tr>
                                                    <td><span class="list-img"><img src="data:image/jpg;base64,<%=image%>"></span></td>
                                                    <td><span class="list-enq-name"><%=rt.getString("tname")%></span></td>
                                                    <td><%=rt.getString("tmobile")%></td>
                                                    <td><%=rt.getString("temail")%></td>
                                                    <td><%=rt.getString("dept")%></td>
                                                    <td>
                 <form method="post" action="cv">
				<input type="hidden" name="desig" value="teacher"/>
				<input type="hidden" name="tid" value="<%=rt.getString("tid")%>"/>
				<input type="submit" value="profile" id="profile" class="btn-success"/>
				</form>
													</td>
                                                    <td>
                 <form method="post" action="delete">
				<input type="hidden" name="desig" value="teacher"/>
				<input type="hidden" name="tid" value="<%=rt.getString("tid")%>"/>
				<input type="submit" value="<%=rt.getString("tid")%>"class="ad-st-view"/>
				</form>
													</td>
                                                </tr>
							<%
								}while(rt.next());
							%>                             
	<%
	}
	else
	{
	%>
		
                    <td colspan="7" > No teachers available</td>
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
<%}%>