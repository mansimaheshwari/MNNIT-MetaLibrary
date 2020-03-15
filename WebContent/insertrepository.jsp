
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
</head>


<body>


<% int c=1; %>
    <br>
    <br>

<center>
<form  action="insertrepository" method="post" enctype="multipart/form-data">
	<table   cellpadding=10 cellspacing=10><caption ><h3 align="center">INSERT REPORITORY FORM</h3></caption>
		<tr>
			<td>enter the name of material topic along with the extension:</td>
			<td><input type="text" name="name" placeholder="e.g.  ncert.pdf"/></select></td>
		</tr>
		<tr>
			<td>select the domain:</td>
			<td><select id="domain" name="domain"></select></td>
		</tr>
		<tr>
			<td>select the type of material:</td>
			<td><select id="types" name="types"></select></td>
		</tr>
			<td>File:</td>
			<td><input type="file" id="file" name="file" placeholder="only pdf/html/docx files are acceptable"  ACCEPT="application/pdf , application/html , application/docx"/></td>
		</tr>
	<!-- teacher id also from session -->
	<input type="hidden" name="tid" value="<%=1%>"/>
		<tr>
			<th><input type="submit" value="submit" id="submit"></input> </th>
			<th><input type="reset" value="reset" id="reset"></input> </th>
		</tr>
	
	</table>
</form> 
	
	<!-- teacher id also from session -->
	<input type="hidden" name="tid" value="<%=1%>"/>
	 

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
                        
                    <script type="text/javascript">
                    $(document).ready(function(){
                            $.ajax({
                                request: 'ajax',
                                method: "POST",
                                url: "getType.jsp",
                                success: function(msg) {
                                    
                                        $('#types').html(msg);
                                    
                                },
                                error: function(msg) {
                                    alert(msg);
                                }
                            });
                        });

                    </script>
                      

</body>
</html>