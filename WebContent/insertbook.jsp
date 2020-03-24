
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


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert Book</title>



    <script type="text/javascript">
        function check() {


            var name = document.getElementById('name').value.trim();
            var isbn = document.getElementById('isbn').value.trim();
            var file = document.getElementById('file').value.trim();
            
                var regexisbn = /^\d{13}$/;
                var regexname = /.pdf$/;

                //alert("hi");
                
                
                if (regexisbn.test(isbn) == false) {
                    alert("enter a valid 13 digit isbn no.");
                return false;
                }
                else if (regexname.test(name) == false) {
                    alert("only pdf files are acceptable to rename as");
                return false;
                }
                else if (regexname.test(file) == false) {
                    alert("only pdf files are acceptable");
                return false;
                }
                document.getElementById('ib').submit();
               
                

        }

    </script>
    
</head>


<body>


                            <% String s=(String)request.getParameter("msg");
                            	System.out.println("from insert....." + s);
                            	
                            	if(s!=null){
                            %>
                    <script>
                    alert("<%=s%>");
                    </script>

                    <% } %>




    <br>
    <br>

<center><h3 align="center">INSERT BOOK FORM</h3>
<form id="ib" action="insertBook" method="post" enctype="multipart/form-data">
	<table   cellpadding=10 cellspacing=10><caption ></caption>
		
		<tr>
			<td>select the department:</td>
			<td><select id="department" name="department"></select></td>
		</tr>
		<tr>
			<td>select the domain:</td>
			<td><select id="domain" name="domain"></select></td>
		</tr>
		<tr>
			<td>enter the ISBN no:</td>
			<td><input type="number" name="isbn" id="isbn" maxlength="13" required/></td>
		</tr>
		<tr>
			<td>Rename as:</td>
			<td><input type="text" name="name" id="name" placeholder="e.g.: ncert.pdf" required/></td>
		</tr>
		<tr>
			<td>File:  <b>"only pdf files are acceptable"</b></td>
			<td><input type="file" id="file" name="file"  ACCEPT="application/pdf" required/></td>
		</tr>
		<tr>
			<th><input type="button" value="submit"  onclick="check()"></input> </th>
			<th><input type="reset" value="reset" ></input> </th>
		</tr>
		<tr>
		<tr>
			<th colspan="2" align="center"><a href="checkProfile.jsp">Done Adding Books</a>
			</th>
		</tr>
		</tr>
	
	</table>
</form> 



</center>

<script>
function back()
{
	window.history.back();	
}

</script>
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