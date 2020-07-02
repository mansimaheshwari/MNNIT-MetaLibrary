
<%@page import="org.apache.log4j.Logger"%>

<%final Logger log = Logger.getLogger("insertrepository.jsp");

log.info("invalid department selected");

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
    
<%@page import="java.sql.*" %>
<%@page import="experiments.*" %>
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
		//alert("hi");

        var type = document.getElementById('types').value;
        //alert(type);
        if(type=="videos")
        	{
        	var reg=/.(mp4|mkv|mov|avi|wmv)/
        	}
        else
        	{
        	var reg=/.(pdf|log|docx|ppt|txt)/
        	}
        
        var name = document.getElementById('name').value.trim();
        var i=name.lastIndexOf(".");
        var ext=name.substring(i);
        //alert(ext);

        var file = document.getElementById('file').value.trim();
        var ind=file.lastIndexOf(".");
        var e=file.substring(ind);
        //alert(e);
        if(reg.test(file) == false){
            alert("use proper format");
            return false;
            }
        if (name == null || name == "") {
            alert("name can't blank");
            return false;
		}
        else if(e!=ext)
        	{
            alert("use same extension for file names");
            return false;
        		
        	}
        document.getElementById("irepo").submit();
    }

</script>
</head>


<body>


<%!Object p;%>
<% p=request.getAttribute("msg");
   String s=(String)p;
        	
   if(s!=null){
%>
<script>
alert("${msg}");
</script>
<% } %>



                            <% String str=(String)request.getParameter("msg");
                            	log.info("from profile....." + str);
                            	
                            	if(str!=null){
                            %>
                    <script>
                    alert("<%=str%>");
                    </script>

                    <% } %>



<% String c=(String)session.getAttribute("id"); %>
    <br>
    <br>

<center>
<form id="irepo" action="insertrepository" method="post" enctype="multipart/form-data">
	<table   cellpadding=10 cellspacing=10><caption ><h3 align="center">INSERT REPORITORY FORM</h3></caption>
		
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
		<tr>
			<td>enter the name of material topic along with the extension:</td>
			<td><input type="text" id="name" name="name" placeholder="e.g.  ncert.pdf" required/></select></td>
		</tr>
		<tr>
			<td>File:</td>
			<td><input type="file" id="file" name="file" required></td>
		</tr>
	<!-- teacher id also from session -->
	<input type="hidden" name="tid" value="<%=c%>"/>
		<tr>
			<th><input type="button" value="submit" onclick="check()"></input> </th>
			<th><input type="reset" value="reset" ></input> </th>
		</tr>
		<tr>
			<th colspan="2" align="center"><a href="checkProfile.jsp">Done Adding Material</a>
			</th>
		</tr>
	
	</table>
</form> 
	



	<!-- teacher id also from session -->
	<input type="hidden" name="tid" value="<%=c%>"/>
	 


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
                                    
                                        $('#types').html(msg);
                                    
                                },
                                error: function(msg) {
                                    alert(msg);
                                }
                            });
                        });

                    </script>
                    
                    
                       
                    <script type="text/javascript">
                    
                    $('#types').change(function() {
                    	
                            var t = $('#types').val();
    if(t=="videos")
    	{
    	alert("allowed types are : mp4, mkv, mov, avi, wmv");
    	}
    else
    	{
    	alert("allowed types are : pdf, docx, ppt, log, txt");
    	}
                        });
                    </script>
</body>
</html>
<%}%>