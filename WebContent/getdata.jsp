
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
<title>Insert title here</title>
</head>


<body>

<form  action="getData" method="post">
	
	select the domain:<select id="domain" name="domain">
	</select>
	
	<br>select the type of material:<select id="types" name="types">
	</select>
	
	<br>select the teacher:<select id="teacher"  name="teacher" class="t" hidden="true">
	</select>
	
	<img alt="teacher image" src="" class="t" hidden="true" id="tid"/>
	
	
	<br> <input type="submit" value="submit" id="submit"></input> 
	<br> <input type="reset" value="reset" id="reset"></input> 
</form> 


                    <script type="text/javascript">
                        $(document).ready(function(){
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

                            var types = $('#types').val();
                            var domain = $('#domain').val();
                            
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
                    

</body>
</html>