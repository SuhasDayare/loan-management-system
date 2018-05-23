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
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Suhas
 */
@WebServlet(name = "LoanDetailsUpdate", urlPatterns = {"/LoanDetailsUpdate"})
public class LoanDetailsUpdate extends HttpServlet {

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

            Connection con;
            Statement st;
            PreparedStatement ps;

            try {
                con = Database.connect();
                st = con.createStatement();

                //Check which action the admin take
                if (request.getParameter("action") != null) {
                    //Code if admin delets the loan details
                    if (request.getParameter("action").equals("delete")) {

                        String loanID = request.getParameter("id");
                        st.executeUpdate("update loan_details set status=2 where id=" + loanID);

                        response.sendRedirect("admin/loanDetails.jsp");
                    }
                } 
                //Code if admin create the new loan details
                else {
                    String loanName = request.getParameter("loanName");
                    int tenure = Integer.parseInt(request.getParameter("tenure"));
                    float rate = Float.parseFloat(request.getParameter("rate"));

                    ps = con.prepareStatement("insert into loan_details (name, tenure, rate, status) values (?, ?, ?, ?)");
                    ps.setString(1, loanName);
                    ps.setInt(2, tenure);
                    ps.setFloat(3, rate);
                    ps.setInt(4, 1);
                    ps.execute();

                    response.sendRedirect("admin/loanDetails.jsp");
                }
            } catch (SQLException e) {
                System.out.println(e.getMessage());
                response.sendRedirect("admin/loanDetails.jsp");
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