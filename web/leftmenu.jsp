<%-- 
    Document   : leftmenu
    Created on : 27 Feb, 2018, 9:48:29 PM
    Author     : Suhas
--%>

<div class="col-md-3">
    <%  if (session.getAttribute("username") != null) {
    %>
    <div class="list-group">
        <a href="#" class="list-group-item active main-color">&nbsp;&nbsp;General</a>
        <a href="profile.jsp" class="list-group-item">&nbsp;&nbsp;Profile</a>
        <a href="customerLoanDetails.jsp" class="list-group-item">&nbsp;&nbsp;Loan Details</a>
        <a href="emiDetails.jsp" class="list-group-item">&nbsp;&nbsp;EMI Details</a>
    </div>
    <%  }
    %>
    <div class="list-group">
        <a href="#" class="list-group-item active main-color">&nbsp;&nbsp;Loans</a>
        <a href="home-loan.jsp" class="list-group-item">&nbsp;&nbsp;Home Loan</a>
        <a href="personal-loan.jsp" class="list-group-item">&nbsp;&nbsp;Personal Loan</a>
        <a href="vehicle-loan.jsp" class="list-group-item">&nbsp;&nbsp;Vehicle Loan</a>
        <a href="business-loan.jsp" class="list-group-item">&nbsp;&nbsp;Business Loan</a>
    </div>
    <%  if (session.getAttribute("username") != null) {
    %>
    <div class="list-group">
        <a href="#" class="list-group-item active main-color">&nbsp;&nbsp;General</a>
        <a href="downloads/LoanApplicationForm.pdf" class="list-group-item">&nbsp;&nbsp;Download Loan Form</a>
        <a href="loanApplication.jsp" class="list-group-item">&nbsp;&nbsp;Apply Online</a>
    </div>
    <%  }
    %>
</div>