<%@page import="experiments.DBConn"%>
<%@page import="experiments.AllMethods"%>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>MNNIT MetaLibrary</title>
</head>


<body>



    
<jsp:include page="header.jsp"/>

    
    
    
    
    
    <!-- SLIDER -->
    <section>
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Wrapper for slides -->
            <div class="carousel-inner">
                <div class="item slider1 active">
                    <img src="images/slider/1.jpg" alt="">
                    <div class="carousel-caption slider-con">
                        <h2>Welcome to <span>MNNIT</span></h2>
                        <p>it provides online platform</p>
                    </div>
                </div>
                <div class="item">
                    <img src="images/slider/2.jpg" alt="">
                    <div class="carousel-caption slider-con">
                        <h2>Repository for <span>Students</span></h2>
                        <p>students can download books,notes,videos,papers</p>
                    </div>
                </div>
                <div class="item">
                    <img src="images/slider/3.jpg" alt="">
                    <div class="carousel-caption slider-con">
                        <h2>Platform for <span>Teachers</span></h2>
                        <p>teachers can upload books,notes,videos,papers</p>
                    </div>
                </div>
            </div>

            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                <i class="fa fa-chevron-left slider-arr"></i>
            </a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next">
                <i class="fa fa-chevron-right slider-arr"></i>
            </a>
        </div>
    </section>
    


    <!-- DISCOVER MORE -->
    <section>
        <div class="container com-sp pad-bot-70">
            <div class="row">
                <div class="con-title">
                    <h2>Discover <span>More</span></h2>
                </div>
            </div>
            <div class="row">
                <div class="ed-course">
                    <div class="col-md-3 col-sm-4 col-xs-12">
                        <div class="ed-course-in">
                            <a class="course-overlay" href="showallbooks.jsp">
                                <img src="images/h-about.jpg" alt="">
                                <span>Books</span>
                            </a>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-4 col-xs-12">
                        <div class="ed-course-in">
                            <a class="course-overlay" href="showallrepository.jsp">
                                <img src="images/h-adm1.jpg" alt="">
                                <span>Videos</span>
                            </a>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-4 col-xs-12">
                        <div class="ed-course-in">
                            <a class="course-overlay" href="showallrepository.jsp">
                                <img src="images/h-cam.jpg" alt="">
                                <span>Papers</span>
                            </a>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-4 col-xs-12">
                        <div class="ed-course-in">
                            <a class="course-overlay" href="showallrepository.jsp">
                                <img src="images/h-res.jpg" alt="">
                                <span>Notes</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

<a href="signin.jsp">want to sign in</a><br>
<a href="signup.jsp">want to sign up</a><br>
<a href="insertbook.jsp">want to insert book</a><br>
<a href="insertrepository.jsp">want to insert repository </a><br>
<a href="showallteachers.jsp">want to see all teachers</a><br>
<a href="showallstudents.jsp">want to see all students</a><br>
<a href="getdata.jsp">want to see our repository according to different choice options</a><br>


    <!-- UPCOMING EVENTS -->
    <section>
        <div class="container com-sp pad-bot-0">
            <div class="row">
                <div class="col-md-4">
                </div>
                <div class="col-md-4">
                    <!--<div class="ho-ex-title">
							<h4>Upcoming Event</h4>
						</div>-->
                    <div class="ho-ev-latest ho-ev-latest-bg-3">
                        <div class="ho-lat-ev">
                            <h4>Register & Login</h4>
                        </div>
                    </div>
                    <div class="ho-st-login">
                        <ul class="tabs tabs-hom-reg">
                            <li class="tab col s6"><a href="#hom-vijay">Register</a>
                            </li>
                            <li class="tab col s6"><a href="#hom_log">Login</a>
                            </li>
                        </ul>
                        <div id="hom-vijay" class="col s12">
                            <form class="col s12">
                                <div class="row">
                                    <div class="input-field col s12">
                                        <input type="text" class="validate">
                                        <label>User name</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s12">
                                        <input type="text" class="validate">
                                        <label>Email id</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s12">
                                        <input type="password" class="validate">
                                        <label>Password</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s12">
                                        <input type="password" class="validate">
                                        <label>Confirm password</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s12">
                                        <input type="submit" value="Register" class="waves-effect waves-light light-btn">
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div id="hom_log" class="col s12">
                            <form class="col s12">
                                <div class="row">
                                    <div class="input-field col s12">
                                        <input type="text" class="validate">
                                        <label>Student user name</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s12">
                                        <input type="text" class="validate">
                                        <label>Password</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s12">
                                        <input type="submit" value="Login" class="waves-effect waves-light light-btn">
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>


<jsp:include page="footer.jsp"/>
    
    
    
    
    
</body>
</html>