<%-- 
    Document   : personal-loan
    Created on : 13 Feb, 2018, 12:10:19 PM
    Author     : Suhas
--%>

<!--Top Menu Bar --><%@include file="menu.jsp" %>

<div class="container-fluid PL-Banner">
    <div class="container">
        <div class="row">
            <div class="col-md-5">
                <br>
                <font>
                <h1 style="color: white; ">Personal Loan</h1>
                <h3>Personal loan by Norton Finance</h3>
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
                <h2>Personal Loan Features and Benefits</h2> <hr>
                <span class="loaninformation">
                    Whether you need to plan a vacation, pay for higher studies or a wedding, undertake a home renovation project or consolidate your debt or even handle a medical emergency, our Personal Loans can ensure you get the funds within 24 hours.
                    <br><br>
                    <div class="media">
                        <div class="media-left">
                            <a href="#">
                                <img class="media-object" src="images/svg/lOAN uP TO.svg" alt="..." height="64" width="64">
                            </a>
                        </div>
                        <div class="media-body">
                            <h4 class="media-heading">Loan up to Rs. 25 Lakh</h4>
                            Avail a Personal Loan up to Rs.25 lakh and finance almost all your needs
                        </div>
                    </div>
                    <br>
                    <div class="media">
                        <div class="media-left">
                            <a href="#">
                                <img class="media-object" src="images/svg/LOC Flex.svg" alt="..." height="64" width="64">
                            </a>
                        </div>
                        <div class="media-body">
                            <h4 class="media-heading">Flexibility</h4>
                            Borrow as you need, prepay when you can with Flexi Personal Loans
                        </div>
                    </div>
                    <br>
                    <div class="media">
                        <div class="media-left">
                            <a href="#">
                                <img class="media-object" src="images/svg/Instant approval.svg" alt="..." width="64" height="64">
                            </a>
                        </div>
                        <div class="media-body">
                            <h4 class="media-heading">Instant Approval</h4>
                            Get your personal loan application approved in under 60 minutes
                        </div>
                    </div>
                    <br>
                    <div class="media">
                        <div class="media-left">
                            <a href="#">
                                <img class="media-object" src="images/svg/Min Doc.svg" alt="..." width="64" height="64">
                            </a>
                        </div>
                        <div class="media-body">
                            <h4 class="media-heading">Minimal Documentation</h4>
                            Hassle-free processes with easy to meet eligibility criteria, and minimal documentation
                        </div>
                    </div>
                    <br>
                    <div class="media">
                        <div class="media-left">
                            <a href="#">
                                <img class="media-object" src="images/svg/Online Account Mnagmnt.svg" alt="..." width="64" height="64">
                            </a>
                        </div>
                        <div class="media-body">
                            <h4 class="media-heading">Online Account Management</h4>
                            Bank on-the-go with access to your loan account anytime, anywhere
                        </div>
                    </div>
                    <br>
                    <div class="media">
                        <div class="media-left">
                            <a href="#">
                                <img class="media-object" src="images/svg/No Hidden Terms.svg" alt="..." width="64" height="64">
                            </a>
                        </div>
                        <div class="media-body">
                            <h4 class="media-heading">No hidden charges </h4>
                            Stay fully-informed about your loan with the Personal Loan Terms and Conditions
                        </div>
                    </div>
                    <br><br>
                    <p>
                        Our easy-to-use Personal Loan Eligibility calculator and Personal Loan EMI calculator help you manage your loan right from the application stage. Apply for a Bajaj Finserv Personal Loan today.
                    </p>
                    <%@include file="loandetails.jsp" %>
                </span>
                <a class="btn btn-default btn-block main-color" href="loanApplication.jsp">Apply</a>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<%@include file="footer.html" %>