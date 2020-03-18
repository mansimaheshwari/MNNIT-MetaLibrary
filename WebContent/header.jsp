<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <!-- META TAGS -->
	<meta charset="ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
      
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
    
    <!--Import jQuery before materialize.js-->
    <script src="js/main.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/materialize.min.js"></script>
    <script src="js/custom.js"></script>
    
    
    
    <script type="text/javascript">
        function login() {
            var username = document.getElementById('email').value.trim();
            var password = document.getElementById('cpass').value.trim();
            if (username == null || username == "") {
                alert("email field can't blank");
                loginform.email.focus();
                return false;
            }
            else if (password == null || password == "") {
                alert("password field can't blank");
                loginform.cpass.focus();
                return false;
            }
            document.getElementById('loginform').submit();

        }

    </script>
    
    
   </head>
<body>


    <!-- MOBILE MENU -->
    <section>
        <div class="ed-mob-menu">
            <div class="ed-mob-menu-con">
                <div class="ed-mm-left">
                    <div class="wed-logo">
                        <a href="index.jsp"><img src="images/logo.png" alt="MNNIT" height="70" />
						</a>
                    </div>
                </div>
                <div class="ed-mm-right">
                    <div class="ed-mm-menu">
                        <a href="#!" class="ed-micon"><i class="fa fa-bars"></i></a>
                        <div class="ed-mm-inn">
                            <a href="#!" class="ed-mi-close"><i class="fa fa-times"></i></a>
                            <h4>All Courses</h4><a href="showAllDeptDomain.jsp">
                                        <ul>
                                                        <li>Biotechnology</li>
														<li>Chemical Engineering</li>
                                                        <li>Civil Engineering</li>
                                                        <li>Computer Science and Engineering</li>
                                                        <li>Electrical Engineering</li>
                                                        <li>Electronics and Communication Engineering</li>
                                                        <li>Mechanical Engineering</li>
                                        </ul></a>
                            <h4>User Account</h4>
                            <ul>
                                <li><a href="#!" data-toggle="modal" data-target="#modal1">Sign In</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    
    <!--SECTION LOGIN-->
    <section>
        <!-- LOGIN SECTION -->
        <div id="modal1" class="modal fade" role="dialog">
            <div class="log-in-pop">
                <div class="log-in-pop-left">
                    <h1>Hello...</h1>
                    <p>Don't have an account? Create your account. It's take less then a minutes</p>
                    <h4>Login with social media</h4>
                    <ul>
                        <li><a href="https://en-gb.facebook.com/login/"><i class="fa fa-facebook"></i> Facebook</a>
                        </li>
                        <li><a href="https://accounts.google.com/ServiceLogin/signinchooser?service=mail&passive=true&rm=false&continue=https%3A%2F%2Fmail.google.com%2Fmail%2F%3Ftab%3Dwm1&scc=1&ltmpl=default&ltmplcache=2&emr=1&osid=1&flowName=GlifWebSignIn&flowEntry=ServiceLogin"><i class="fa fa-google"></i> Google+</a>
                        </li>
                        <li><a href="https://twitter.com/login?lang=en"><i class="fa fa-twitter"></i> Twitter</a>
                        </li>
                    </ul>
                </div>
                <div class="log-in-pop-right">
                    <a href="#" class="pop-close" data-dismiss="modal"><img src="images/cancel.png" alt="" />
                    </a>
                    <h4>Login</h4>
                    <p>Don't have an account? Create your account. It's take less then a minutes</p>
                    
                    
                    
                    
