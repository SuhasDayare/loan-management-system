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
@WebServlet(name = "PayEMI", urlPatterns = {"/PayEMI"})
public class PayEMI extends HttpServlet {

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
            
            HttpSession session = request.getSession();
            String emailid = "";

            //Check whether admin is collecting payment or not
            boolean admin = false;
            if (request.getParameter("admin") != null) {
                admin = true;
                emailid = request.getParameter("emailID");
                System.out.println(emailid);
            }

            //Get form data
            String emidate = request.getParameter("emidate");
            String paymentdate = request.getParameter("paymentdate");

            int emiamount = Integer.parseInt(request.getParameter("emiamount"));
            int latefine = Integer.parseInt(request.getParameter("latefine"));
            int totalpayment = Integer.parseInt(request.getParameter("totalpayment"));

            //If customer is paying directly from bank account, get the related info
            int bankAccNo = 0;
            String password = "";
            if (request.getParameter("bankAccNo") != null) {

                bankAccNo = Integer.parseInt(request.getParameter("bankAccNo"));
                password = request.getParameter("password");
                emailid = session.getAttribute("username").toString();
            }
            int totalemipaid = Integer.parseInt(request.getParameter("totalemipaid"));
            totalemipaid++;

            Connection con;
            PreparedStatement ps;
            Statement st;
            ResultSet rs;

            try {
                con = Database.connect();
                st = con.createStatement();
                //Update the balance in bank account
                int i = st.executeUpdate("update bank_details set balance= balance - " + totalpayment + " where acc_no=" + bankAccNo + " && password='" + password + "'");
                
                //if balance is updated or payment is made through admin then proceed
                if (i > 0 || admin) {
                    st.execute("update customer_loan_details set amount_receive = amount_receive + " + totalpayment + " where c_emailid='" + emailid + "'");

                    ps = con.prepareStatement("insert into paid_emi (c_emailid, amount, payment_date, receive_date, late_fine, total_emi_paid) values (?, ?, ?, ?, ?, ?)");

                    ps.setString(1, emailid);
                    ps.setFloat(2, emiamount);
                    ps.setString(3, emidate);
                    ps.setString(4, paymentdate);
                    ps.setFloat(5, latefine);
                    ps.setFloat(6, totalemipaid);

                    ps.execute();
                }
                if (admin) {
                    response.sendRedirect("admin/receivePayment.jsp?emailid=" + emailid);
                } else {
                    response.sendRedirect("emiDetails.jsp");
                }
            } catch (SQLException e) {
                System.out.println(e.getMessage());
                System.out.println(e.getStackTrace());
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