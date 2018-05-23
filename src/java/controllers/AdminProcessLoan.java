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

/**
 *
 * @author Suhas
 */
@WebServlet(name = "AdminProcessLoan", urlPatterns = {"/AdminProcessLoan"})
public class AdminProcessLoan extends HttpServlet {

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

            //Session handling
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
            response.setHeader("Pragma", "no-cache");   //HTTP 1.0
            response.setHeader("Expires", "0"); //Proxies

            Connection con;
            Statement st;
            ResultSet rs;
            PreparedStatement ps;

            //Get form data
            String emailId = request.getParameter("emailid");
            String action = request.getParameter("action");

            try {
                con = Database.connect();
                st = con.createStatement();

                //If admin rejects the loan application make status as 2 in loan_application table
                if (action.equals("reject")) {
                    st.executeUpdate("update loan_application set status=2 where c_emailid='" + emailId + "' && status=0");
                } 
                //Code if admin approves the loan application
                else if (action.equals("approve")) {
                    st.executeUpdate("update loan_application set status=1 where c_emailid='" + emailId + "' && status=0");
                    rs = st.executeQuery("select * from loan_application where c_emailid='" + emailId + "' && status=1");
                    rs.next();
                    int loan_id = rs.getInt(3);
                    System.out.println(loan_id);
                    long amount = rs.getLong(5);
                    rs = st.executeQuery("select * from loan_details where id=" + loan_id);
                    rs.next();
                    float rate = rs.getFloat(4);
                    int tenure = rs.getInt(3);
                    System.out.println(rate);

                    float interestAmount = ((amount * rate) / 100);
                    float totalAmount = amount + interestAmount;
                    Date utilDate = new Date();
                    java.sql.Date date = new java.sql.Date(utilDate.getTime());
                    ps = con.prepareStatement("insert into customer_loan_details (c_emailid, loan_id, amount, total_amount, amount_receive, approved_date, status) values (?, ?, ?, ?, ?, ?, ?)");
                    ps.setString(1, emailId);
                    ps.setInt(2, loan_id);
                    ps.setLong(3, amount);
                    ps.setFloat(4, totalAmount);
                    ps.setFloat(5, 0);
                    ps.setDate(6, date);
                    ps.setInt(7, 1);
                    ps.execute();

                    float emiAmount = amount / (tenure * 12);
                    float emiInterestAmount = interestAmount / (tenure * 12);
                    float totalEmiAmount = emiAmount + emiInterestAmount;
                    ps = con.prepareStatement("insert into emi_details (c_emailid, emi_amount, interest_amount, total_amount) values (?, ?, ?, ?)");
                    ps.setString(1, emailId);
                    ps.setFloat(2, emiAmount);
                    ps.setFloat(3, emiInterestAmount);
                    ps.setFloat(4, totalEmiAmount);
                    ps.execute();
                }
                response.sendRedirect("admin/loanApplication.jsp");
            } catch (SQLException e) {
                System.out.println(e.getMessage());
                response.sendRedirect("admin/admin-index.jsp");
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