<%-- 
    Document   : menu
    Created on : 16 Feb, 2018, 11:02:56 PM
    Author     : Suhas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
            response.setHeader("Pragma", "no-cache");   //HTTP 1.0
            response.setHeader("Expires", "0"); //Proxies
        %>

        <%
            String filename = this.getClass().getSimpleName().replaceAll("_", ".");
        %>
        <!--Top Menu Bar -->
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container-fluid">
                <!-- Logo -->
                <div class="navbar-header">
                    <a href="index.jsp">
                        <img alt="Brand" class="navbar-brand img-circle" src="images/norton_finance_logo.jpg">
                    </a>
                    <a class="navbar-brand" href="index.jsp">Norton Finance</a>
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#mainNavBar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
                <!-- Menu items -->
                <div class="collapse navbar-collapse" id="mainNavBar">
                    <ul class="nav navbar-nav">
                        <li <% if (filename.equals("index.jsp")){out.print("class=\"active\"");}%> ><a href="index.jsp"><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;Home</a></li>

                        <!-- Dropdown menu item -->
                        <li class="dropdown <% if (filename.equals("home.002dloan.jsp") || filename.equals("personal.002dloan.jsp") || filename.equals("vehicle.002dloan.jsp") || filename.equals("business.002dloan.jsp")){out.print("active");}%>">
                            <a href="#" class="dropodown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-leaf"></span>&nbsp;&nbsp;Loans <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li <% if (filename.equals("home.002dloan.jsp")){out.print("class=\"active\"");}%> ><a href="home-loan.jsp">Home Loan</a></li>
                                <li <% if (filename.equals("personal.002dloan.jsp")){out.print("class=\"active\"");}%> ><a href="personal-loan.jsp">Personal Loan</a></li>
                                <li <% if (filename.equals("vehicle.002dloan.jsp")){out.print("class=\"active\"");}%> ><a href="vehicle-loan.jsp">Vehicle Loan</a></li>
                                <li <% if (filename.equals("business.002dloan.jsp")){out.print("class=\"active\"");}%>><a href="business-loan.jsp">Business Loan</a></li>
                            </ul>
                        </li>
                        <%  if (session.getAttribute("username") != null)
                            {
                        %>
                        <li <% if (filename.equals("customerLoanDetails.jsp")){out.print("class=\"active\"");}%> ><a href="customerLoanDetails.jsp"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;Loan Details</a></li>
                        <li <% if (filename.equals("emiDetails.jsp")){out.print("class=\"active\"");}%> ><a href="emiDetails.jsp"><span class="glyphicon glyphicon-list"></span>&nbsp;&nbsp;EMI Details</a></li>
                        <%  }
                        %>
                        <li <% if (filename.equals("about.002dus.jsp")){out.print("class=\"active\"");}%> ><a href="about-us.jsp"><span class="glyphicon glyphicon-info-sign"></span>&nbsp;&nbsp;About Us</a></li>
                        <li <% if (filename.equals("contact.002dus.jsp")){out.print("class=\"active\"");}%> ><a href="contact-us.jsp"><span class="glyphicon glyphicon-phone-alt"></span>&nbsp;&nbsp;Contact Us</a></li>
                    </ul>
                    <!-- Menu items on right side -->
                    <%  String name = (String) session.getAttribute("username");
                        if (name == null)
                        {
                    %>
                    <ul class="nav navbar-nav navbar-right">
                        <li <% if (filename.equals("login.jsp")){out.print("class=\"active\"");}%> ><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span>&nbsp;&nbsp;Login</a></li>
                        <li <% if (filename.equals("register.jsp")){out.print("class=\"active\"");}%> ><a href="register.jsp"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;Register</a></li>
                    </ul>
                    <%  }
                        else
                        {
                    %>
                    <ul class="nav navbar-nav navbar-right">
                        <li <% if (filename.equals("profile.jsp")){out.print("class=\"active\"");}%> ><a href="profile.jsp"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;Welcome ${username}</a></li>
                        <li><a href="Logout"><span class="glyphicon glyphicon-log-out"></span>&nbsp;&nbsp;Logout</a></li>
                    </ul>
                    <%  }
                    %>
                </div>
            </div>
        </nav><br><br>
    </body>
</html>