
<%@page import="org.apache.log4j.Logger" %>
<%final Logger log = Logger.getLogger("admin.jsp");

log.info("session:teacher:id: " + session.getAttribute("id"));


if(session.getAttribute("id")==null)
{
	String s="you have logged out";
	log.info(s);
	response.sendRedirect("index.jsp?msg=" + s);
	
}
else
{
	log.info("valid session");

%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="experiments.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile Setting</title>

<script type="text/javascript">
	function check()
	{
		//alert("hi");
        var minNumberofChars = 6;
        var maxNumberofChars = 15;
        
        var cpassword = document.getElementById('pass').value.trim();
        var mobile = document.getElementById('phone').value.trim();


            var regexm = /^\d{10}$/;

            
            if (cpassword == null || cpassword == "") {
            alert("confirm password field can't blank");
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
            document.getElementById('change').submit();
           
	}


	function ppic()
	{
		//alert("hi");
        var pic = document.getElementById('pic').value.trim();
            var regexpic = /.(jpg|jpeg|png)$/;

        if (regexpic.test(pic) == false) {
            alert("only jpg/jpeg/png images are acceptable for profile pic");
            register.pic.focus();
        return false;
        }
        document.getElementById('picup').submit();
       
	}

	function pres()
	{
		//alert("hi");
        var profile = document.getElementById('pro').value;
        var regexprof = /.pdf$/;

        if (regexprof.test(profile) == false) {
            alert("only pdf files are acceptable profile document");
            register.profile.focus();
        return false;
        }
        document.getElementById('resup').submit();
       
	}
</script>

</head>

<body>


                            <% String s=(String)request.getParameter("msg");
                            	log.info("from profile....." + s);
                            	
                            	if(s!=null){
                            %>
                    <script>
                    alert("<%=s%>");
                    </script>

                    <% } %>
                    
<jsp:include page="teachheader.jsp"/>


	

            <!--== BODY INNER CONTAINER ==-->
            <div class="sb2-2">
                <!--== breadcrumbs ==-->
                
                <!--== DASHBOARD INFO ==-->
                <%

            	AllMethods am=new AllMethods();
                int c=0;
                %>
                
                <!--== User Details ==-->
                <div class="sb2-2-3">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="box-inn-sp admin-form">
				<div class="sb2-2-add-blog sb2-2-1">
                    <h2>Profile Settings</h2>

                    <ul class="nav nav-tabs tab-list">
                        <li class="active"><a data-toggle="tab" href="#home" aria-expanded="true"><i class="fa fa-pencil" aria-hidden="true"></i> <span>Basic Information</span></a>
                        </li>
                        <li class=""><a data-toggle="tab" href="#menu2" aria-expanded="false"><i class="fa fa-picture-o" aria-hidden="true"></i> <span>Profile Picture</span></a>
                        </li>
                        <li class=""><a data-toggle="tab" href="#menu3" aria-expanded="false"><i class="fa fa-book" aria-hidden="true"></i> <span>Resume/CV</span></a>
                        </li>
                    </ul>








                    <div class="tab-content">
                        <div id="home" class="tab-pane fade active in">
                            <div class="box-inn-sp">
                                <div class="inn-title">
                                    <h4>Edit Mobile no. and Password</h4>
                                </div>
                                <div class="bor">
                                   <form method="post" action="changeprofile" id="change">
                                        <div class="row">
                                            <div class="input-field col s6">
                                                Name: <input type="text" name="name" value="<%=session.getAttribute("name")%>" class="validate" disabled="disabled" required>
                                                <input type="text" name="id" value="<%=session.getAttribute("id")%>" class="validate" hidden="true" >
                                               
                                            </div>
                                            <div class="input-field col s6">
                                                Email: <input type="text" name="email" class="validate" value="<%=session.getAttribute("email") %>" disabled="disabled" required>
                                                
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="input-field col s6">
                                                Mobile no.: <input id="phone" name="phone" type="number" value="<%=session.getAttribute("mobile") %>" class="validate" maxlength="10" required>
                                            </div>
                                            <div class="input-field col s6">
                                                New Password: <input id="pass" name="pass" type="password" value="<%=session.getAttribute("pass") %>" class="validate">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="input-field col s12">
                                                <i class="waves-effect waves-light btn-large waves-input-wrapper" style=""><input type="button" class="waves-button-input" value="Edit My Profile  " onclick="check()"></input></i>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        
                        
                        
                        
                        <div id="menu2" class="tab-pane fade">
                            <div class="inn-title">
                                <h4>Change your picture</h4>
                            </div>
                            <div class="bor ad-cou-deta-h4">
                                	 <form  id="picup" method="post" enctype="multipart/form-data" action="picupload">
                                        <div class="row">
                                            <div class="input-field col s6">
                                                Passport size photo:'only jpg/jpeg/png images are acceptable'
                                            </div>
                                            <div class="input-field col s6">
	                                  			<input type="file" id="pic" name="pic"  ACCEPT="image/jpg , image/jpeg , image/png" required> 
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="input-field col s12">     
                                            	<i class="waves-effect waves-light btn-large waves-input-wrapper" style=""><input type="button" class="waves-button-input" value="Upload  " onclick="ppic()"/></i>
                                			</div>
                                        </div>
                                	</form>
                                	</div>
                        </div>
                        
                        <div id="menu3" class="tab-pane fade">
                            <div class="inn-title">
                                <h4>Change your resume/cv</h4>
                            </div>
                            
                            <div class="bor ad-cou-deta-h4">
                                	 <form  id="resup" method="post" enctype="multipart/form-data" action="resupload">
                                        <div class="row">
                                            <div class="input-field col s6">
                                                Profile:'only pdf files are acceptable'
                                            </div>
                                            <div class="input-field col s6">
                                    <input type="file" id="pro" name="profile"  ACCEPT="application/pdf"  required>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="input-field col s12">     
                                            	<input type="button" value="Upload  " onclick="pres()"/>
                                			</div>
                                        </div>
                                	</form>
                             </div>
                        </div>
                        
                        
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
            </div>
            
            
            
            
            
            
            
            
            
            
            
</body>


</html>
<%
}
%>