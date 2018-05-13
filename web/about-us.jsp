<%-- 
    Document   : about-us
    Created on : 13 Feb, 2018, 12:19:50 PM
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
        <title>Norton Finance | About Us</title>
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
        <!--Top Menu Bar -->
        <%@include file="menu.jsp" %>
        <br>
        <div class="container">
            <div class="well">
                <div class="row">
                    <div class="col-md-3" style="background-color: #332c6f; border-radius: 10px; margin-left: 25px; padding-top: 10px; padding-bottom: 8px;">
                        <img src="images/about-us.png" height="128" width="100%">
                    </div>
                    <div class="col-lg-9" style="padding-left: 50px; margin-left: -25px;">
                        <h1>About Norton Finance<br><small>Loans from Rs. 25000 to Rs. 50 Lacs over 1 to 25 years</small></h1>
                    </div>
                </div>
                <br><br>
                <div class="row">
                    <div class="col-md-6">
                        <h3>Simple, straight-forward money<br>
                            <small>At Norton we make arranging a loan or remortgage easy, even if you’re retired, self-employed or if you have bad credit history or CCJs. Because we’re a broker and not a bank, we’re not limited to our own products. Which means more choice and fewer rejections. So if you’ve been refused credit in the past, we want to help.</small>
                        </h3>
                    </div>
                    <div class="col-md-6">
                        <h3>Why compare, when we can do it all for you?<br>
                            <small>Just like a comparison site we search all of the top lenders to find the best possible secured loan or remortgage, tailored to your needs. But unlike them we’ll also help you manage your application from start to finish. So whether you need help managing your finances with a debt consolidation loan, a home improvement loan or with any big purchase, Norton are here for you. Piece of cake.</small>
                        </h3>
                    </div>
                </div>
                <h3>A responsible lender<br>
                    <small>At Norton Finance we are committed to treating our customers fairly and providing a friendly, flexible and professional service. We’ll keep the formalities to a minimum and work with you to ensure a speedy response to your loan application. Thank you.</small>
                </h3>
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