<%-- 
    Document   : index
    Created on : 11 Feb, 2018, 12:23:15 PM
    Author     : Suhas
--%>

<!--Top Menu Bar --><%@include file="menu.jsp" %>

<div class="container slides">
    <div id="carousel" class="carousel slide" data-ride="carousel">

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <a href="index.jsp">
                    <img src="images/carousel_norton_finance.jpg" alt="Norton Finance">
                </a>
                <div class="carousel-caption">
                </div>
            </div>
            <div class="item">
                <a href="home-loan.jsp">
                    <img src="images/carousel_home_loan.jpg" alt="Home Loan">
                </a>
                <div class="carousel-caption">
                    <h1>Home Loans</h1>
                </div>
            </div>
            <div class="item">
                <a href="personal-loan.jsp">
                    <img src="images/carousel_personal_loan.jpg" alt="Personel Loan">
                </a>
                <div class="carousel-caption">
                    <h1>Personal Loan</h1>
                </div>
            </div>
            <div class="item">
                <a href="vehicle-loan.jsp">
                    <img src="images/carousel_vehicle_loan.jpg" alt="Vehicle Loan">
                </a>
                <div class="carousel-caption">
                    <h1>Vehicle Loans</h1>
                </div>
            </div>
            <div class="item">
                <a href="business-loan.jsp">
                    <img src="images/carousel_business_loan.jpg" alt="Business Loan">
                </a>
                <div class="carousel-caption">
                    <h1>Business Loans</h1>
                </div>
            </div>
        </div>
        <!-- Controls -->
        <a class="left carousel-control" href="#carousel" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#carousel" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</div>
<div class="container">
    <div class="btn-group btn-group-justified" role="group" aria-label="...">
        <a class="btn btn-default btn-lg"  href="downloads/LoanApplicationForm.pdf">Download Loan Application</a>
        <a class="btn btn-default btn-lg"  href="loanApplication.jsp">Apply Online</a>
    </div>
</div>
<br><br>
<div class="container">
    <div class="row">
        <div class="col-md-6">
            <div class="panel panel-default border">
                <div class="panel-heading main-color">
                    <h3 class="panel-title">Home Loan</h3>
                </div>
                <div class="panel-body" style="background-image: url('images/home-loan.jpg'); background-size: 100% 100%; ">
                    <font>
                    Home Loan from Norton Finance is convenient and affordable option to suit your financial needs. Our Home Loans are designed to fulfill all your mortgage financing requirements, 
                    from buying your first home to constructing a new house or get a balance transfer for your existing home loan.<br><br>
                    Our home loans cater to all salaried, self-employed and professional individuals.<br><br>
                    </font>
                    <a class="btn btn-default" href="home-loan.jsp">Read More</a>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="panel panel-default border">
                <div class="panel-heading main-color">
                    <h3 class="panel-title">Personal Loan</h3>
                </div>
                <div class="panel-body" style="background-image: url('images/personal-loan1.jpg'); background-size: 100% 100%;">
                    <font> 
                    Personal Loan Features and Benefits Whether you need to plan a vacation, pay for higher studies or a wedding, undertake a home renovation project or
                    consolidate your debt or even handle a medical emergency, our Personal Loans can ensure you get the funds within 24 hours.<br><br>
                    Borrow up to Rs.25 lakh and pay up to 45% lower EMI with our Flexi Interest-only Loan. <br><br>
                    </font>
                    <a class="btn btn-default" href="personal-loan.jsp">Read More</a>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <div class="panel panel-default border">
                <div class="panel-heading main-color">
                    <h3 class="panel-title">Vehicle Loan</h3>
                </div>
                <div class="panel-body" style="background-image: url('images/vehical-loan.jpg'); background-size: 100% 100%;">
                    <font>
                    Norton Finance offers vehicle loans to help fund your dream vehicle, from a no-frills compact car to a top-end luxury sedan.
                    Apply for vehicle loans at Norton Finance to get up to 100% financing for your car.<br><br>
                    With our attractive interest rates and flexible loan tenure of up to seven years by Norton Finance, 
                    car loans are now affordable and pocket-friendly.<br><br>
                    </font>
                    <a class="btn btn-default" href="vehicle-loan.jsp">Read More</a>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="panel panel-default border">
                <div class="panel-heading main-color">
                    <h3 class="panel-title">Business Loan</h3>
                </div>
                <div class="panel-body" style="background-image: url('images/business-loan.jpg'); background-size: 100% 100%;">
                    <font>
                    With low interest rates and generously flexible repayment options, business loan by Norton Finance can give the much needed boost to your business, 
                    enhancing your competitiveness and profitability.<br><br>
                    Loan for business gives a Flexi loan facility, upgrade your existing business to latest machineries, scale up the growth at minimal repaying options.<br><br>
                    </font>
                    <a class="btn btn-default" href="business-loan.jsp">Read More</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<%@include file="footer.html" %>