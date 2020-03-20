<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="experiments.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <title>Delete Student</title>
</head>

<body>


<jsp:include page="adminheader.jsp"/>

<%

            	AllMethods am=new AllMethods();
%>
                
                <!--== User Details ==-->
            <div class="sb2-2">
                <div class="sb2-2-3">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="box-inn-sp">
                                <div class="inn-title">
                                    <h4>All Student Details</h4>
                                
		                                        <a href="#!" class="s17-sprit age-dwarr-btn time-hide-1-btn">
												<i class="fa fa-angle-down"></i>
											</a>
		                                        <a href="#!" class="s17-sprit age-dwarr-btn time-hide-11-btn hb-com">
												<i class="fa fa-angle-up"></i>
											</a></div>
                                <div class="tab-inn time-hide time-hide-1">
                                    <div class="table-responsive table-desi">
                                        <table class="table table-hover">
                                            <thead>
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
			ResultSet rs=am.getStudent();
			%>
			
			
                                            <tbody>
                                            
          	<%
          	if(rs.next())
			{
				do{
					Blob blob = rs.getBlob("image");
					String image=am.getImage(blob);
			%>

                                                <tr>
                                                    <td><span class="list-img"><img src="data:image/jpg;base64,<%=image%>"></span>
                                                    </td>
                                                    <td><a href="#"><span class="list-enq-name"><%=rs.getString("sname")%></span></td>
                                                    <td><%=rs.getString("smobile")%></td>
                                                    <td><%=rs.getString("semail")%></td>
                                                    <td><%=rs.getString("dept")%></td>
                                                    <td>
                 <form method="post" action="cv">
				<input type="hidden" name="desig" value="student"/>
				<input type="hidden" name="sid" value="<%=rs.getString("sid")%>"/>
				<input type="submit" value="profile" id="profile" class="btn-success"/>
				</form>
													</td>
                                                    <td>
                 <form method="post" action="delete">
				<input type="hidden" name="desig" value="student"/>
				<input type="hidden" name="sid" value="<%=rs.getString("sid")%>"/>
				<input type="submit" value="<%=rs.getString("sid")%>"class="ad-st-view"/>
				</form>
													</td>
                                                </tr>
							<%
								}while(rs.next());
							%>                             
	<%
	}
	else
	{
	%>
		
                    <td colspan="7" > No students available</td>
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
