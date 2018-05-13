<%-- 
    Document   : admin-index
    Created on : 13 Feb, 2018, 4:06:46 PM
    Author     : Suhas
--%>

<%@page import="controllers.Database"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

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
        <title>Norton Finance | Admin</title>
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <link href="../css/admin-style.css" rel="stylesheet">
    </head>
    <body>
        <!-- Menu --><%@include file="adminMenu.jsp" %>

        <%  Connection con;
            Statement st;
            ResultSet rs;
            int totalCustomers = 0, loanApplication = 0, finalizedLoan = 0;
            try {
                con = Database.connect();
                st = con.createStatement();

                //Getting total number of customers
                rs = st.executeQuery("select count(*) from customer_details");
                rs.next();
                totalCustomers = rs.getInt(1);

                //Getting total number of new loan application
                rs = st.executeQuery("select count(*) from loan_application where status = 0");
                rs.next();
                loanApplication = rs.getInt(1);

                //Getting total number of finalized loans
                rs = st.executeQuery("select count(*) from customer_loan_details");
                rs.next();
                finalizedLoan = rs.getInt(1);
        %>

        <section id="main">
            <div class="container">
                <div class="row">
                    <!-- Left menu --><%@include file="leftMenu.jsp" %>

                    <div class="col-md-9">
                        <!-- Website Overview -->
                        <div class="panel panel-default">
                            <div class="panel-heading main-color-bg">
                                <h3 class="panel-title">Website Overview</h3>
                            </div>
                            <div class="panel-body">
                                <div class="col-md-4">
                                    <div class="well dash-box">
                                        <h2><span class="glyphicon glyphicon-user" aria-hidden="true"></span> <%= totalCustomers%></h2>
                                        <h4>Customers</h4>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="well dash-box">
                                        <h2><span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> <%= loanApplication%></h2>
                                        <h4>Loan Application</h4>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="well dash-box">
                                        <h2><span class="glyphicon glyphicon-list" aria-hidden="true"></span> <%= finalizedLoan%></h2>
                                        <h4>Finalized Loan</h4>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Latest Users -->
                        <div class="panel panel-default">
                            <div class="panel-heading main-color-bg">
                                <h3 class="panel-title">Latest Users</h3>
                            </div>
                            <div class="panel-body">
                                <table class="table table-striped table-hover table-bordered table-responsive">
                                    <tr>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Joined</th>
                                    </tr>
                                    <%
                                        rs = st.executeQuery("select name, email_id, joined from customer_details order by TIME(joined) desc limit 10");

                                        //Displaying latest customer details
                                        while (rs.next()) {
                                    %>
                                    <tr>
                                        <td><%= rs.getString(1)%></td>
                                        <td><%= rs.getString(2)%></td>
                                        <td><%= rs.getString(3)%></td>
                                    </tr>
                                    <%
                                            }
                                        } catch (SQLException e) {
                                            System.out.println(e.getMessage());
                                        }
                                    %>
                                </table>
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