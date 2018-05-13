<%-- 
    Document   : reportLoanApplication
    Created on : 5 Mar, 2018, 11:34:39 AM
    Author     : Suhas
--%>

<%@page import="controllers.Database"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

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
        <title>Norton Finance | Report - Loan Applications</title>
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <link href="../css/admin-style.css" rel="stylesheet">
    </head>
    <body>
        <div class="container">
            <center><h1>Loan Applications</h1></center><br>
            <table class="table table-striped table-hover table-bordered table-responsive" style="background-color: white;">
                <tr>
                    <th>ID</th>
                    <th>Customer Email ID</th>
                    <th>Loan ID</th>
                    <th>Apply Date</th>
                    <th>Amount</th>
                    <th>Guarantor Name</th>
                    <th>Guarantor Mobile</th>
                    <th>Guarantor Address</th>
                </tr>

                <%  Connection con;
                    Statement st;
                    ResultSet rs;

                    try {
                        con = Database.connect();
                        st = con.createStatement();

                        rs = st.executeQuery("select * from loan_application where status=0");
                        while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString(1)%></td>
                    <td><%= rs.getString(2)%></td>
                    <td><%= rs.getString(3)%></td>
                    <td><%= rs.getString(4)%></td>
                    <td><%= rs.getString(5)%></td>
                    <td><%= rs.getString(7)%></td>
                    <td><%= rs.getString(8)%></td>
                    <td><%= rs.getString(9)%></td>
                </tr>
                <%      }
                    } catch (SQLException e) {
                        System.out.println(e.getMessage());
                    }
                %>
            </table>
        </div>
    </body>
</html>