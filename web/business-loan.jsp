<%-- 
    Document   : business-loan
    Created on : 13 Feb, 2018, 12:14:41 PM
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
        <title>Norton Finance | Business Loan</title>
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

        <div class="container-fluid BL-Banner">
            <div class="container">
                <div class="row">
                    <div class="col-md-5">
                        <br>
                        <font>
                        <h1 style="color: white; ">Business Loan</h1>
                        <h3>Business loan by Norton Finance</h3>
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
                <!-- col-md-4 -->
                <%@include file="leftmenu.jsp" %>

                <div class="col-md-8">
                    <div class="well">
                        <h2>Business Loan Features and Benefits</h2> <hr>
                        <span class="loaninformation">
                            With low interest rates and generously flexible repayment options, business loan by Norton Finance can give the much needed boost to your business, enhancing your competitiveness and profitability. Loan for business by Norton Finance gives a Flexi loan facility, enabling you to expand your business to new heights, upgrade your existing business to latest machineries and equipment, scale up the growth and much more, at minimal repaying options.
                            <br><br>
                            <div class="media">
                                <div class="media-left">
                                    <a href="#">
                                        <img class="media-object" src="images/svg/Flexi loan.svg" alt="..." height="64" width="64">
                                    </a>
                                </div>
                                <div class="media-body">
                                    <h4 class="media-heading">Flexi Loan Facility</h4>
                                    Business loan allows you to avail Flexi loan facility. This is a unique facility given to our loan applicants, wherein you are approved for certain loan limit, for a said duration. You can choose to pay only interest amount as EMI and repay the principal amount at the end of the tenor of the facility. Hence, it acts as a big saving arm to your cash flow.
                                </div>
                            </div>
                            <br>
                            <div class="media">
                                <div class="media-left">
                                    <a href="#">
                                        <img class="media-object" src="images/svg/lOAN uP TO.svg" alt="..." height="64" width="64">
                                    </a>
                                </div>
                                <div class="media-body">
                                    <h4 class="media-heading">Loans up to Rs.30 Lakh</h4>
                                    Whether your business has needs for short-term loans, intermediate-term loans or long-term loans, Bajaj Finserv offers business loans up to Rs.30 lakhs. You can use the loan amount to invest in infrastructure, expand operations, buy equipment or inventory, or even to increase working capital.
                                </div>
                            </div>
                            <br>
                            <div class="media">
                                <div class="media-left">
                                    <a href="#">
                                        <img class="media-object" src="images/svg/Flexi loan.svg" alt="..." width="64" height="64">
                                    </a>
                                </div>
                                <div class="media-body">
                                    <h4 class="media-heading">Flexi Loans</h4>
                                    These loans from Norton Finance help you get a loan amount that is higher than what you are eligible for What is more, you have an option to pay the interest component only on the amount you’re borrowing. Because you are only paying the interest, your monthly installments are lower than they’d be with a standard business loan.
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
                            <br><br><br>
                            <p>
                                Advantages for SMEs: Whether you are expanding into a new vertical or growing your existing business, you can avail of a small business loan for finance. In today’s fluxing economic climate, nearly any enterprise can see immediate growth as long as they use the business loan wisely.
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