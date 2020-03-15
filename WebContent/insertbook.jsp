
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert Book</title>
</head>


<body>

    <br>
    <br>

<center><h3 align="center">INSERT BOOK FORM</h3>
<form  action="insertBook" method="post" enctype="multipart/form-data">
	<table   cellpadding=10 cellspacing=10><caption ></caption>
		<tr>
			<td>select the domain:</td>
			<td><select id="domain" name="domain"></select></td>
		</tr>
		<tr>
			<td>enter the name of book along with the extension:</td>
			<td><input type="text" name="name" placeholder="e.g.: ncert.pdf"/></td>
		</tr>
		<tr>
			<td>enter the ISBN no:</td>
			<td><input type="number" name="isbn"/></td>
		</tr>
		<tr>
			<td>File:</td>
			<td><input type="file" id="file" name="file" placeholder="only pdf/html/docx files are acceptable"  ACCEPT="application/pdf , application/html , application/docx"/></td>
		</tr>
		<tr>
			<th><input type="submit" value="submit" id="submit"></input> </th>
			<th><input type="reset" value="reset" id="reset"></input> </th>
		</tr>
	
	</table>
</form> 
</center>

                    <script type="text/javascript">
                        $(document).ready(function(){
                            var doamin = $('#doamin').val();
                            
                            $.ajax({
                                request: 'ajax',
                                method: "POST",
                                url: "getDomain.jsp",
                                success: function(msg) {
                                    
                                        $('#domain').html(msg);
                                    
                                },
                                error: function(msg) {
                                    alert(msg);
                                }
                            });
                            
                        });
                      </script>  

</body>
</html>