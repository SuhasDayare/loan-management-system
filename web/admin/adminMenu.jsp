<%
    //Getting filename from which the call made to this file
    String filename = this.getClass().getSimpleName().replaceAll("_", ".");
%>
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="admin-index.jsp">
                <img alt="Brand" class="navbar-brand img-circle" src="../images/norton_finance_logo.jpg">
            </a>
            <a class="navbar-brand" href="admin-index.jsp">Norton Finance | <small>Admin</small></a>
        </div>
        
        <!-- Navigation Bar -->
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li <% if (filename.equals("admin.002dindex.jsp")) {
                        out.print("class=\"active\"");
                    }%>><a href="admin-index.jsp">Dashboard</a></li>
                <li <% if (filename.equals("loanApplication.jsp")) {
                        out.print("class=\"active\"");
                    }%>><a href="loanApplication.jsp">Loan Application</a></li>
                <li <% if (filename.equals("loanDetails.jsp")) {
                        out.print("class=\"active\"");
                    }%>><a href="loanDetails.jsp">Loan Details</a></li>
                <li <% if (filename.equals("customerDetails.jsp")) {
                        out.print("class=\"active\"");
                    }%>><a href="customerDetails.jsp">Customer Details</a></li>
                <li <% if (filename.equals("receivePayment.jsp")) {
                        out.print("class=\"active\"");
                    }%>><a href="receivePayment.jsp">Receive Payment</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li <% if (filename.equals("profile.jsp")) {
                        out.print("class=\"active\"");
                    }%>><a href="profile.jsp">Welcome, ${adminname}</a></li>
                <li><a href="../Logout">Logout</a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>

<!-- Header Bar -->
<header id="header">
    <div class="container">
        <div class="row">
            <div class="col-md-10">
                <h1><span class="glyphicon glyphicon-cog" aria-hidden="true"></span> Dashboard <small><%  if (filename.equals("admin.002dindex.jsp")) {
                        out.print("Norton Finance | Admin");
                    } else if (filename.equals("loanApplication.jsp")) {
                        out.print("Loan Application");
                    } else if (filename.equals("loanDetails.jsp")) {
                        out.print("Loan Details");
                    } else if (filename.equals("customerDetails.jsp")) {
                        out.print("Customer Details");
                    } else if (filename.equals("receivePayment.jsp")) {
                        out.print("Receive Payment");
                    }
                        %></small></h1>
            </div>
            <div class="col-md-2">
                <div class="dropdown create">
                    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                        Generate Report
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                        <li><a  class="btn pull-left" href="reportLoanApplication.jsp" target="_blank">Loan Applications</a></li>
                        <li><a  class="btn pull-left" href="reportReceivePayment.jsp" target="_blank">Receive Payment</a></li>
                        <li><a  class="btn pull-left" href="reportNewUsers.jsp" target="_blank">New Users</a></li>
                    </ul>
                </div>
            </div>

        </div>
    </div>
</header>

<!-- Breadcrumb -->
<section id="breadcrumb">
    <div class="container">
        <ol class="breadcrumb">
            <li <% if (filename.equals("admin-index.jsp")) {
                    out.print("class=\"active\"");
                }%>><a href="admin-index.jsp">Dashboard</a></li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;>
                <%  if (filename.equals("loanApplication.jsp")) {
                        out.print("<li class=\"activ\">Loan Application</li>");
                    } else if (filename.equals("loanDetails.jsp")) {
                        out.print("<li class=\"activ\">Loan Details</li>");
                    } else if (filename.equals("customerDetails.jsp")) {
                        out.print("<li class=\"activ\">Customer Details</li>");
                    } else if (filename.equals("receivePayment.jsp")) {
                        out.print("<li class=\"activ\">Receive Payment</li>");
                    } else if (filename.equals("profile.jsp")) {
                        out.print("<li class=\"activ\">Profile</li>");
                    }
                %>
        </ol>
    </div>
</section>