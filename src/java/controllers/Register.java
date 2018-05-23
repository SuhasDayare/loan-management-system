/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Suhas
 */
@WebServlet(name = "Register", urlPatterns = {"/Register"})
public class Register extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String error = "";

            //Session Handling
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
            response.setHeader("Pragma", "no-cache");   //HTTP 1.0
            response.setHeader("Expires", "0"); //Proxies

            //Collecting form data
            String name = request.getParameter("name").trim();
            String emailId = request.getParameter("email").trim();
            String gender = request.getParameter("gender");
            Date dob = Date.valueOf(request.getParameter("dob"));
            String mobileno = request.getParameter("mobile").trim();
            String adharno = request.getParameter("adhar").trim();
            String panno = request.getParameter("pan").trim();
            String address = request.getParameter("address").trim();
            String password = request.getParameter("pass").trim();
            String password1 = request.getParameter("pass1").trim();

            //Validating data
            boolean flag = true;
            if (name == null || emailId == null || dob == null || address == null || password == null) {
                flag = false;
                error = "All fields are required...";
            } else if (mobileno.length() != 10) {
                flag = false;
                error = "Enter proper mobile number...";
            } else if (adharno.length() != 12) {
                flag = false;
                error = "Enter proper adhar number...";
            } else if (panno.length() != 10) {
                flag = false;
                error = "Enter proper PAN number...";
            } else if (!password.equals(password1)) {
                flag = false;
                error = "Passwords are different!!! Make sure you type same password in both password fields.";
            }

            //If flag is true then proceed to insert data into database
            if (flag) {
                Connection con;
                con = Database.connect();

                try {
                    String query = "insert into customer_details(email_id, name, password, mobile_no, address, pan_no, adhar_no, gender, dob) values (?,?,?,?,?,?,?,?,?)";
                    PreparedStatement ps = con.prepareStatement(query);
                    ps.setString(1, emailId);
                    ps.setString(2, name);
                    ps.setString(3, password);
                    ps.setString(4, mobileno);
                    ps.setString(5, address);
                    ps.setString(6, panno);
                    ps.setString(7, adharno);
                    ps.setString(8, gender);
                    ps.setDate(9, dob);

                    boolean rs = ps.execute();

                    //If data is stored in database successfully then set a session and redirect user to index.jsp page else redirect user to registeration page.
                    if (!rs) {
                        HttpSession session = request.getSession();
                        session.setAttribute("username", emailId);

                        response.sendRedirect("./index.jsp");
                    } else {
                        System.out.println("rs...................rs.........rs");
                        response.sendRedirect("./register.jsp?error=Wrong emailId or password!!!");
                    }
                } catch (SQLException e) {
                    System.out.println(e.getMessage());
                    response.sendRedirect("./register.jsp?error=Ooops, Something went wrong. Please try again.");
                }
            } 
            //If flag is false the redirect user to register.jsp page with error.
            else {
                System.out.println("flag............................flag");
                response.sendRedirect("./register.jsp?error=" + error);
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}