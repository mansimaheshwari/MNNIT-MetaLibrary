<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>


    <script type="text/javascript">
        function check() {
            var minNumberofChars = 6;
            var maxNumberofChars = 15;
            var d = document.getElementById('desn');
            var designation=d.options[d.selectedIndex].text;

            var reg = document.getElementById('reg').value.trim();
            var fname = document.getElementById('name').value.trim();
            var email = document.getElementById('eml').value.trim();
            var password = document.getElementById('p').value.trim();
            var cpassword = document.getElementById('cp').value.trim();
            var mobile = document.getElementById('mob').value.trim();
            
            var pic = document.getElementById('pic').value.trim();
            var profile = document.getElementById('profile').value.trim();
                var regex = /^[a-zA-Z ]*$/;
                var regexm = /^\d{10}$/;

                var regexs = /^\d{4}\w{2}\d{2}$/;
                var regext = /^\d{4}[a-zA-Z]{4}$/;
                var regexmail = /@mnnit.ac.in$/;
                
                var regexpic = /.(jpg|jpeg|png)$/;
                var regexprof = /.pdf$/;

                alert("hi");
                
                
                if (designation == "Teacher" && regext.test(reg) == false) {
                    alert("enter valid teacher registration no.");
                signupform.reg.focus();
                return false;
                }
                else if (designation == "Student" &&  regexs.test(reg) == false ) {
                    alert("enter valid student registration no.");
                    signupform.reg.focus();
                    return false;
                    }
                else if (fname == null || fname == "") {
                alert("username field can't blank");
                signupform.name.focus();
                return false;
                }
                else if(regex.test(fname) == false){
                alert("Name must be in alphabets only");
                signupform.name.focus();
                return false;
                }
                else if (email == null || email == "") {
                alert("email field can't blank...");
                signupform.eml.focus();
                return false;
                }
                else if(designation == "Teacher" && regexmail.test(email) == false){
                    alert("teachers have to use mnnit email id");
                    signupform.eml.focus();
                    return false;
                        
                    }
                else if (password == null || password == "") {
                alert("password field can't blank");
                signupform.p.focus();
                return false;
                }
                else if(password.length < minNumberofChars || password.length > maxNumberofChars){
                alert("password length should be between 6 to 15");
                signupform.p.focus();
                return false; 
                }
                else if (cpassword == null || cpassword == "") {
                alert("confirm password field can't blank");
                signupform.cp.focus();
                return false;
                }
                else if(!(password == cpassword)){
                alert("password dont match");
                signupform.cp.focus();
                return false;
                }
                else if(mobile.length == 0){
                        alert("mobile number cant be null");
                        signupform.mob.focus();
                        return false; 
                    }
                else if(mobile.length != 10 || regexm.test(mobile) == false){
                        alert("mobile number is not valid");
                        signupform.mob.focus();
                        return false; 
                    }
                else if (regexpic.test(pic) == false) {
                    alert("only jpg/jpeg/png images are acceptable for profile pic");
                signupform.pic.focus();
                return false;
                }
                else if (regexprof.test(profile) == false) {
                    alert("only pdf files are acceptable profile document");
                signupform.profile.focus();
                return false;
                }
                document.getElementById('register').submit();
               
                

        }

    </script>
    
    
    
</head>
<body>


<jsp:include page="header.jsp"/>




<section>
        <!-- REGISTER SECTION -->
        
        
                    <h4>Create an Account</h4>
                    <p>Don't have an account? Create your account. It's take less then a minutes</p>
                    <form method="post" action="signup" enctype="multipart/form-data" id="register" class="s12">
                        
                        <div class="s12">
	 						<label>I am:</label>	
	 						<select id="desn" name="desn">
								<option>Student</option>
								<option>Teacher</option>
							</select>
                        </div>
                        <div>
                            <div class="input-field s12">
                                <input type="text" id="reg" name="reg" class="validate" required>
                                <label>Registration Number</label>
                            </div>
                        </div>
                        <div>
                            <div class="input-field s12">
                                <input type="text" id="name" name="name" data-ng-model="name1" class="validate" required>
                                <label>User name</label>
                            </div>
                        </div>
                        <div>
                            <div class="input-field s12">
                                <input type="email" class="validate" id="eml" name="eml" required>
                                <label>Email id</label>
                            </div>
                        </div>
                        <div>
                            <div class="input-field s12">
                                <input type="password" class="validate" id="p" name="p" required>
                                <label>Password</label>
                            </div>
                        </div>
                        <div>
                            <div class="input-field s12">
                                <input type="password" class="validate" id="cp" name="cp" required>
                                <label>Confirm password</label>
                            </div>
                        </div>
                        <div>
                            <div class="input-field s12">
                                <input type="number" id="mob" name="mob" required class="validate">
                                <label>Mobile No.</label>
                            </div>
                        </div>
                        
                        <div>
                        <div class="s12">
	 					<label>Department:</label>	
	 					<select id="dept" name="dept">
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
                    
                        <div>
                            Passport size photo: <b>"only jpg/jpeg/png images are acceptable"</b><input type="file" id="pic" name="pic"  ACCEPT="image/jpg , image/jpeg , image/png" required>
                        </div>
                        
                        <div>
                        	Profile:  <b>"only pdf files are acceptable"</b><input type="file" id="profile" name="profile"  ACCEPT="application/pdf" required>
                       </div>
                       
                        <div>
                                <input type="button" value="Register" onclick="check()" class="waves-effect waves-light log-in-btn">
                        		<input type="reset" value="reset" class="waves-effect waves-light log-in-btn"/>
                        </div>
                        <div>
                            <div class="input-field s12"> <a href="#" data-dismiss="modal" data-toggle="modal" data-target="#modal1"><font color="blue">Are you a already member ? Login</font> </a> </div>
                        </div>
                    </form>



<p><script>${msg}</script></p>


</section>


<jsp:include page="footer.jsp"/>


</body>
</html>