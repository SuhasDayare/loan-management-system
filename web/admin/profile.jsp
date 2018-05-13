<%-- 
    Document   : profile
    Created on : 26 Feb, 2018, 1:39:02 AM
    Author     : Suhas
--%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
    response.setHeader("Pragma", "no-cache");   //HTTP 1.0
    response.setHeader("Expires", "0"); //Proxies

    if (session.getAttribute("adminname") == null) {
        response.sendRedirect("../index.jsp");
    }
%>

<%@page import="controllers.Database"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Norton Finance | Customer Details</title>
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <link href="../css/admin-style.css" rel="stylesheet">
    </head>
    <body>
        <!-- Menu --><%@include file="adminMenu.jsp" %>

        <section id="main">
            <div class="container">
                <div class="row">
                    <!-- Left menu --><%@include file="leftMenu.jsp" %>

                    <div class="col-md-9">
                        <div class="well">
                            <%      if (session.getAttribute("adminname") != null) {
                                    String emailId = session.getAttribute("adminname").toString();
                                    Connection con;
                                    Statement st;
                                    ResultSet rs;
                                    try {
                                        con = Database.connect();
                                        st = con.createStatement();

                                        rs = st.executeQuery("select * from admin_details where email_id = '" + emailId + "'");
                                        rs.next();
                                        String name = rs.getString(2);
                                        String pass = rs.getString(3);
                            %>
                            <img src="../images/svg/Online Account Mnagmnt.svg" class="img-rounded" height="100" width="100%">
                            <form class="form-horizontal" method="POST" action="../UpdateProfile">
                                <div class="form-group">
                                    <label for="name" class="col-sm-2 control-label">Name</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="name" disabled value="<%= name%>"> 
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="email_id" class="col-sm-2 control-label">Email Id</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="email_id" disabled value="<%= emailId%>"> 
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="password" class="col-sm-2 control-label">Password</label>
                                    <div class="col-sm-10">
                                        <input type="password" class="form-control" id="password" name="password" value="<%= pass%>">
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
                            <%  } catch (SQLException e) {
                                        System.out.println(e.getMessage());
                                    }
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <footer id="footer">
            <p>Norton Finance Copyright All Right Reserved &copy; 2018</p>
        </footer>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>
    </body>
</html>