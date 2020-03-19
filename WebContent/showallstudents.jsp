<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="experiments.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Students</title>
</head>
<body>


<jsp:include page="header.jsp"/>




	<% 
	AllMethods am=new AllMethods();
	ResultSet rs=am.getStudent();
	%>
	
	
    <!--SECTION START-->
    <section>
        <div class="container com-sp pad-bot-70">
            <div class="row">
                <div class="cor about-sp">

                    <div class="ed-about-tit">
                        <div class="con-title">
                            <h2>Showing All <span> Students</span></h2>
                            <p></p>
                        </div>
                    </div>
                    <div class="s18-age-event l-info-pack-days">
                        <ul>
                        
	<%if(rs.next())
	{
	do{
		Blob blob = rs.getBlob("image");
		String image=am.getImage(blob);
	%>
                            <li>
                                <div class="age-eve-com age-eve-1">
                                    <img src="data:image/jpg;base64,<%=image%>">
                                </div>
                                
									
                                <div class="s17-eve-time">
                                    <div class="s17-eve-time-tim">.
                                    </div>
                                    <div class="s17-eve-time-msg">
                                        <h4><%=rs.getString("sname")%></h4>
                                        <p>Email: <%=rs.getString("semail")%></p>
                                        <p>Mob. No. <%=rs.getString("smobile")%></p>
                                        <p>Department: <%=rs.getString("dept")%></p>
                                      <div class="time-hide time-hide-1">
                <form method="post" action="cv">
				<input type="hidden" name="desig" value="student"/>
				<input type="hidden" name="tid" value="<%=rs.getString("sid")%>"/>
				<input type="submit" value="profile" id="profile" class="fa fa-angle-down"/>
				</form>
                                            
                                        </div>
                                        <a href="#!" class="s17-sprit age-dwarr-btn time-hide-1-btn">
										<i class="fa fa-angle-down"></i>
									</a>
                                        <a href="#!" class="s17-sprit age-dwarr-btn time-hide-11-btn hb-com">
										<i class="fa fa-angle-up"></i>
									</a>
                                    </div>
                                </div>
                            </li>
							<%
								}while(rs.next());
							%>
                            
                        </ul>
                    </div>
	<%
	}
	else
	{
	%>
		
                    <div class="s18-age-event l-info-pack-days">No students available</div>
	<%
	}
	%>
                    <div class="ed-about-sec1">
                        <div class="col-md-6"></div>
                        <div class="col-md-6"></div>
                    </div>
	
                </div>
            </div>
        </div>
    </section>
    <!--SECTION END-->
	


<jsp:include page="footer.jsp"/>


</body>
</html>