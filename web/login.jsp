<%-- 
    Document   : login
    Created on : 16 Feb, 2018, 11:02:07 PM
    Author     : Suhas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>  
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Norton Finance | Login</title>
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/main-css.css" type="text/css">

        <style>
            .footer {
                position: absolute;
                bottom: 0;
                width: 100%;
            }
        </style>

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <!--Top Menu Bar --><%@include file="menu.jsp" %>
        <br><br>

        <div class="container">
            <%  if (request.getParameter("error") != null) {
                    String error = request.getParameter("error");
            %>
            <div class="alert alert-danger fade in col-md-8 col-md-offset-2">
                <a href="#" class="close" data-dismiss="alert" area-label="close">&times;</a><span class="glyphicon glyphicon-alert"></span>&nbsp;&nbsp;&nbsp;<%= error%>
            </div>
            <%  }
            %>
        </div>

        <div class="modal-dialog">
            <div class="modal-content">
                <form class="form login-form" role="form" action="LoginController" method="POST">
                    <!-- header -->
                    <div class="modal-header">
                        <a class="close" href="register.jsp"><small>Or</small>&nbsp;Register</a>
                        <h2 class="modal-title">Login</h2>
                    </div>
                    <!-- body (form) -->
                    <div class="modal-body">
                        <div class="form-group">
                            <input type="email" class="form-control" placeholder="Enter email id..." required="required" name="id">
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" placeholder="Enter password..." required="required" name="password">
                        </div>
                        <div class="form-group">
                            <label class="checkbox-inline">
                                <input type="checkbox" value="admin" name="admin">&nbsp;&nbsp;I'm an Admin
                            </label>
                        </div>
                    </div>
                    <!-- button -->
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary btn-block">Login</button>
                    </div>
                </form>
            </div>
        </div>

        <!-- Footer -->
        <%@include file="footer.html" %>