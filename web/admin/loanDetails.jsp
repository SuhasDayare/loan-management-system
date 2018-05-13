<%-- 
    Document   : loanDetails
    Created on : 4 Mar, 2018, 10:51:37 AM
    Author     : Suhas
--%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
    response.setHeader("Pragma", "no-cache");   //HTTP 1.0
    response.setHeader("Expires", "0"); //Proxies

    if (session.getAttribute("adminname") == null) {
        response.sendRedirect("../index.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Norton Finance | Customer Details</title>
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <link href="../css/admin-style.css" rel="stylesheet">

        <script>
            function getDetails(str)
            {
                if (str == "")
                {
                    document.getElementById("loanDetails").innerHTML = "";
                    return;
                }
                if (window.XMLHttpRequest)
                {// code for IE7+, Firefox, Chrome, Opera, Safari
                    xmlhttp = new XMLHttpRequest();
                } else
                {// code for IE6, IE5
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                xmlhttp.onreadystatechange = function ()
                {
                    if (this.readyState == 4 && this.status == 200)
                    {
                        document.getElementById("loanDetails").innerHTML = this.responseText;
                    }
                }
                xmlhttp.open("GET", "getLoanDetails.jsp?type=" + str, true);
                xmlhttp.send();
            }
        </script>
    </head>
    <body>
        <!-- Menu --><%@include file="adminMenu.jsp" %>

        <section id="main">
            <div class="container">
                <div class="row">
                    <!-- Left menu --><%@include file="leftMenu.jsp" %>

                    <div class="col-md-9">
                        <div class="well">
                            
                            <h1>Loans Available</h1><br>
                            <form class="form-horizontal">
                                <div class="form-group">
                                    <label for="loanType" class="col-sm-2 control-label">Loan Type</label>
                                    <div class="col-sm-10">
                                        <select class="form-control" id="loanType" name="customers" onchange="getDetails(this.value)" required>
                                            <option value="">Select a loan type:</option>
                                            <option value="Home Loan">Home Loan</option>
                                            <option value="Personal Loan">Personal Loan</option>
                                            <option value="Vehicle Loan">Vehicle Loan</option>
                                            <option value="Business Loan">Business Loan</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div id="loanDetails" class="col-sm-10 col-sm-offset-2">
                                    </div>
                                </div>
                            </form>

                            <h1>Add Loan</h1>
                            <form class="form-horizontal" action="../LoanDetailsUpdate" method="GET">
                                <div class="form-group">
                                    <label for="loanType" class="col-sm-2 control-label">Loan Type</label>
                                    <div class="col-sm-10">
                                        <select class="form-control" id="loanType" name="loanName" required>
                                            <option value="Home Loan">Home Loan</option>
                                            <option value="Personal Loan">Personal Loan</option>
                                            <option value="Vehicle Loan">Vehicle Loan</option>
                                            <option value="Business Loan">Business Loan</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="tenure" class="col-sm-2 control-label">Tenure</label>
                                    <div class="col-sm-10">
                                        <input type="number" class="form-control" id="tenure" name="tenure" placeholder="Enter tenure in years...">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="rate" class="col-sm-2 control-label">Interest Rate</label>
                                    <div class="col-sm-10">
                                        <input type="number" class="form-control" id="rate" name="rate" placeholder="Enter interest rate..." required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button type="submit" class="btn btn-default">Add Loan</button>
                                    </div>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </section>

        <footer id="footer">
            <p>Norton Finance Copyright All Right Reserved &copy; 2018</p>
        </footer>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>
    </body>
</html>