<form class="s12" method="post" action="signin" id="loginform">
                        <div>
                            <div class="input-field s12">
                                <input type="email" id="email" name="email" data-ng-model="name" class="validate">
                                <label>Email</label>
                            </div>
                        </div>
                        <div>
                            <div class="input-field s12">
                                <input type="password" class="validate" id="cpass" name="cpass">
                                <label>Password</label>
                            </div>
                        </div>
                        <div class="s12">
	 <label>I am:</label>	<select id="designation" name="designation">
					<option>Student</option>
					<option>Teacher</option>
					<option>Admin</option>
	</select>
                        </div>
                        <div>
                            <div class="s12 log-ch-bx">
                                <p>
                                    <input type="checkbox" id="test5" />
                                    <label for="test5">Remember me</label>
                                </p>
                            </div>
                        </div>
                        <div>
                            <div class="input-field s4">
								<input type="button" form="loginform" value="submit" class="waves-effect waves-light log-in-btn" onclick="login()"/>
								<input type="reset" id="reset" value="reset" class="waves-effect waves-light log-in-btn"/>
                        </div>
						</div>
                        <div>
                            <div class="input-field s12"> <a href="#" data-dismiss="modal" data-toggle="modal" data-target="#modal3">Forgot password</a>
                             | 
                             <a href="register.jsp" >Create a new account</a> </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        
        
        <!-- FORGOT SECTION -->
        <div id="modal3" class="modal fade" role="dialog">
            <div class="log-in-pop">
                <div class="log-in-pop-left">
                    <h1>Hello... </h1>
                    <p>Don't have an account? Create your account. It's take less then a minutes</p>
                    <h4>Login with social media</h4>
                    <ul>
                        <li><a href="https://en-gb.facebook.com/login/"><i class="fa fa-facebook"></i> Facebook</a>
                        </li>
                        <li><a href="https://accounts.google.com/ServiceLogin/signinchooser?service=mail&passive=true&rm=false&continue=https%3A%2F%2Fmail.google.com%2Fmail%2F%3Ftab%3Dwm1&scc=1&ltmpl=default&ltmplcache=2&emr=1&osid=1&flowName=GlifWebSignIn&flowEntry=ServiceLogin"><i class="fa fa-google"></i> Google+</a>
                        </li>
                        <li><a href="https://twitter.com/login?lang=en"><i class="fa fa-twitter"></i> Twitter</a>
                        </li>
                    </ul>
                </div>
                <div class="log-in-pop-right">
                    <a href="#" class="pop-close" data-dismiss="modal"><img src="images/cancel.png" alt="" />
                    </a>
                    <h4>Forgot password</h4>
                    <p>Don't have an account? Create your account. It's take less then a minutes</p>
                    <form class="s12" method="post" action="forgotpass">
                        
                        <div class="s12">
	 <label>I am:</label>	<select id="d" name="d">
					<option value="Student">Student</option>
					<option value="Teacher">Teacher</option>
	</select>
                        </div>
                        <div>
                            <div class="input-field s12">
                                <input type="text" id="r" name="r" class="validate" data-ng-model="name3" required>
                                <label>OLD Registration Number</label>
                            </div>
                        </div>
                        <div>
                            <div class="input-field s12">
                                <input type="text" id="n" name="n" class="validate" data-ng-model="name3" required>
                                <label>OLD User name</label>
                            </div>
                        </div>
                        <div>
                            <div class="input-field s12">
                                <input type="email" class="validate" id="e" name="e" data-ng-model="name3" required>
                                <label>OLD Email id</label>
                            </div>
                        </div>
                        <div>
                            <div class="input-field s12">
                                <input type="number" id="m" name="m" required class="validate" data-ng-model="name3" >
                                <label>OLD Mobile No.</label>
                            </div>
                        </div>
                        <div>
                            <div class="input-field s4">
                                <input type="submit" value="Submit" class="waves-effect waves-light log-in-btn"> 
                        	</div>
                        </div>
                        <div><font color="blue">
                            <div class="input-field s12"> <a href="#" data-dismiss="modal" data-toggle="modal" data-target="#modal1">Are you a already member ? Login</a>
                             | 
                            <a href="register.jsp" >Create a new account</a> </div>
                        </font> </div>
                    </form>
                </div>
            </div>
        </div>
        
     </section>   
     
        
        
    <!-- SOCIAL MEDIA SHARE  side icons -->
    <section>
        <div class="icon-float">
            <ul>
                <li><a href="https://www.facebook.com/MNNIT.Allahabad" class="fb1"><i class="fa fa-facebook" aria-hidden="true"></i></a> </li>
                <li><a href="http://www.mnnit.ac.in/" class="gp1"><i class="fa fa-google-plus" aria-hidden="true"></i></a> </li>
                <li><a href="https://twitter.com/mnnitalld" class="tw1"><i class="fa fa-twitter" aria-hidden="true"></i></a> </li>
                <li><a href="https://www.linkedin.com/company/mnnit" class="li1"><i class="fa fa-linkedin" aria-hidden="true"></i></a> </li>
                
            </ul>
        </div>
        
        <%!Object p;%>
        <% p=request.getAttribute("msg");
        	String s=(String)p;
        	
        	if(s!=null){
        %>
<script>
alert("${msg}");
</script>

<% } %>
    </section>
    
    
    
    

    <!--HEADER SECTION-->
    <section>
        <!-- TOP BAR -->
        <div class="ed-top" >
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="ed-com-t1-left">
                            <ul>
                                <li><a href="#">Address: MNNIT Allahabad, Teliar Ganj, Prayagraj, U.P.</a>
                                </li>
                                <li><a href="tel://0099999999" class="contact-icon">Phone: 0532 - 2545404/07, 2540233, 2545729</a>
                                </li>
                            </ul>
                        </div>
                        <div class="ed-com-t1-right">
                            <ul>
                                <li><a href="#!" data-toggle="modal" data-target="#modal1">Sign In</a>
                                </li>
                            </ul>
                        </div>
                        <div class="ed-com-t1-social">
                    <ul>
                <li><a href="https://www.facebook.com/MNNIT.Allahabad" ><i class="fa fa-facebook" aria-hidden="true"></i></a> </li>
                <li><a href="http://www.mnnit.ac.in/" ><i class="fa fa-google-plus" aria-hidden="true"></i></a> </li>
                <li><a href="https://twitter.com/mnnitalld" ><i class="fa fa-twitter" aria-hidden="true"></i></a> </li>
                <li><a href="https://www.linkedin.com/company/mnnit" ><i class="fa fa-linkedin" aria-hidden="true"></i></a> </li>
               
                    </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- LOGO AND MENU SECTION -->
        <div class="top-logo" data-spy="affix" data-offset-top="250">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="wed-logo">
                            <a href="index.html"><img src="images/logo.png" alt="MNNIT" height="70"/>
                            </a>
                        </div>
                        <div class="main-menu">
                            <ul>
                                <li><a href="index.jsp">Home</a>
                                </li>
                                
                                <li class="about-menu">
                                    <a href="about.jsp" class="mm-arr">About us</a>
                                </li>   
                                <li class="cour-menu">
                                    <a href="#!" class="mm-arr">Faculties</a>
                                    <div class="cour-mm m-menu  mm1-com mm1-cour-com">
                                                    <ul>
                                                        <li><a href="faculties.jsp?deptm=Biotechnology">Biotechnology</a></li>
                                                        <li><a href="faculties.jsp?deptm=Chemical Engineering">Chemical Engineering</a></li>
                                                        <li><a href="faculties.jsp?deptm=Civil Engineering">Civil Engineering</a></li>
                                                        <li><a href="faculties.jsp?deptm=Computer Science and Engineering">Computer Science and Engineering</a></li>
                                                        <li><a href="faculties.jsp?deptm=Electrical Engineering">Electrical Engineering</a></li>
                                                        <li><a href="faculties.jsp?deptm=Electronics and Communication Engineering">Electronics and Communication Engineering</a></li>
                                                        <li><a href="faculties.jsp?deptm=Mechanical Engineering">Mechanical Engineering</a></li>
	                                                    <li>.</li>
	                                                    <li>.</li>
	                                                    <li>.</li>
	                                                </ul>
                                    </div>
                                </li>
                                <li><a href="contact-us.jsp">Contact us</a>
                                </li>
                                <li><a href="search.jsp"><font color="red"><b>Search</b></font></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="all-drop-down-menu">

                    </div>

                </div>
            </div>
        </div>
        
        
        <div class="search-top">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="search-form">
                            <form action="getdeptdomain" method="post">
                                <div class="sf-type">
                                <select id="deptmt" name="deptmt">
                                	<option value="Biotechnology">Biotechnology</option>
                                	<option value="Chemical Engineering">Chemical Engineering</option>
                                	<option value="Civil Engineering">Civil Engineering</option>
                                	<option value="Computer Science and Engineering">Computer Science and Engineering</option>
                                	<option value="Electrical Engineering">Electrical Engineering</option>
                                	<option value="Electronics and Communication Engineering">Electronics and Communication Engineering</option>
                                	<option value="Mechanical Engineering">Mechanical Engineering</option>
                                </select>
                                </div>
                                <div class="sf-submit">
                                    <input type="submit" value="Search Course">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
	</section>
</body>
</html>