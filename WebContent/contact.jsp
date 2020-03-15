<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>

<body>


<jsp:include page="header.jsp"/>

    

    <!--SECTION START-->
    <section>
        <div class="container com-sp pad-bot-70">
            <div class="row">
                <div class="cor about-sp">
                    <div class="ed-about-tit">
                        <div class="con-title">
                            <h2>Contact <span> Us</span></h2>
                        </div>
                    </div>
                    <div class="pg-contact">

                        <div class="col-md-3 col-sm-6 col-xs-12 new-con new-con1"> <img src="img/contact/1.html" alt="">
                            <h4>Address</h4>
                            <p>MNNIT Allahabad, Teliar Ganj, Prayagraj, U.P.</p>
                        </div>
                        <div class="col-md-3 col-sm-6 col-xs-12 new-con new-con3"> <img src="img/contact/2.html" alt="">
                            <h4>CONTACT INFO:</h4>
                            <p> <a href="tel://0099999999" class="contact-icon">Phone: 0532 - 2545404/07, 2540233, 2545729</a>
                                <br> <a href="mailto:secretary@mnnit.ac.in" class="contact-icon">Email: secretary@mnnit.ac.in</a> </p>
                        </div>
                        <div class="col-md-3 col-sm-6 col-xs-12 new-con new-con4"> <img src="img/contact/3.html" alt="">
                            <h4>Website</h4>
                            <p> <a href="http://www.mnnit.ac.in">Website: http://www.mnnit.ac.in</a>
                                <br> <a href="https://www.facebook.com/MNNIT.Allahabad">Facebook: https://www.facebook.com/MNNIT.Allahabad</a>
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--SECTION END-->

    <section id="map">
        <div class="row contact-map">
            <!-- IFRAME: GET YOUR LOCATION FROM GOOGLE MAP -->
            <iframe src="https://www.google.com/maps/search/mnnit/@25.4944423,81.8618496,16z/data=!3m1!4b1"
                allowfullscreen=""></iframe>
        </div>
    </section>


<jsp:include page="footer.jsp"/>

    
   
</body>


</html>