
<%

System.out.println("session:admin:id: " + session.getAttribute("id"));


if(session.getAttribute("id")==null)
{
	String s="you have logged out";
	System.out.println(s);
	response.sendRedirect("index.jsp?msg=" + s);
	
}
else
{
	System.out.println("valid session");

%>

<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Profile</title>

<script type="text/javascript">
	function check()
	{

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
        var profile = document.getElementById('pf').value.trim();
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
                            	System.out.println("from profile....." + s);
                            	
                            	if(s!=null){
                            %>
                    <script>
                    alert("<%=s%>");
                    </script>

                    <% } %>


		<jsp:include page="sheader.jsp"/>
		

                <div class="col-md-9">
                    <div class="udb">

                        <div class="udb-sec udb-prof">
                            <h4><img src="images/icon/db1.png" alt="" />Profile</h4>
                            <div class="sdb-tabl-com sdb-pro-table">
                                <table class="responsive-table bordered">
                                    <tbody>
                                        <tr>
                                            <td>Student Name</td>
                                            <td>:</td>
                                            <td><%=session.getAttribute("name")%></td>
                                        </tr>
                                        <tr>
                                            <td>Student Id</td>
                                            <td>:</td>
                                            <td><%=session.getAttribute("id")%></td>
                                        </tr>
                                        <tr>
                                            <td>Eamil</td>
                                            <td>:</td>
                                            <td><%=session.getAttribute("email")%></td>
                                        </tr>
                                        <tr>
                                            <td>Department</td>
                                            <td>:</td>
                                            <td><%=session.getAttribute("dept")%></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                                        
                                        
                                        
                        <div class="udb-sec udb-prof">
                            <h4><i class="fa fa-pencil"></i>Edit Mobile no. and/or Password</h4>
                            <div class="sdb-tabl-com sdb-pro-table">
                                <table class="responsive-table bordered">
                                    <tbody>
                                        <form method="post" action="changeprofile" id="change">
                                        <tr>
                                            <td>Mobile no.</td>
                                            <td>:</td>
                                            <td><input id="phone" name="phone" type="number" value="<%=session.getAttribute("mobile") %>" maxlength="10" required></td>
                                        </tr>
                                        <tr>
                                            <td>New Password</td>
                                            <td>:</td>
                                            <td><input id="pass" name="pass" type="password" value="<%=session.getAttribute("pass") %>" required></td>
                                        </tr>
                                        <tr>
                                        	<td colspan="3"><input type="button" class="waves-button-input" value="Edit My Profile  " onclick="check()"></input>
                                        	</td>
                                        </tr>
                                    </form>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        
                        <div class="udb-sec udb-prof">
                            <h4><i class="fa fa-picture-o"></i>Change your picture</h4>
                            <div class="sdb-tabl-com sdb-pro-table">
                                <table class="responsive-table bordered">
                                    <tbody>
                                	 <form  id="picup" method="post" enctype="multipart/form-data" action="picupload">
                                        <tr>
                                            <td>Passport size photo:'only jpg/jpeg/png images are acceptable'</td>
                                            <td>:</td>
                                            <td><input type="file" id="pic" name="pic"  ACCEPT="image/jpg , image/jpeg , image/png" required> 
                                           </tr>
                                        <tr>
                                        <tr>
                                        	<td colspan="3"><input type="button" class="waves-button-input" value="Upload  " onclick="ppic()"/></input>
                                        	</td>
                                        </tr>
                                    </form>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        
                        <div class="udb-sec udb-prof">
                            <h4><i class="fa fa-book"></i>Change your resume</h4>
                            <div class="sdb-tabl-com sdb-pro-table">
                                <table class="responsive-table bordered">
                                    <tbody>
                                	 <form  id="resup" method="post" enctype="multipart/form-data" action="resupload">
                                        <tr>
                                            <td>Profile:'only pdf files are acceptable'</td>
                                            <td>:</td>
                                            <td> <input type="file" id="pf" name="profile"  ACCEPT="application/pdf"  required>
                                            </tr>
                                        <tr>
                                        	<td colspan="3"><input type="button" class="waves-button-input" value="Upload  " onclick="pres()"/></input>
                                        	</td>
                                        </tr>
                                    </form>
                                    </tbody>
                                </table>
                            </div>
                        </div>
    
                                			
                        
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--SECTION END-->


</body>
</html>
<%
}
%>