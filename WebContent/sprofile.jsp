
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
                            <h4><img src="images/icon/db1.png" alt="" /> My Profile</h4>
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
                                        <form method="post" action="sprofileSetn" id="change">
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
                                        	<td colspan="3"><i class="fa fa-pencil"></i><input type="button" class="waves-button-input" value="Edit My Profile  " onclick="check()"></input>
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