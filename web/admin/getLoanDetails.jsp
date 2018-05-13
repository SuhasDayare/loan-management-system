<%-- 
    Document   : getLoanDetails
    Created on : 4 Mar, 2018, 7:10:29 PM
    Author     : Suhas
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="controllers.Database"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<table class="table table-bordered table-hover table-responsive table-striped">
    <tr>
        <th>ID</th>
        <th>Tenure (in Years)</th>
        <th>Rate %</th>
        <th>Action</th>
    </tr>
    <%  String type = request.getParameter("type");

        Connection con;
        ResultSet rs;
        Statement st;

        try {
            con = Database.connect();
            st = con.createStatement();
            rs = st.executeQuery("select * from loan_details where name='" + type + "' && status=1");

            while (rs.next()) {
    %>

    <tr>
        <td><%= rs.getInt(1)%></td>
        <td><%= rs.getInt(3)%> years (<%= rs.getInt(3) * 12%> months)</td>
        <td><%= rs.getInt(4)%> %</td>
        <td><a class="btn btn-danger btn-sm btn-block" href="../LoanDetailsUpdate?action=delete&id=<%= rs.getInt(1)%>">Delete</a></td>
    </tr>

    <%      }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    %>
</table>