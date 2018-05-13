<%-- 
    Document   : loanApplication
    Created on : 4 Mar, 2018, 10:51:25 AM
    Author     : Suhas
--%>
<%@page import="controllers.Database"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
    response.setHeader("Pragma", "no-cache");   //HTTP 1.0
    response.setHeader("Expires", "0"); //Proxies

    if (session.getAttribute("adminname") == null) {
        response.sendRedirect("../index.jsp");
    }
%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
    </head>
    <body>
        <!-- Menu --><%@include file="adminMenu.jsp" %>

        <section id="main">
            <div class="container">
                <div class="row">
                    <!-- Left menu --><%@include file="leftMenu.jsp" %>

                    <div class="col-md-9">
                        <div class="well">
                            <h1>Loan Application</h1>
                            <table class="table table-bordered table-condensed table-hover table-responsive table-striped">
                                <tr>
                                    <th>Appl. ID</th>
                                    <th>Loan ID</th>
                                    <th>Loan Amount</th>
                                    <th>Customer Email ID</th>
                                    <th>Address</th>
                                    <th>Mobile No</th>
                                    <th>Application Date</th>
                                    <th>Action</th>
                                </tr>

                                <%                                    if (session.getAttribute("adminname") != null) {
                                        String emailId = session.getAttribute("adminname").toString();
                                        Connection con;
                                        Statement st1, st2;
                                        ResultSet rs1, rs2;
                                        try {
                                            con = Database.connect();
                                            st1 = con.createStatement();
                                            st2 = con.createStatement();

                                            rs1 = st1.executeQuery("select * from loan_application where status = 0");
                                            while (rs1.next()) {
                                                String c_emailid = rs1.getString(2);
                                                rs2 = st2.executeQuery("select * from customer_details where email_id='" + c_emailid + "'");
                                                rs2.next();
                                %>

                                <tr>
                                    <td><%= rs1.getInt(1)%></td>
                                    <td><%= rs1.getInt(3)%></td>
                                    <td><%= rs1.getInt(5)%></td>
                                    <td><%= rs1.getString(2)%></td>
                                    <td><%= rs2.getString(5)%></td>
                                    <td><%= rs2.getString(4)%></td>
                                    <td><%= rs1.getDate(4)%></td>
                                    <td><a href="../AdminProcessLoan?emailid=<%=c_emailid%>&action=approve" class="btn btn-success btn-sm">Approve</a>&nbsp;<a href="../AdminProcessLoan?emailid=<%=c_emailid%>&action=reject" class="btn btn-danger btn-sm">Reject</a></td>
                                </tr>
                                <%      rs2.close();
                                            }
                                        } catch (SQLException e) {
                                            System.out.println(e.getMessage());
                                        }
                                    }
                                %>
                            </table>
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