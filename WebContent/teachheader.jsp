
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Teacher Header</title>
    <!-- META TAGS -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="EEducation master is one of the best eEducational html template, it's suitable for all eEducation websites like university,college,school,online eEducation,tution center,distance eEducation,computer eEducation">
    <meta name="keyword" content="eEducation html template, university template, college template, school template, online eEducation template, tution center template">
    <!-- FAV ICON(BROWSER TAB ICON) -->
    <link rel="shortcut icon" href="images/fav.ico" type="image/x-icon">
    <!-- GOOGLE FONT -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700%7CJosefin+Sans:600,700" rel="stylesheet">
    <!-- FONTAWESOME ICONS -->
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <!-- ALL CSS FILES -->
    <link href="css/materialize.css" rel="stylesheet">
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <!-- RESPONSIVE.CSS ONLY FOR MOBILE AND TABLET VIEWS -->
    <link href="css/style-mob.css" rel="stylesheet" />
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
	<script src="js/html5shiv.js"></script>
	<script src="js/respond.min.js"></script>
	<![endif]-->
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


	
	<%
	System.out.println("session:java:id: " + session.getAttribute("id"));
	%>
	
    <!--== MAIN CONTRAINER ==-->
    <div class="container-fluid sb1">
        <div class="row">
            <!--== LOGO ==-->
            <div class="col-md-2 col-sm-3 col-xs-6 sb1-1">
                <a href="#" class="logo"><img src="images/logo1.png" alt="" />
                </a>
            </div>
            <!--== SEARCH ==-->
            <div class="col-md-4 col-sm-2 col-xs-6">
                	
            </div>
            
            <div class="col-md-2 col-sm-2 col-xs-6">
                 	<a  href="teacher.jsp" class="top-user-pro"><font color="white"><i class="fa fa-bar-chart" aria-hidden="true">Dashboard</i></font></a>
            </div>
            <div class="col-md-2 col-sm-2 col-xs-6">
                	<a  href="index.jsp" class="top-user-pro"><font color="white"><i class="fa fa-home" aria-hidden="true">Home</i></font></a>
            </div>
            <!--== MY ACCCOUNT ==-->
            <div class="col-md-2 col-sm-2 col-xs-6">
                <!-- Dropdown Trigger -->
                <a href='logout.jsp' class="top-user-pro"><font color="white"><i class="fa fa-sign-out" aria-hidden="true">Logout</i></font>
                </a>

            </div>
        </div>
    </div>


<br>

                
    <!--== BODY CONTNAINER ==-->
    <div class="container-fluid sb2">
        <div class="row">
            <div class="sb2-1">
                <!--== USER INFO ==-->
                <div class="sb2-12">
                    <ul>
                    <% String image=(String)session.getAttribute("image"); %>
                        <li><img src="data:image/jpg;base64,<%=image%>" alt="">
                        </li>
                        <li>
                            <h5><%=session.getAttribute("name")%></h5>
                            <h5><span><%=session.getAttribute("email") %></span></h5>
                            <h5><span><%=session.getAttribute("mobile")%></span></h5>
                            <h5>
				<form method="post" action="cv">
				<input type="hidden" name="desig" value="teacher"/>
				<input type="hidden" name="tid" value="<%=(String)session.getAttribute("id")%>"/>
				<input type="submit" value="profile" id="profile"/>
				</form>
							</h5>
                        </li>
                    </ul>
                </div>
                <!--== LEFT MENU ==-->
                <div class="sb2-13">
                    <ul class="collapsible" data-collapsible="accordion">
                                            
                        <li><a href="tprofile.jsp"><i class="fa fa-cogs" aria-hidden="true"></i>Profile Setting</a>
                        </li>
                        
                        <li><a href="javascript:void(0)" class="collapsible-header"><i class="fa fa-pencil" aria-hidden="true"></i>Delete</a>
                            <div class="collapsible-body left-sub-menu">
                                <ul>
                                    <li><a href="tdeleteRepo.jsp">Material</a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        
                        
                        <li><a href="javascript:void(0)" class="collapsible-header"><i class="fa fa-book" aria-hidden="true"></i> Add</a>
                            <div class="collapsible-body left-sub-menu">
                                <ul>
                                    <li><a href="insertbook.jsp">Book</a>
                                    </li>
                                    <li><a href="insertrepository.jsp">Material</a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li><a href="tstudyMaterial.jsp" class="collapsible-header"><i class="fa fa-commenting-o" aria-hidden="true"></i>Study Material</a>
                        </li>
                    </ul>
                </div>
            </div>



    <!--Import jQuery before materialize.js-->
    <script src="js/main.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/materialize.min.js"></script>
    <script src="js/custom.js"></script>
    
</body>
</html>