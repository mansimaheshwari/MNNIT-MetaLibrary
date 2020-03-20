<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Add</title>

    <script type="text/javascript">
        function check() {
        	
            var dept = document.getElementById('dept').value.trim();


            var regex = /^[a-zA-Z ]*$/;
                

                alert("hi");
                           
                if (dept == null || dept == "") {
                alert("Department name can't blank");
                adddept.dept.focus();
                return false;
                }
                else if(regex.test(dept) == false){
                alert("Department name must be in alphabets only");
                signupform.name.focus();
                return false;
                }
                document.getElementById('adddept').submit();
               
                

        }

    </script>
<script></script>
                    
</head>
<body>

<jsp:include page="adminheader.jsp"/>

               
            <div class="sb2-2">
            	 <!--== User Details ==-->
                <div class="sb2-2-3">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="box-inn-sp admin-form">
				<div class="sb2-2-add-blog sb2-2-1">
                    <h2>Add New Department</h2>
                    
                    <div class="tab-content">
                        <div id="home" class="tab-pane fade active in">
                            <div class="box-inn-sp">
                                <div class="bor">
                                    <form method="post" action="addDept" id="adddept">
                                        <div class="row">
                                            <div class="input-field col s12">
                                                <input id="dept" type="text" name="dept" required>
                                                <label for="dept" class="">Department Name</label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="input-field col s12">
                                                <i class="waves-effect waves-light btn-large waves-input-wrapper" style=""><input type="button" class="waves-button-input" value="Submit" onclick="check()"></i>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        
                            </div>
                        </div>
                    </div>
                </div>
            </div>
         </div>
       </div>
       
            

</body>
</html>