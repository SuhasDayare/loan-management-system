<%-- 
    Document   : customerDetails
    Created on : 4 Mar, 2018, 10:51:52 AM
    Author     : Suhas
--%>
<%
    //Revalidate user when pressing back button after logout
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
    response.setHeader("Pragma", "no-cache");   //HTTP 1.0
    response.setHeader("Expires", "0"); //Proxies

    //Checking session
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
            if (window.XMLHttpRequest)
            {// code for IE7+, Firefox, Chrome, Opera, Safari
                xmlhttp = new XMLHttpRequest();
            } else
            {// code for IE6, IE5
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            function getDetails(str)
            {
                if (str === "")
                {
                    document.getElementById("loanDetails").innerHTML = "";
                    return;
                }
                xmlhttp.onreadystatechange = function ()
                {
                    if (this.readyState === 4 && this.status === 200)
                    {
                        document.getElementById("loanDetails").innerHTML = this.responseText;
                    }
                };
                //Getting customer details
                xmlhttp.open("GET", "getCustomerDetails.jsp?name=" + str, true);
                xmlhttp.send();
            }
            function getInfo(str)
            {
                xmlhttp.onreadystatechange = function ()
                {
                    if (this.readyState == 4 && this.status == 200)
                    {
                        document.getElementById("customerLoanInfo").innerHTML = this.responseText;
                    }
                };
                //getting customer loan information
                xmlhttp.open("GET", "getCustomerLoanInfo.jsp?emailid=" + str, true);
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
                            <h1>Customers Details</h1>
                            <form class="form-horizontal">
                                <div class="form-group">
                                    <label for="customerId" class="col-sm-2 control-label">Customer ID</label>
                                    <div class="col-sm-10">
                                        <!-- Displaying customer loan details on entering letter -->
                                        <input type="text" class="form-control" onKeyUp="getDetails(this.value)" placeholder="Enter Customer Id to search details...">
                                    </div>
                                </div>
                            </form>
                        </div>
                        <!-- Loan details -->
                        <div class="form-group">
                            <div id="loanDetails">
                            </div>
                        </div>
                        <!-- Customer Loan information -->
                        <div class="well" id="customerLoanInfo">
                        </div>
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