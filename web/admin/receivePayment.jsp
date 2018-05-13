<%-- 
    Document   : receivePayment
    Created on : 4 Mar, 2018, 10:52:12 AM
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
            function getDetails()
            {
                str = document.getElementById("emailID").value;
                if (str === "")
                {
                    document.getElementById("emiDetails").innerHTML = "";
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
                    if (this.readyState === 4 && this.status === 200)
                    {
                        document.getElementById("emiDetails").innerHTML = this.responseText;
                    }
                };
                xmlhttp.open("GET", "getEmiDetails.jsp?emailid=" + str, true);
                xmlhttp.send();
            }
        </script>
    </head>
    <body onload="getDetails()">
        <!-- Menu --><%@include file="adminMenu.jsp" %>

        <section id="main">
            <div class="container">
                <div class="row">
                    <!-- Left menu --><%@include file="leftMenu.jsp" %>

                    <div class="col-md-9">
                        <div class="well">

                            <h1>Receive EMI</h1><br>
                            <div class="row">
                                <div class="col-md-2">
                                    <label>Customer ID</label>
                                </div>
                                <div class="col-sm-7">
                                    <input type="text" id="emailID" class="form-control" placeholder="Enter Customer Id to search details..." <% if (request.getParameter("emailid") != null) {
                                            String emailId = request.getParameter("emailid");
                                            out.print("value='" + emailId + "'");
                                        }%>>
                                </div>
                                <div class="col-sm-3">
                                    <button class="btn btn-default" onclick="getDetails()">Submit</button>
                                </div>
                            </div>
                        </div>
                        <div class="well" id="emiDetails">
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