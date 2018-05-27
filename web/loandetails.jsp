<%-- 
    Document   : loandetails
    Created on : 26 Feb, 2018, 2:05:42 AM
    Author     : Suhas
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="controllers.Database"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%  String file = this.getClass().getSimpleName().replaceAll("_", ".");
%>
<br>
<table class="table table-responsive table-bordered table-hover table-striped"
       <th>
    <th>ID</th>
    <th>Tenure</th>
    <th>Rate</th>
</th>
<%  Connection con;
    PreparedStatement ps;
    con = Database.connect();
    try {
        ps = con.prepareStatement("select * from loan_details where name=? and status=1");
        ResultSet rs;

        if (file.equals("home.002dloan.jsp")) {
            ps.setString(1, "Home Loan");
        } else if (file.equals("personal.002dloan.jsp")) {
            ps.setString(1, "Personal Loan");
        } else if (file.equals("vehicle.002dloan.jsp")) {
            ps.setString(1, "Vehicle Loan");
        } else if (file.equals("business.002dloan.jsp")) {
            ps.setString(1, "Business Loan");
        }
        rs = ps.executeQuery();

        while (rs.next()) {
%>
<tr>
    <td> <%= rs.getString(1)%> </td>
    <td> <%= rs.getString(3)%> </td>
    <td> <%= rs.getFloat(4)%> </td>
</tr>
<%      }
    } catch (SQLException e) {
        System.out.println(e.getMessage());
    }
%>
</table>