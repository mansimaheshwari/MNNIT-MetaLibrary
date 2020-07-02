
<%@page import="org.apache.log4j.Logger" %>
<%final Logger log = Logger.getLogger("deleteDomain.jsp");


log.info("session:admin:id: " + session.getAttribute("id"));


if(session.getAttribute("id")==null)
{
	String msg="you have signed out";
	log.info(msg);
	response.sendRedirect("index.jsp?msg="+msg);
	
	
}
else
{
	log.info("valid session");

%>

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
<title>Delete Domain</title>

</head>


<body>


<center>
<form action="delete" method="post">
	<table   cellpadding=10 cellspacing=10><caption ><h3 align="center">DELETE DOMAIN FORM</h3></caption>
		
		<tr>
			<td>select the department:</td>
			<td><select id="department" name="department"></select></td>
		</tr>
		<tr>
			<td>select the domain:</td>
			<td><select id="domain" name="domain"></select></td>
		</tr>
		
	
		<tr>
			<th><input type="submit" value="delete" ></input> </th>
			<th><input type="hidden" name="desig" value="domain"/></th>
			<th><a href="admin.jsp">Done deletion</a></th>
		</tr>
	
	</table>
</form> 
	

                            <% String s=(String)request.getParameter("msg");
                            	log.info("from delete....." + s);
                            	
                            	if(s!=null){
                            %>
                    <script>
                    alert("<%=s%>");
                    </script>

                    <% } %>



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
</body>
</html>
<%}%>