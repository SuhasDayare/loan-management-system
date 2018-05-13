<%-- 
    Document   : vehicle-loan
    Created on : 13 Feb, 2018, 12:14:19 PM
    Author     : Suhas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>  
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Norton Finance | Vehicle Loan</title>
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/main-css.css" type="text/css">

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <!--Top Menu Bar --><%@include file="menu.jsp" %>

        <div class="container-fluid VL-Banner">
            <div class="container">
                <div class="row">
                    <div class="col-md-5">
                        <br>
                        <font>
                        <h1 style="color: white; ">Vehicle Loan</h1>
                        <h3>Vehicle loan by Norton Finance</h3>
                        <br><br>
                        </font>
                    </div>
                </div>
            </div>
        </div>
        <br>

        <div class="container">
            <div class="row">
                <!-- Left Menu Bar -->
                <!-- col-md-4 --><%@include file="leftmenu.jsp" %>

                <div class="col-md-8">
                    <div class="well">
                        <h2>Vehicle Loan Features and Benefits</h2> <hr>
                        <span class="loaninformation">
                            Need help with the purchase of your dream bike, come to us. Norton Finance is one of the most diversified NBFCs having served more than 1.7 million customers across India, also offering two and three wheeler finance at showrooms and other service stations across the country.<br><br>
                            Product Portfolio - Norton Finance is India’s most diversified NBFC. Our entire portfolio is designed to enable you to take control of your aspirations, which could be as varied as improving your lifestyle, buying a new motorcycle or household goods, or indulging in that much deserved family holiday. Whatever be your plan, we have the capability to support it.<br><br>
                            The Vehicle Finance division, has served more than 30 lakh customers across India. We offer our customers vehicle loans for the purchase of their favourite Motorcycles among all variants namely Pulsar, Avenger, Discover, Platina and the latest V besides KTM motorcycles. We also provide easy and attractive financing schemes for the wide range of three wheelers.
                            <br><br>
                            <div class="media">
                                <div class="media-left">
                                    <a href="#">
                                        <img class="media-object" src="images/svg/Transparent Process.svg" alt="..." height="64" width="64">
                                    </a>
                                </div>
                                <div class="media-body">
                                    <h4 class="media-heading">Transparent process</h4>
                                    Within 10 days of taking your loan, you will receive a Welcome call & an SMS that covers all the necessary details of your loan from loan amount, due dates, EMI amount, and contact details.
                                </div>
                            </div>
                            <br>
                            <div class="media">
                                <div class="media-left">
                                    <a href="#">
                                        <img class="media-object" src="images/svg/FriendlyCall.svg" alt="..." height="64" width="64">
                                    </a>
                                </div>
                                <div class="media-body">
                                    <h4 class="media-heading">Friendly call centre helpline with over 10 languages</h4>
                                    Our call centre allows you to interact with us in your preferred language enabling better and friendly communication.
                                </div>
                            </div>
                            <br>
                            <div class="media">
                                <div class="media-left">
                                    <a href="#">
                                        <img class="media-object" src="images/svg/Pay in Cash.svg" alt="..." width="64" height="64">
                                    </a>
                                </div>
                                <div class="media-body">
                                    <h4 class="media-heading">Easy pay-in-cash option</h4>
                                    For small towns, where customers prefer not to open bank accounts, we have the facility to collect loan repayment in cash.
                                </div>
                            </div>
                            <br>
                            <div class="media">
                                <div class="media-left">
                                    <a href="#">
                                        <img class="media-object" src="images/svg/Min Doc.svg" alt="..." width="64" height="64">
                                    </a>
                                </div>
                                <div class="media-body">
                                    <h4 class="media-heading">Minimal Documentation</h4>
                                    Hassle-free processes with easy to meet eligibility criteria, and minimal documentation
                                </div>
                            </div>
                            <br>
                            <div class="media">
                                <div class="media-left">
                                    <a href="#">
                                        <img class="media-object" src="images/svg/Online Account Mnagmnt.svg" alt="..." width="64" height="64">
                                    </a>
                                </div>
                                <div class="media-body">
                                    <h4 class="media-heading">Online Account Management</h4>
                                    Bank on-the-go with access to your loan account anytime, anywhere
                                </div>
                            </div>
                            <br>
                            <div class="media">
                                <div class="media-left">
                                    <a href="#">
                                        <img class="media-object" src="images/svg/No Hidden Terms.svg" alt="..." width="64" height="64">
                                    </a>
                                </div>
                                <div class="media-body">
                                    <h4 class="media-heading">No hidden charges </h4>
                                    Stay fully-informed about your loan with the Personal Loan Terms and Conditions
                                </div>
                            </div>
                            <br><br>
                            <p>
                                Our easy-to-use Personal Loan Eligibility calculator and Personal Loan EMI calculator help you manage your loan right from the application stage. Apply for a Bajaj Finserv Personal Loan today.
                            </p>
                            <%@include file="loandetails.jsp" %>
                        </span>
                        <a class="btn btn-default btn-block main-color" href="loanApplication.jsp">Apply</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <%@include file="footer.html" %>

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>