<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="experiments.*" %>
<%@page import="org.apache.log4j.Logger" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Teachers </title>
</head>

<body>


<jsp:include page="header.jsp"/>


<%final Logger log = Logger.getLogger("faculties.jsp");

	String dept=request.getParameter("deptm");
	
	log.info(dept);
	AllMethods am=new AllMethods();
	ResultSet rs=am.allTeacher(dept);

	if(rs.next())
	{
%>

    <!--SECTION START-->
    <section>
        <div class="ed-res-bg">
		<div class="container com-sp pad-bot-70 ed-res-bg">
            <div class="row">
                <div class="cor about-sp">
                    <div class="ed-rsear">
                        <div class="ed-rsear-in">
                            <ul>
                            
                            
                            
                            
	
	<%
	
	do{
		String c=rs.getString("tid");
		Blob blob = rs.getBlob("image");
		String image=am.getImage(blob);
	%>

           <li>
									<div class="ed-rese-grid">
										<div class="ed-rsear-img ed-faci-full-top">
											<img src="data:image/jpg;base64,<%=image%>" alt="">
										</div>
										<div class="ed-rsear-dec ed-faci-full-bot">
											<h4><%=rs.getString("tname")%></h4>
											<p>Email:  <%=rs.getString("temail")%></p>
											<p>Mobile no.:  <%=rs.getString("tmobile")%></p>
											<p>Department:  <%=rs.getString("dept")%></p>
				<form method="post" action="cv">
				<input type="hidden" name="desig" value="teacher"/>
				<input type="hidden" name="tid" value="<%=c%>"/>
				<input type="submit" class="read-line-btn" value="profile" id="profile"/>
				</form>
										</div>
									</div>
                                </li>
                                
                                

								<%
								}while(rs.next());
								}
                            	else
                            	{
                            	%>
                            	<li>
                            			No teachers available
                            	</li>
                            	<%
                            	}
                            	%>
                            </ul>
                        </div>
                    </div>
                    <div class="ed-about-sec1">
                        <div class="col-md-6"></div>
                        <div class="col-md-6"></div>
                    </div>
                </div>
            </div>
        </div>
		</div>
    </section>
    <!--SECTION END-->


<jsp:include page="footer.jsp"/>


</body>


</html>