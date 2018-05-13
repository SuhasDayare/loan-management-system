<%-- 
    Document   : home-loan
    Created on : 13 Feb, 2018, 12:07:18 PM
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
        <title>Norton Finance | Home Loan</title>
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
        
        <div class="container-fluid HL-Banner">
            <div class="container">
                <div class="row">
                    <div class="col-md-5">
                        <br>
                        <font>
                        <h1 style="color: white; ">Home Loan</h1>
                        <h3>Home loan by Norton Finance</h3>
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
                <!-- col-md-4 --> <%@include file="leftmenu.jsp" %>

                <div class="col-md-8">
                    <div class="well">
                        <h2>Home Loan - Features and Benefits</h2> <hr>
                        <span class="loaninformation">
                            Home Loan from Norton Finance is convenient and affordable option to suit your financial needs. Our Home Loans are designed to fulfil all your mortgage 
                            financing requirements, from buying your first home to constructing a new house, purchasing a plot/ land. Our home loans 
                            cater to all salaried, self-employed and professional individuals.<br>
                            Get a Home Loan - Features and Benefits housing loan of up to Rs. 50 Lacs at an attractive interest rate, 
                            door-step services Home Loan - Features and Benefits and much more. Apply for Home Loan online and get instant approval.
                            <br><br>

                            <div class="media">
                                <div class="media-left">
                                    <a href="#">
                                        <img class="media-object" src="images/svg/Flexi loan.svg" alt="..." height="64" width="64">
                                    </a>
                                </div>
                                <div class="media-body">
                                    <h4 class="media-heading">Flexi Loan Facility</h4>
                                    Pay interest only on the loan amount you have utilised, and thus save on EMIs. Pre-pay funds that you have borrowed without any charge, and re-avail these funds without additional documentation
                                </div>
                            </div>
                            <br>
                            <div class="media">
                                <div class="media-left">
                                    <a href="#">
                                        <img class="media-object" src="images/svg/Property Dos.svg" alt="..." height="64" width="64">
                                    </a>
                                </div>
                                <div class="media-body">
                                    <h4 class="media-heading">Property Dossier</h4>
                                    A customized report to guide you through all the legal and financial aspects of being a property owner. Click here to know more.
                                </div>
                            </div>
                            <br>
                            <div class="media">
                                <div class="media-left">
                                    <a href="#">
                                        <img class="media-object" src="images/svg/Foreclosure-01.svg" alt="..." width="64" height="64">
                                    </a>
                                </div>
                                <div class="media-body">
                                    <h4 class="media-heading">Part-prepayment and Foreclosure Facility</h4>
                                    No charges on part-prepayment or foreclosure of your Home Loan, to make the loan easy on your pocket
                                </div>
                            </div>
                            <br>
                            <div class="media">
                                <div class="media-left">
                                    <a href="#">
                                        <img class="media-object" src="images/svg/Tenure.svg" alt="..." width="64" height="64">
                                    </a>
                                </div>
                                <div class="media-body">
                                    <h4 class="media-heading">Flexible Tenor</h4>
                                    Flexible tenors ranging up to 25 years, to fit your repayment capacity
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
                                    Easy Home Loan eligibility criteria and minimal documentation, to help you get your loan faster
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
                                    Online management of your Home Loan , for your convenience
                                </div>
                            </div>
                            <br><br>
                            <p>
                                With attractive Home Loan interest rates and a host of benefits to suit your Finances, Norton Finance Home Loans are designed to help you get your dream home without hassle. Get the benefits of an easy balance transfer, a high-value top-up loan. Apply for a Home Loan from Norton Finance today.
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