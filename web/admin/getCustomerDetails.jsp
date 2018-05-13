<%-- 
    Document   : getCustomerDetails
    Created on : 4 Mar, 2018, 11:18:06 PM
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
        <th>EmaiID</th>
        <th>Name</th>
        <th>Mobile No</th>
        <th>Address</th>
        <th>PAN No</th>
        <th>Adhar No</th>
        <th>Gender</th>
        <th>DOB</th>
        <th>Joined</th>
        <th>Action</th>
    </tr>
    
    <%  String name = request.getParameter("name");
        Connection con;
        ResultSet rs;
        Statement st;

        try {
            con = Database.connect();
            st = con.createStatement();
            //getting customer details
            rs = st.executeQuery("select * from customer_details where email_id like '%" + name + "%'");
            while (rs.next()) {
    %>
    
    <tr>
        <td><%= rs.getString(1)%></td><!-- EmailId -->
        <td><%= rs.getString(2)%></td><!-- Name -->
        <td><%= rs.getString(4)%></td><!-- Mobile no. -->
        <td><%= rs.getString(5)%></td><!-- Address -->
        <td><%= rs.getString(6)%></td><!-- PAN no. -->
        <td><%= rs.getString(7)%></td><!-- Adhar no. -->
        <td><%= rs.getString(8)%></td><!-- Gender -->
        <td><%= rs.getDate(9)%></td><!-- DOB -->
        <td><%= rs.getDate(10)%></td><!-- Joined Date -->
        <!-- For each customer display button. On click of button customer loan information will displayed. -->
        <td><button class="btn btn-info btn-sm" onClick="getInfo('<%= rs.getString(1).toString()%>')">Loan Info</button></td>
    </tr>

    <%  }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    %>
</table>