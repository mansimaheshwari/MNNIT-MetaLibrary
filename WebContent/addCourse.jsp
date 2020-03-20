
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert Repository</title>

<script>

	function check()
	{
		alert("hi");

        var fname = document.getElementById('name').value.trim();
        
            var regex = /^[a-zA-Z ]*$/;

            alert("hi");
            
            
            if (fname == null || fname == "") {
            alert("Subject name field can't blank");
            signupform.name.focus();
            return false;
            }
            else if(regex.test(fname) == false){
            alert("Subject name must be in alphabets only");
            signupform.name.focus();
            return false;
            }
        document.getElementById("ac").submit();
    }

</script>
</head>


<body>
<%
	session.setAttribute("details", (Object)request.getParameter("details"));
%>
<center>
<form id="ac" action="addCourse" method="post" >
	<table   cellpadding=10 cellspacing=10><caption ><h3 align="center">INSERT SUBJECT ACCORDING TO DEPARTMENT</h3></caption>
		
		<tr>
			<td>select the department:</td>
			<td><select id="department" name="department"></select></td>
		</tr>
		<tr>
			<td>enter the name of Subject</td>
			<td><input type="text" id="name" name="name"  required/></td>
		</tr>
		<tr>
			<th><input type="button" value="submit" onclick="check()"></input> </th>
			<th><input type="reset" value="reset" ></input> </th>
		</tr>
	
	</table>
</form> 


                    <script type="text/javascript">
                        $(document).ready(function(){
                            $.ajax({
                                request: 'ajax',
                                method: "POST",
                                url: "getDept.jsp",
                                success: function(msg) {
                                    
                                        $('#department').html(msg);
                                    
                                },
                                error: function(msg) {
                                    alert(msg);
                                }
                            });
                            
                        });
                    </script>
                    
</body>
</html>