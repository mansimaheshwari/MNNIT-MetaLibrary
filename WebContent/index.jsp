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

    <!-- Regiatration -->
    <section>
        <div class="container com-sp pad-bot-0">
            <div class="row">
                <div class="col-md-4">
                </div>
                <div class="col-md-4">
                    <div class="ho-ev-latest ho-ev-latest-bg-3">
                        <div class="ho-lat-ev"><a href="signup.jsp"><center>Register</center></a>
                        
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
<br>





<!--  

                <div class="col-md-4">
                    <div class="bot-gal h-vid ho-event-mob-bot-sp">
                        <h4>Video Gallery</h4>
                        <iframe src="https://www.youtube.com/embed/2WqFtiR4-F4?autoplay=0&amp;showinfo=0&amp;controls=0" allowfullscreen></iframe>
                        <h5>Maecenas sollicitudin lacinia</h5>
                        <p>Maecenas finibus neque a tellus auctor mattis. Aliquam tempor varius ornare. Maecenas dignissim leo leo, nec posuere purus finibus vitae.</p>
                        <p>Quisque vitae neque at tellus malesuada convallis. Phasellus in lectus vitae ex euismod interdum non a lorem. Nulla bibendum. Curabitur mi odio, tempus quis risus cursus.</p>
                    </div>
                </div>
-->
<a href="signin.jsp">want to sign in</a><br>
<a href="signup.jsp">want to sign up</a><br>
<a href="insertbook.jsp">want to insert book</a><br>
<a href="insertrepository.jsp">want to insert repository </a><br>
<a href="showallteachers.jsp">want to see all teachers</a><br>
<a href="showallstudents.jsp">want to see all students</a><br>
<a href="getdata.jsp">want to see our repository according to different choice options</a><br>


<jsp:include page="footer.jsp"/>
    
    
    
    
    
</body>
</html>