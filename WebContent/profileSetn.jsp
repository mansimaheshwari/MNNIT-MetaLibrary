
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile Setting</title>

<script type="text/javascript">
	function check()
	{

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
</script>
</head>

<body>
<jsp:include page="adminheader.jsp"/>


	<%
	ResultSet rs=(ResultSet)session.getAttribute("details");
	%>
	
            <!--== BODY INNER CONTAINER ==-->
            <div class="sb2-2">

                <!--== User Details ==-->
                <div class="sb2-2-3">
                    <div class="row">
                        <div class="col-md-12">
						<div class="box-inn-sp admin-form">
                                <div class="inn-title">
                                    <h4>Edit Profile</h4>
                                    <p>.</p>
                                </div>
                                <div class="tab-inn">
                                   <form method="post" action="profileSetn" id="change">
                                        <div class="row">
                                            <div class="input-field col s6">
                                                Name: <input type="text" name="name" value="<%=rs.getString("aname")%>" class="validate" disabled="disabled" required>
                                                <input type="text" name="id" value="<%=rs.getString("aid")%>" class="validate" hidden="true" >
                                               
                                            </div>
                                            <div class="input-field col s6">
                                                Email: <input type="text" name="email" class="validate" value="<%=rs.getString("aemail") %>" disabled="disabled" required>
                                                
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="input-field col s6">
                                                Mobile no.: <input id="phone" name="phone" type="number" value="<%=rs.getString("amobile") %>" class="validate" required>
                                            </div>
                                            <div class="input-field col s6">
                                                New Password: <input id="pass" name="pass" type="password" value="<%=rs.getString("apass") %>" class="validate">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="input-field col s12">
                                                <i class="waves-effect waves-light btn-large waves-input-wrapper" style=""><input type="button" class="waves-button-input" value="submit" onclick="check()"></input></i>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
</body>


</html>