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
                
                
                


			
			
                <!--== User Details ==-->
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
                
                
				
                <div class="sb2-2-3">
                    <div class="row">
                        <!--== Country Campaigns ==-->
                        <div class="col-md-6">
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
				<input type="hidden" name="isbn" value="<%=rt.getString("isbn")%>"/>
				<input type="submit" value="view" id="profile" class="btn-success"/>
				</form>
													</td>
                                                    <td>
                 <form method="post" action="delete">
				<input type="hidden" name="desig" value="book"/>
				<input type="hidden" name="tid" value="<%=rb.getString("isbn")%>"/>
				<input type="submit" value="<%=rb.getString("isbn")%>"class="ad-st-view"/>
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
		
                    <td colspan="7" > No Books available</td>
	<%
	}
	%>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--== Country Campaigns ==-->
                        <div class="col-md-6">
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
                                                    <th>ISBN</th>
													<th>View</th>
													<th>Delete (File name)</th>
                                                </tr>
                                            </thead>
                                            
                                            
			<% 
			ResultSet rr=am.allrepository();
			%>
			
			
                                            <tbody>
                                            
          	<%
          	if(rr.next())
			{
				do{
			%>

                                                <tr>
                                                	<td><%=rr.getString("dept")%></td>
                                                    <td><%=rr.getString("domain")%></td>
                                                    <td><%=rr.getString("isbn")%></td>
                                                    <td>
                 <form method="post" action="cv">
				<input type="hidden" name="desig" value="repo"/>
				<input type="hidden" name="rid" value="<%=rt.getString("rid")%>"/>
				<input type="submit" value="view" id="profile" class="btn-success"/>
				</form>
													</td>
                                                    <td>
                 <form method="post" action="delete">
				<input type="hidden" name="desig" value="repo"/>
				<input type="hidden" name="rid" value="<%=rr.getString("rid")%>"/>
				<input type="submit" value="<%=rr.getString("rid")%>"class="ad-st-view"/>
				</form>
													</td>
                                                </tr>
							<%
								}while(rr.next());
							%>                             
	<%
	}
	else
	{
	%>
		
                    <td colspan="7" > No Books available</td>
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
			<!--	
                <div class="sb2-2-3">
                    <div class="row">
                        == Listing Enquery ==
                        <div class="col-md-12">
                            <div class="box-inn-sp">
                                <div class="inn-title">
                                    <h4>Exam Time Tables</h4>
                                
		                                        <a href="#!" class="s17-sprit age-dwarr-btn time-hide-5-btn">
												<i class="fa fa-angle-down"></i>
											</a>
		                                        <a href="#!" class="s17-sprit age-dwarr-btn time-hide-55-btn hb-com">
												<i class="fa fa-angle-up"></i>
											</a></div>
                                <div class="tab-inn time-hide time-hide-4">
                                    <div class="table-responsive table-desi">
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th>Select</th>
													<th>Degree</th>
                                                    <th>Exam Name</th>
                                                    <th>Start Date</th>
													<th>End Date</th>
                                                    <th>Timing</th>
                                                    <th>View</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <input type="checkbox" class="filled-in" id="filled-in-box-1" checked="checked" />
                                                        <label for="filled-in-box-1"></label>
                                                    </td>
													<td>MBA</td>
                                                    <td><span class="list-enq-name">Civil engineering</span><span class="list-enq-city">Illunois, United States</span>
                                                    </td>
                                                    <td>10:00am</td>
													<td>01:00pm</td>
                                                    <td>03:00Hrs</td>
                                                    <td>
                                                        <a href="admin-exam.html" class="ad-st-view">View</a>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!--== Latest Activity ==
                <div class="sb2-2-3">
                    <div class="row">
                        <!--== Latest Activity ==
                        <div class="col-md-6">
                            <div class="box-inn-sp">
                                <div class="inn-title">
                                    <h4>Latest Activity</h4>
                                
		                                        <a href="#!" class="s17-sprit age-dwarr-btn time-hide-6-btn">
												<i class="fa fa-angle-down"></i>
											</a>
		                                        <a href="#!" class="s17-sprit age-dwarr-btn time-hide-66-btn hb-com">
												<i class="fa fa-angle-up"></i>
											</a></div>
                                <div class="tab-inn time-hide time-hide-4 list-act-hom">
                                    <ul>
                                        <li class="list-act-hom-con">
                                            <i class="fa fa-clock-o" aria-hidden="true"></i>
                                            <h4><span>12 may, 2017</span> Welcome to Academy</h4>
                                            <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour.</p>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <!--== Social Media ==
                        <div class="col-md-6">
                            <div class="box-inn-sp">
                                <div class="inn-title">
                                    <h4>Social Media</h4>
		                                        <a href="#!" class="s17-sprit age-dwarr-btn time-hide-7-btn">
												<i class="fa fa-angle-down"></i>
											</a>
		                                        <a href="#!" class="s17-sprit age-dwarr-btn time-hide-77-btn hb-com">
												<i class="fa fa-angle-up"></i>
											</a></div>
                                <div class="tab-inn time-hide time-hide-4">
                                    <div class="table-responsive table-desi">
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th>Media</th>
                                                    <th>Name</th>
                                                    <th>Share</th>
                                                    <th>Like</th>
                                                    <th>Members</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td><span class="list-img"><img src="images/sm/1.png" alt=""></span>
                                                    </td>
                                                    <td><span class="list-enq-name">Linked In</span><span class="list-enq-city">Illunois, United States</span>
                                                    </td>
                                                    <td>15K</td>
                                                    <td>18K</td>
                                                    <td>
                                                        <span class="label label-success">263</span>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

-->


</body>
</html>

