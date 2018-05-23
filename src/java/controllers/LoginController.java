/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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
@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

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

            con = Database.connect();

            //Get form data
            String emailid = request.getParameter("id");
            String password = request.getParameter("password");

            //Check who is login, admin or customer and redirect them as appropriate
            if (request.getParameter("admin") != null) {
                try {
                    st = con.createStatement();
                    ResultSet rs;
                    rs = st.executeQuery("select * from admin_details where email_id='" + emailid + "' && password='" + password + "'");
                    if (rs.next()) {
                        HttpSession session = request.getSession();
                        session.setAttribute("adminname", emailid);

                        response.sendRedirect("admin/admin-index.jsp");
                    } else {
                        response.sendRedirect("login.jsp?error=Wrong emailId or password");
                    }
                } catch (SQLException | NullPointerException e) {
                    System.out.println(e.getMessage());
                    response.sendRedirect("login.jsp?error=Ooops Something Went Wrong!!! Please try again.");
                }
            } else {
                try {
                    st = con.createStatement();
                    ResultSet rs;
                    rs = st.executeQuery("select name from customer_details where email_id='" + emailid + "' && password='" + password + "'");
                    if (rs.next()) {
                        HttpSession session = request.getSession();
                        session.setAttribute("username", emailid);

                        response.sendRedirect("index.jsp");
                    } else {
                        response.sendRedirect("login.jsp?error=Wrong emailId or password");
                    }
                } catch (SQLException e) {
                    System.out.println(e.getMessage());
                    response.sendRedirect("login.jsp?error=Something Went Wrong!!! Please try again.");
                }
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