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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
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
@WebServlet(name = "ProcessLoan", urlPatterns = {"/ProcessLoan"})
public class ProcessLoan extends HttpServlet {

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

            //Session Handling
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
            response.setHeader("Pragma", "no-cache");   //HTTP 1.0
            response.setHeader("Expires", "0"); //Proxies

            //Get the form data
            float amount = Float.parseFloat(request.getParameter("amount"));
            int loan_id = Integer.parseInt(request.getParameter("loanId"));

            Date utilDate = new Date();
            java.sql.Date applyDate = new java.sql.Date(utilDate.getTime());

            String guarantor_name = request.getParameter("guarantor");
            String mobile_no = request.getParameter("mobile");
            String guarantor_address = request.getParameter("guarantor_address");

            HttpSession session = request.getSession();
            String email_id = session.getAttribute("username").toString();

            System.out.println(amount + " " + loan_id);

            Connection con;
            ResultSet rs;
            PreparedStatement ps;
            Statement st;

            //Store the loan application data to database
            try {
                con = Database.connect();
                /*
                st = con.createStatement();
                st.executeUpdate("update table loan_application set status=3 where c_emailid='"+email_id+"'");
                 */
                ps = con.prepareStatement("insert into loan_application(c_emailid, loan_id, apply_date, amount, status, guarantor_name, guarantor_mobile, guarantor_address) values (?, ?, ?, ?, ?, ?, ?, ?)");
                ps.setString(1, email_id);
                ps.setInt(2, loan_id);
                ps.setDate(3, applyDate);
                ps.setFloat(4, amount);
                ps.setInt(5, 0);
                ps.setString(6, guarantor_name);
                ps.setString(7, mobile_no);
                ps.setString(8, guarantor_address);

                ps.execute();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
            
            response.sendRedirect("loanApplication.jsp");
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