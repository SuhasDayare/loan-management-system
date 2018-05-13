<%-- 
    Document   : profile
    Created on : 27 Feb, 2018, 10:37:14 PM
    Author     : Suhas
--%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
    response.setHeader("Pragma", "no-cache");   //HTTP 1.0
    response.setHeader("Expires", "0"); //Proxies

    if (session.getAttribute("username") == null) {
        response.sendRedirect("index.jsp");
    }
%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="controllers.Database"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>  
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Norton Finance | Profile</title>

        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/main-css.css" type="text/css">

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <!--Top Menu Bar -->
        <%@include file="menu.jsp" %>

        <div class="container-fluid Banner">
            <div class="container">
                <div class="row">
                    <div class="col-md-5">
                        <br>
                        <font>
                        <h1 style="color: white; ">Profile <small>Norton Finance</small></h1>
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
                <!-- col-md-4 -->
                <%@include file="leftmenu.jsp" %>

                <div class="col-md-8">
                    <div class="well">
                        <%  String email_id = "", p_name = "", password = "", mobile_no = "", address = "", pan_no = "", adhar_no = "", dob = "";
                            if (session.getAttribute("username") != null) {
                                email_id = session.getAttribute("username").toString();
                                Connection con;
                                con = Database.connect();
                                ResultSet rs;
                                Statement st;
                                try {
                                    st = con.createStatement();
                                    rs = st.executeQuery("select * from customer_details where email_id='" + email_id + "'");
                                    rs.next();
                                    p_name = rs.getString(2);
                                    password = rs.getString(3);
                                    mobile_no = rs.getString(4);
                                    address = rs.getString(5);
                                    pan_no = rs.getString(6);
                                    adhar_no = rs.getString(7);
                                    dob = rs.getString(8);
                                } catch (SQLException e) {
                                    System.out.println(e.getMessage());
                                }
                            }
                        %>
                        <center><h1><small>Profile</small></h1></center>
                        <br>
                        <form class="form-horizontal" method="POST" action="UpdateProfile">
                            <div class="form-group">
                                <label for="name" class="col-sm-2 control-label">Name</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="name" disabled value="<%= p_name%>"> 
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="email_id" class="col-sm-2 control-label">Email Id</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="email_id" disabled value="<%= email_id%>"> 
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="pan_no" class="col-sm-2 control-label">PAN No.</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="pan_no" disabled value="<%= pan_no%>"> 
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="adhar_no" class="col-sm-2 control-label">Name</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="adhar_no" disabled value="<%= adhar_no%>"> 
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="dob" class="col-sm-2 control-label">DOB</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="dob" disabled value="<%= dob%>"> 
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="password" class="col-sm-2 control-label">Password</label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control" id="password" name="password" value="<%= password%>"> 
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="mobile_no" class="col-sm-2 control-label">Mobile No.</label>
                                <div class="col-sm-10">
                                    <input type="number" class="form-control" id="mobile_no" name="mobile_no" value="<%= mobile_no%>"> 
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="address" class="col-sm-2 control-label">Address</label>
                                <div class="col-sm-10">
                                    <textarea class="form-control" id="address" name="address"><%= address%></textarea>
                                    <small>Submit to update details.</small>
                                </div>
                            </div>
                            <br>
                            <div class="form-group">
                                <div class="col-sm-offset-3 col-sm-6">
                                    <button type="submit" class="btn btn-default btn-block">Submit</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer -->
        <%@include file="footer.html" %>

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>