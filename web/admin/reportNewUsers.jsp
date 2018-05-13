<%-- 
    Document   : reportNewUsers
    Created on : 5 Mar, 2018, 11:35:41 AM
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
        <title>Norton Finance | Report - New Users</title>
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <link href="../css/admin-style.css" rel="stylesheet">
    </head>
    <body>
        <div class="container">
            <center><h1>New Customers</h1></center><br>
            <table class="table table-striped table-hover table-bordered table-responsive" style="background-color: white;">
                <tr>
                    <th>Customer Email ID</th>
                    <th>Name</th>
                    <th>Mobile No.</th>
                    <th>Address</th> 
                    <th>PAN No.</th>
                    <th>Adhar No.</th>
                    <th>Gender</th>
                    <th>DOB</th>
                    <th>Joined Date</th>
                </tr>
                <%  Connection con;
                    Statement st;
                    ResultSet rs;

                    try {
                        con = Database.connect();
                        st = con.createStatement();

                        rs = st.executeQuery("select * from customer_details order by DATE(joined) desc limit 20");
                        while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString(1)%></td>
                    <td><%= rs.getString(2)%></td>
                    <td><%= rs.getString(4)%></td>
                    <td><%= rs.getString(5)%></td>
                    <td><%= rs.getString(6)%></td>
                    <td><%= rs.getString(7)%></td>
                    <td><%= rs.getString(8)%></td>
                    <td><%= rs.getString(9)%></td>
                    <td><%= rs.getString(10)%></td>
                </tr>
                <%
                        }
                    } catch (SQLException e) {
                        System.out.println(e.getMessage());
                    }
                %>
            </table>
        </div>
    </body>
</html>