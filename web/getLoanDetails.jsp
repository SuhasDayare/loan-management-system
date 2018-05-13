<%-- 
    Document   : getLoanDetails
    Created on : 28 Feb, 2018, 10:55:14 PM
    Author     : Suhas
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="controllers.Database"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%  String type = request.getParameter("type");

    Connection con;
    ResultSet rs;
    Statement st;

    try {
        con = Database.connect();
        st = con.createStatement();
        rs = st.executeQuery("select * from loan_details where name='" + type + "' && status=1");

        while (rs.next()) {
%>
<option value="<%= rs.getInt(1)%>">Tenure: <%= rs.getInt(3)%> Years  @ <%= rs.getInt(4)%> %</option>
<%      }
    } catch (SQLException e) {
        System.out.println(e.getMessage());
    }
%>