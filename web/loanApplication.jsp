<%-- 
    Document   : loanApplication
    Created on : 27 Feb, 2018, 9:37:29 PM
    Author     : Suhas
--%>
<%

    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
    response.setHeader("Pragma", "no-cache");   //HTTP 1.0
    response.setHeader("Expires", "0"); //Proxies

    if (session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
    }

%>

<%@page import="java.sql.SQLException"%>
<%@page import="controllers.Database"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<!--Top Menu Bar --><%@include file="menu.jsp" %>

<div class="container-fluid Banner">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <br>
                <font>
                <h1 style="color: white; ">Loan Application <small>Apply Online</small></h1>
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
                <%      if (session.getAttribute("username") != null) {
                        Connection con;
                        ResultSet rs, rs1;
                        Statement st;
                        boolean brs = false, brs1 = false;

                        try {
                            String c_emailid = session.getAttribute("username").toString();
                            con = Database.connect();
                            st = con.createStatement();
                            rs = st.executeQuery("select * from loan_application where c_emailid='" + c_emailid + "' && status=0");
                            brs = rs.next();
                            rs1 = st.executeQuery("select * from loan_application where c_emailid='" + c_emailid + "' && status=1");
                            brs1 = rs1.next();

                            if (brs) {
                %>
                <center>
                    <h1>Your loan application is being processed.</h1><br>
                    <p>Our agent will get in touch with you for verification.</p>
                    <p>Once your application is approved you can see details <a href="customerLoanDetails.jsp">here</a>.</p>
                </center>
                <%  } else if (brs1) {
                %>
                <center>
                    <h1><small>You already have loan.</small></h1><br>
                    <p>You can take only one loan at a time. You can see your loan details <a href="customerLoanDetails.jsp">here</a>.</p>
                </center>
                <%  } else {
                %>
                <center><h1><small>Loan Application</small></h1></center>
                <br>
                <form class="form-horizontal" method="POST" action="ProcessLoan">
                    <div class="form-group">
                        <label class="col-sm-3 col-md-offset-1">Loan Details</label>
                    </div>
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
                        <label for="loanDetail" class="col-sm-2 control-label">Loan Detail</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="loanDetail" required name="loanId">
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="amount" class="col-sm-2 control-label">Amount</label>
                        <div class="col-sm-10">
                            <input type="number" class="form-control" id="amount" name="amount" placeholder="Enter amount..." required min="25000" max="5000000">
                        </div>
                    </div>
                    <br>
                    <div class="form-group">
                        <label class="col-sm-3 col-md-offset-1">Guarantor Details</label>
                    </div>
                    <div class="form-group">
                        <label for="guarantor" class="col-sm-2 control-label">Name</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="guarantor" name="guarantor" placeholder="Enter guarantor name..." required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="mobile" class="col-sm-2 control-label">Mobile no.</label>
                        <div class="col-sm-10">
                            <input type="number" class="form-control" id="mobile" name="mobile" placeholder="Enter mobile no..." required min="6000000000" max="9999999999">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="guarantor_address" class="col-sm-2 control-label">Guarantor Address</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="guarantor_address" name="guarantor_address" placeholder="Enter guarantor address..." required>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-default">Apply</button>
                        </div>
                    </div>
                </form>
                <%          }
                        } catch (SQLException e) {
                            System.out.println(e.getMessage());
                        }
                    }
                %>
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

<script>
                                function getDetails(str)
                                {
                                    if (str == "")
                                    {
                                        document.getElementById("loanDetail").innerHTML = "";
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
                                            document.getElementById("loanDetail").innerHTML = this.responseText;
                                        }
                                    }
                                    xmlhttp.open("GET", "getLoanDetails.jsp?type=" + str, true);
                                    xmlhttp.send();
                                }
</script>

</body>
</html>