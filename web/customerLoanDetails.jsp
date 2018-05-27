<%-- 
    Document   : customerLoanDetails
    Created on : 1 Mar, 2018, 1:08:40 AM
    Author     : Suhas
--%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.SQLException"%>
<%@page import="controllers.Database"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
    response.setHeader("Pragma", "no-cache");   //HTTP 1.0
    response.setHeader("Expires", "0"); //Proxies

    if (session.getAttribute("username") == null) {
        response.sendRedirect("index.jsp");
    }
%>

<!--Top Menu Bar --><%@include file="menu.jsp" %>

<div class="container-fluid Banner">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <br>
                <font>
                <h1 style="color: white; ">Loan Details</h1>
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
                        Statement st;
                        ResultSet rs1, rs2, rs3, rs7;

                        String emailId = session.getAttribute("username").toString();

                        try {
                            con = Database.connect();
                            st = con.createStatement();

                            rs1 = st.executeQuery("select * from loan_application where c_emailid='" + emailId + "'");
                            boolean brs1 = rs1.next();
                            rs7 = st.executeQuery("select status from loan_application where c_emailid='" + emailId + "' order by status limit 1");
                            boolean brs7 = false;
                            if (rs7.next()) {
                                int status = rs7.getInt(1);
                                if (status == 3) {
                                    brs7 = true;
                                }
                            }

                            rs2 = st.executeQuery("select * from loan_application where c_emailid='" + emailId + "' && status=0");
                            boolean brs2 = rs2.next();
                            rs3 = st.executeQuery("select * from loan_application where id=(select id from loan_application where c_emailid='" + emailId + "' order by status asc limit 1) && status=2");
                            boolean brs3 = rs3.next();

                            if ((!brs1 || brs7)) {
                %>
                <center>
                    <h1>You do not apply for any loan.</h1><br>
                    <p>Norton finance provides <a href="home-loan.jsp">Home Loan</a>, <a href="personal-loan.jsp">Personal Loan</a>, <a href="vehicle-loan.jsp">Vehicle Loan</a>, <a href="business-loan.jsp">Business Loan</a>.</p>
                    <p>You can apply loan <a href="loanApplication.jsp">here</a>.</p>
                </center>
                <%
                } else if (brs2) {
                %>
                <center>
                    <h1>Your loan application is being processed.</h1><br>
                    <p>Our agent will get in touch with you for verification.</p>
                    <p>Once your application is approved you can see details <a href="customerLoanDetails.jsp">here</a>.</p>
                </center>
                <%  } else if (brs3) {
                %>
                <center>
                    <h1>Your loan application is rejected.</h1><br>
                    <p>Norton finance provides <a href="home-loan.jsp">Home Loan</a>, <a href="personal-loan.jsp">Personal Loan</a>, <a href="vehicle-loan.jsp">Vehicle Loan</a>, <a href="business-loan.jsp">Business Loan</a>.</p>
                    <p>You can re-apply for loan <a href="loanApplication.jsp">here</a>.</p>
                </center>
                <%  } else {
                    ResultSet rs6 = st.executeQuery("select * from customer_loan_details where c_emailid='" + emailId + "' && status=1");
                    rs6.next();

                    int loanApplicationId = rs6.getInt(1);
                    int loanId = rs6.getInt(3);
                    int amount = rs6.getInt(4);
                    int totalAmount = rs6.getInt(5);
                    Date issueDate = rs6.getDate(7);

                    ResultSet rs4 = st.executeQuery("select * from loan_details where id=" + loanId);
                    rs4.next();
                    String loanName = rs4.getString(2);
                    int loanTenure = rs4.getInt(3);
                    float loanRate = rs4.getFloat(4);

                    ResultSet rs5 = st.executeQuery("select * from loan_application where c_emailid='" + emailId + "' && status=1");
                    rs5.next();
                    String guarantorName = rs5.getString(7);
                    String guarantorMobile = rs5.getString(8);
                    String guarantorAddress = rs5.getString(9);
                %>
                <h1>Loan Details</h1><br>
                <table class="table table-bordered table-hover table-responsive table-striped">
                    <tr>
                        <th>Loan Id</th>
                        <th>Loan Type</th>
                        <th>Amount ( in &#8377;)</th>
                        <th>Total Payable<br>Amount ( in &#8377;)</th>
                        <th>Tenure</th>
                        <th>Interest Rate</th>
                        <th>Issue Date</th>
                    </tr>
                    <tr>
                        <td><%= loanApplicationId%></td>
                        <td><%= loanName%></td>
                        <td><%= amount%></td>
                        <td><%= totalAmount%></td>
                        <td><%= loanTenure%> Year(s)</td>
                        <td><%= loanRate%> %</td>
                        <td><%= issueDate.toString()%></td>
                    </tr>
                </table>

                <h3><small>Guarantor Details</small></h3>
                <table class="table table-bordered table-hover table-responsive table-striped">
                    <tr>
                        <th>Name</th>
                        <th>Mobile Number</th>
                        <th>Address</th>
                    </tr>
                    <tr>
                        <td><%= guarantorName%></td>
                        <td><%= guarantorMobile%></td>
                        <td><%= guarantorAddress%></td>
                    </tr>
                </table>
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