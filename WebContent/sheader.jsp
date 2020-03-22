<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<head>
    <title>Student Profile</title>
    <!-- META TAGS -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- FAV ICON(BROWSER TAB ICON) -->
    <link rel="shortcut icon" href="images/fav.ico" type="image/x-icon">
    <!-- GOOGLE FONT -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700%7CJosefin+Sans:600,700" rel="stylesheet">
    <!-- FONTAWESOME ICONS -->
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <!-- ALL CSS FILES -->
    <link href="css/materialize.css" rel="stylesheet">
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <!-- RESPONSIVE.CSS ONLY FOR MOBILE AND TABLET VIEWS -->
    <link href="css/style-mob.css" rel="stylesheet" />
    
</head>

<body>

    <!--SECTION START-->
    <section>
        <div class="pro-cover">
        </div>
        <div class="pro-menu">
            <div class="container">
                <div class="col-md-9 col-md-offset-3">
                    <ul>
                        <!--  <li><a href="student.jsp" class="pro-act">My Dashboard</a></li>-->
                        <li><a href="student.jsp" ><i class="fa fa-bar-chart" aria-hidden="true">My Dashboard</i></a></li>
                        <li><a href="sprofile.jsp"><i class="fa fa-cogs" aria-hidden="true">Profile</i></a></li>
                        <li><a href="search.jsp"><i class="fa fa-book" aria-hidden="true">Search for Study Material</i></a></li>
                        <li><a href="index.jsp"><i class="fa fa-home" aria-hidden="true">Home</i></a></li>
                        <li><a href="logout.jsp"><i class="fa fa-sign-out" aria-hidden="true">Logout</i></a></li>
                    </ul>
                </div>
            </div>
        </div>
        
        
        <div class="stu-db">
            <div class="container pg-inn">
                <div class="col-md-3">
                    <div class="pro-user">
                        <img src="data:image/jpg;base64,${image}" alt="user">
                    </div>
                    <div class="pro-user-bio">
                        <ul>
                            <li>
                                <h4><%=session.getAttribute("name")%></h4>
                            </li>
                            <li>Student Id: <%=session.getAttribute("id")%></li>
                            <li><%=session.getAttribute("email")%></li>
                        </ul>
                    </div>
                </div>
                
                
    <!--Import jQuery before materialize.js-->
    <script src="js/main.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/materialize.min.js"></script>

</body>
</html>