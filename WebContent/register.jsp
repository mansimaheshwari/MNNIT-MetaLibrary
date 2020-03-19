
<!DOCTYPE html>
<html lang="en">


<head>
    <title>Register</title>
    
    
    <script type="text/javascript">
        function check() {

            var d = document.getElementById('desn');
            var designation=d.options[d.selectedIndex].text;

        	//alert("hi");
            var reg = document.getElementById('reg').value.trim();
            var fname = document.getElementById('name').value.trim();
            var email = document.getElementById('eml').value.trim();
            var password = document.getElementById('p').value.trim();
            var cpassword = document.getElementById('cp').value.trim();
            var mobile = document.getElementById('mobl').value.trim();
            

            var pic = document.getElementById('pic').value.trim();
            var profile = document.getElementById('profile').value.trim();
                var regex = /^[a-zA-Z ]*$/;
                var regexm = /^\d{10}$/;

                var regexs = /^\d{4}\w{2}\d{2}$/;
                var regext = /^\d{4}[a-zA-Z]{4}$/;
                var regexmail = /@mnnit.ac.in$/;
                
                var regexpic = /.(jpg|jpeg|png)$/;
                var regexprof = /.pdf$/;


                var minNumberofChars = 6;
                var maxNumberofChars = 15;

              //  alert("hi");
                if (designation == "Teacher" && regext.test(reg) == false) {
                    alert("enter valid teacher registration no.");
                    register.reg.focus();
                return false;
                }
                else if (designation == "Student" &&  regexs.test(reg) == false ) {
                    alert("enter valid student registration no.");
                    register.reg.focus();
                    return false;
                    }
                else if (fname == null || fname == "") {
                alert("username field can't blank");
                register.name.focus();
                return false;
                }
                else if(regex.test(fname) == false){
                alert("Name must be in alphabets only");
                register.name.focus();
                return false;
                }
                else if (email == null || email == "") {
                alert("email field can't blank...");
                register.eml.focus();
                return false;
                }
                else if(designation == "Teacher" && regexmail.test(email) == false){
                    alert("teachers have to use mnnit email id");
                    register.eml.focus();
                    return false;
                        
                    }
                else if(mobile.length == 0){
                    alert("mobile number cant be null");
                    register.mob.focus();
                    return false; 
                }
            else if(mobile.length != 10 || regexm.test(mobile) == false){
                    alert("mobile number is not valid");
                    register.mob.focus();
                    return false; 
                }
                else if (password == null || password == "") {
                alert("password field can't blank");
                register.p.focus();
                return false;
                }
                else if(password.length < minNumberofChars || password.length > maxNumberofChars){
                alert("password length should be between 6 to 15");
                register.p.focus();
                return false; 
                }
                else if (cpassword == null || cpassword == "") {
                alert("confirm password field can't blank");
                register.cp.focus();
                return false;
                }
                else if(!(password == cpassword)){
                alert("password dont match");
                register.cp.focus();
                return false;
                }
                else if (regexpic.test(pic) == false) {
                    alert("only jpg/jpeg/png images are acceptable for profile pic");
                    register.pic.focus();
                return false;
                }
                else if (regexprof.test(profile) == false) {
                    alert("only pdf files are acceptable profile document");
                    register.profile.focus();
                return false;
                }
                document.getElementById('register').submit();
               
                

        }

    </script>
    
    
    
</head>

<body>

<jsp:include page="header.jsp"/>




        <!-- REGISTER SECTION -->
        
    
    <section class="c-all p-semi p-event">
        <div class="semi-inn">
            <div class="semi-com semi-left">
                <div class="all-title quote-title qu-new semi-text eve-reg-text">
                    <h2>Create an Account</h2>
                     <p>Don't have an account? Create your account.</p> 
                     <p>It's take less then a minutes</p>
                    <p >Join us for free!</p>
                    <p>.</p>
                    <p>.</p>
                   <div class="semi-deta eve-deta">
                    <ul>
                        <li><a href="https://en-gb.facebook.com/login/"><span><i class="fa fa-facebook"></i></span> Facebook</a>
                        </li>
                        <li><a href="https://accounts.google.com/ServiceLogin/signinchooser?service=mail&passive=true&rm=false&continue=https%3A%2F%2Fmail.google.com%2Fmail%2F%3Ftab%3Dwm1&scc=1&ltmpl=default&ltmplcache=2&emr=1&osid=1&flowName=GlifWebSignIn&flowEntry=ServiceLogin">
                         <span><i class="fa fa-google"></i></span> Google+</a>
                        </li>
                        <li><a href="https://twitter.com/login?lang=en"><span><i class="fa fa-twitter"></i></span> Twitter</a>
                        </li>
                    </ul>
                    </div>
                    
                    <p>.</p>
                    <p>.</p>
                    <a href="#" data-dismiss="modal" data-toggle="modal" data-target="#modal1">
                      <p class="help-line">Are you a already member ? Login  </p></a>
                </div>
            </div>
            <div class="semi-com semi-right">
                <div class="n-form-com semi-form">
                    <div class="col s12">
                    
                        <form method="post" action="signup" enctype="multipart/form-data" id="register" class="form-horizontal">
                            
                            <div class="form-group">
                                <div class="col-md-12">	
	 								<select id="desn" name="desn">
										<option>Student</option>
										<option>Teacher</option>
									</select>
								</div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12">
                                    <input type="text" id="reg" name="reg" class="form-control" placeholder="Registration Number" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12">
                                    <input type="text" id="name" name="name"  class="form-control" placeholder="User name" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12">
                                    <input type="email" id="eml" name="eml" class="form-control" placeholder="Email id" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12">
                                    <input type="number" id="mobl" name="mob"  class="form-control" maxlength="10"  max="9999999999" min="1000000000" placeholder="Mobile No." required>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12">
                                    <input type="password" id="p" name="p"  class="form-control" placeholder="Password" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12">
                                    <input type="password" id="cp" name="cp"  class="form-control" placeholder="Confirm Password" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12">	
	 					<select id="dept" name="dept" value=" Department ">
							<option>Biotechnology</option>
							<option>Chemical Engineering</option>
							<option>Civil Engineering</option>
							<option>Computer Science and Engineering</option>
							<option>Electrical Engineering</option>
							<option>Electronics and Communication Engineering</option>
							<option>Mechanical Engineering</option>
						</select>
								</div>
                            </div>
                            
                            <div class="form-group">
                                <div class="col-md-12" ><font color="white">Passport size photo:'only jpg/jpeg/png images are acceptable'</font>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12">
                                    <input type="file" id="pic" name="pic"  ACCEPT="image/jpg , image/jpeg , image/png" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12" ><font color="white">Profile:'only pdf files are acceptable'</font>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12">
                                    <input type="file" id="profile" name="profile"  ACCEPT="application/pdf"  required>
                                </div>
                            </div>
		                    <div class="form-group mar-bot-0">
                                <div class="col-md-12">
                                    <i class="waves-effect waves-light light-btn waves-input-wrapper" style=""/>
                                    <input type="button" value="Register" onclick="check()" class="waves-button-input"></i>
                                </div>
                            </div>
		                    <div class="form-group mar-bot-0">
                                <div class="col-md-12">
                                	<i class="waves-effect waves-light light-btn waves-input-wrapper" style="">
                                    <input type="reset" value="reset" class="waves-button-input"/></i>
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