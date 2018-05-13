<%-- 
    Document   : getCustomerLoanInfo
    Created on : 4 Mar, 2018, 11:44:14 PM
    Author     : Suhas
--%>

<%@page import="java.sql.Date"%>
<%@page import="java.sql.SQLException"%>
<%@page import="controllers.Database"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<h1>Customer Loan Info</h1>
<%  Connection con;
    Statement st;
    ResultSet rs1, rs2, rs3, rs7;

    String emailId = request.getParameter("emailid");

    try {
        con = Database.connect();
        st = con.createStatement();

        //Checking whether customer has apply for loan or not
        rs1 = st.executeQuery("select * from loan_application where c_emailid='" + emailId + "'");
        boolean brs1 = rs1.next();
        
        //Checking the status of newest loan application
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

<h3><small><%= emailId%> not apply for any loan.</small></h3>

<%  } else if (brs2) {
%>

<h3><small><%= emailId%>'s loan application is being processed.</small></h3>

<%  } else if (brs3) {
%>

<h3><small><%= emailId%>'s loan application is rejected.</small></h3>

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

<h3>Loan Details</h3><br>
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

<%  }
    } catch (SQLException e) {
        System.out.println(e.getMessage());
    }
%>