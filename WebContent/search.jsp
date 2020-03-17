
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
<title>Search</title>
</head>


<body>


<center><h3 align="center">SEARCH FOR REPOSITORY</h3>

<form  action="getData" method="post">
	<table   cellpadding=10 cellspacing=10>
		<tr>
			<td>select the department:</td>
			<td><select id="department" name="department"></select></td>
		</tr>
		<tr>
			<td>select the domain:</td>
			<td><select id="domain" name="domain"></select></td>
		</tr>
		<tr>
			<td>select the type of material:</td>
			<td><select id="types" name="types"></select></td>
		</tr>
		<tr class="t" hidden="true">
			<td>select the teacher:</td>
			<td><select id="teacher"  name="teacher" ></select></td>
		</tr>

		<tr class="t" hidden="true">
			<td id="timg"><td>
			<td><img src="data:image/jpg;base64,${img}" width="100" height="100"/></td>
		</tr>
		<tr>
			<td><input type="submit" value="submit" id="submit"></input></td> 
			<td><input type="reset" value="reset" id="reset"></input></td>
		</tr>
	</table>
</form> 
</center>

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
                    
                    <script type="text/javascript">
                    $('#department').click(function() {
                    	
                            var dept = $('#department').val();
                            
                            $.ajax({
                                request: 'ajax',
                                method: "POST",
                                url: "getDomain.jsp",
                                data: {
                                	dept:dept,
                                },
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
                                    
                                        $('#types').html('<option>books</option>'+msg);
                                    
                                },
                                error: function(msg) {
                                    alert(msg);
                                }
                            });
                        });

                    </script>
                    
                        
                    <script type="text/javascript">
                    
                        $('#types').change(function() {

                            var dept = $('#department').val();
                            var domain = $('#domain').val();
                            var types = $('#types').val();
                            
                            if(types=="books")
                        	{
                        		$('.t').hide();
                        	}
                        else{
                    		$('.t').show();
                            $.ajax({
                                request: 'ajax',
                                method: "POST",
                                url: "getTeacher.jsp",
                                data: {
                                	types:types,
                                	domain:domain,
                                	dept:dept,
                                },
                                success: function(msg) {
                                    
                                        $('#teacher').html(msg);
                                    
                                },
                                error: function(msg) {
                                    alert(msg);
                                }
                            });}
                        });
                        
                    </script>
                    
                    
                    <script type="text/javascript">
                    
                        $('#teacher').click(function() {

                            var tid = $('#teacher').val();
                            alert("teacher");
                            $.ajax({
                                request: 'ajax',
                                method: "POST",
                                url: "getTeacherImage.jsp",
                                data: {
									tid:tid,
                                },
                                success: function(img) {
										
                                	$('#timg').html(img);
                                    
                                },
                                error: function(img) {
                                    alert(img);
                                }
                            });}
                        });
                        
                    </script>
                    
                    

</body>
</html>