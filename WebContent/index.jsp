<%@page import="experiments.DBConn"%>
<%@page import="experiments.AllMethods"%>
<%@page import="java.sql.*" %>
<%@page import="org.apache.log4j.Logger" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>MNNIT MetaLibrary</title>
	
    <script type="text/javascript">
        function rev() {

        	//alert("hi");
            var fname = document.getElementById('nm').value.trim();
            var email = document.getElementById('el').value.trim();
            var review = document.getElementById('review').value.trim();
            

                var regex = /^[a-zA-Z ]*$/;
                var regexemail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;

                //alert("hi");
              
                if (fname == null || fname == "") {
                alert("username field can't blank");
                reviewf.nm.focus();
                return false;
                }
                else if(regex.test(fname) == false){
                alert("Name must be in alphabets only");
                reviewf.nm.focus();
                return false;
                }
                else if (email == null || email == "") {
                alert("email field can't blank...");
                reviewf.el.focus();
                return false;
                }
                else if(regexemail.test(email) == false){
                alert("enter a valid mail id");
                reviewf.nm.focus();
                return false;
                }
                else if (review == null || review == "") {
                alert("review field can't blank");
                reviewf.review.focus();
                return false;
                }
                
                document.getElementById('reviewf').submit();
               
                

        }

    </script>
    
    <script type="text/javascript">

    //var len=history.length - 1
	//history.go(-len);
	
   //window.histoty.fordward(0);
    </script>
    
</head>


<body>


                            <% String s=(String)request.getParameter("msg");
                               Logger log = Logger.getLogger("index.jsp");
                            		log.info(s);
                            	if(s!=null){
                            		log.info(s);
                            %>
                    <script>
                    alert("<%=s%>");
                    </script>

                    <% } %>
                    

    
    
<jsp:include page="header.jsp"/>

    
    
    
    
    
    <!-- SLIDER -->
    <section>
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Wrapper for slides -->
            <div class="carousel-inner">
                <div class="item slider1 active">
                    <img src="images/slider/1.jpg" alt="">
                    <div class="carousel-caption slider-con">
                        <h2>Welcome to <span><br>MNNIT Meta Library</span></h2>
                        <p>It provides a common online platform for students and teachers to facilitate Digital Library.</p>
                    </div>
                </div>
                <div class="item">
                    <img src="images/slider/2.jpg" alt="">
                    <div class="carousel-caption slider-con">
                        <h2>Repository for <span>Students</span></h2>
                        <p>Students can download books,teachers notes,lecture videos,papers.</p>
                    </div>
                </div>
                <div class="item">
                    <img src="images/slider/3.jpg" alt="">
                    <div class="carousel-caption slider-con">
                        <h2>Platform for <span>Teachers</span></h2>
                        <p>Teachers can upload and download books,personal notes,lecture videos,papers</p>
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
                            <a class="course-overlay" href="showallrepository.jsp?type=videos">
                                <img src="images/h-adm1.jpg" alt="">
                                <span>Videos</span>
                            </a>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-4 col-xs-12">
                        <div class="ed-course-in">
                            <a class="course-overlay" href="showallrepository.jsp?type=papers">
                                <img src="images/h-cam.jpg" alt="">
                                <span>Papers</span>
                            </a>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-4 col-xs-12">
                        <div class="ed-course-in">
                            <a class="course-overlay" href="showallrepository.jsp?type=notes">
                                <img src="images/h-res.jpg" alt="">
                                <span>Notes</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <!-- REVIEW SECTION START -->
    <section class="c-all h-quote">
        <div class="container">
            <div class="col-md-6 col-sm-12 col-xs-12">
                <div class="all-title quote-title qu-new">
                    <h2>Reviews</h2>
                    <p>Provide us with your valuable review and feedback</p>
                    <p>no need to sign up for giving feedback </p>
                    <p class="help-line">Mail ID : 
                    <a href="https://accounts.google.com/ServiceLogin/signinchooser?service=mail&passive=true&rm=false&continue=https%3A%2F%2Fmail.google.com%2Fmail%2F%3Ftab%3Dwm1&scc=1&ltmpl=default&ltmplcache=2&emr=1&osid=1&flowName=GlifWebSignIn&flowEntry=ServiceLogin">
                    <span>admin@mnnit.ac.in</span></a></p>
                    <p>To directly contact the admin</p>
                    <span class="help-arrow pulse"><i class="fa fa-angle-right" aria-hidden="true"></i></span> </div>
            </div>
            <div class="col-md-6 col-sm-12 col-xs-12">
                <div class="n-form-com admiss-form">
                    <div class="col s12">
                        <form class="form-horizontal" id="reviewf" method="post" action="review">
                            <div class="form-group">
                                <label class="control-label col-sm-3">Full Name:</label>
                                <div class="col-sm-9">
                                    <input type="text" id="nm" name="nm" class="form-control" placeholder="Enter your name" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3">Email Id:</label>
                                <div class="col-sm-9">
                                    <input type="email" id="el" name="el" class="form-control" placeholder="Enter email" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3">Education Qualification:</label>
                                <div class="col-sm-9">
                                    <select id="edu" name="edu">
								<option>High School</option>
								<option>Intermediate</option>
								<option>Graduate</option>
								<option>Post Graduate</option>
								<option>PhD</option>
							  		</select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3">Profession:</label>
                                <div class="col-sm-9">
                                    <select id="prof" name="prof">
								<option>Student</option>
								<option>Teacher</option>
								<option>Working</option>
							  		</select>
							  </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3">Review / Feedback :</label>
                                <div class="col-sm-9">
                                    <textarea rows="3" cols="15" id="review" name="review" class="form-control" maxlength="450" required="required" placeholder="Enter your review"></textarea>
                                </div>
                            </div>
                            <div class="form-group mar-bot-0">
                                <div class="col-sm-offset-3 col-sm-9">
                                    <i class="waves-effect waves-light light-btn waves-input-wrapper" style=""><input type="button" value="SUBMIT" class="waves-button-input" onclick="rev()"></i>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--SECTION END-->
    

<jsp:include page="footer.jsp"/>
    
    
    
    
    
</body>
</html>