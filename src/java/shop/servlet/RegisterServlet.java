/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shop.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.mail.AuthenticationFailedException;
import javax.mail.Authenticator;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;
import shop.model.Account;
import shop.model.Customer;
import shop.model.jpa.controller.AccountJpaController;
import shop.model.jpa.controller.CustomerJpaController;
import shop.model.jpa.controller.exceptions.RollbackFailureException;

/**
 *
 * @author Krittaporn
 */
public class RegisterServlet extends HttpServlet {

    @PersistenceUnit(unitName = "projectWebProPU")
    EntityManagerFactory emf;

    @Resource
    UserTransaction utx;

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
            throws ServletException, IOException, RollbackFailureException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String emailRegis = request.getParameter("email");

        String passwordRegis = request.getParameter("password");
        String fnameRegis = request.getParameter("fname");
        String lnameRegis = request.getParameter("lname");
        String address = request.getParameter("address");
        String tel = request.getParameter("tel");
        HttpSession session = request.getSession(false);
        Account account = new Account(emailRegis, passwordRegis);
        Customer customer = new Customer(fnameRegis, lnameRegis, address,tel);
        if (session != null) {

            if (emailRegis != null && emailRegis.length() > 0 && passwordRegis != null && passwordRegis.length() > 0
                    && fnameRegis != null && lnameRegis != null && address != null) {
                passwordRegis = cryptWithMD5(passwordRegis);

                CustomerJpaController cusCtrl = new CustomerJpaController(utx, emf);
                AccountJpaController accJpa = new AccountJpaController(utx, emf);
                Account a = accJpa.findAccount(emailRegis);
                if (a != null) {
                    request.setAttribute("message", "This e-mail used already");
                    getServletContext().getRequestDispatcher("/Register.jsp").forward(request, response);
                    return;
                }
                if (request.getParameter("password").length() < 8) {
                    request.setAttribute("message", "password must be a least 8 characters");
                    getServletContext().getRequestDispatcher("/Register.jsp").forward(request, response);
                    return;
                }

                account.setEmail(emailRegis);
                account.setPassword(passwordRegis);
                account.setDateRegis(new Date());
                accJpa.create(account);
                customer.setName(fnameRegis);
                customer.setLastname(lnameRegis);
                customer.setAddress(address);
                customer.setEmail(account);
                customer.setTel(tel);
                cusCtrl.create(customer);
                session.setAttribute("account", account);
                request.setAttribute("message", "Register Complete!");
                getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);
            } else {
                request.setAttribute("message", "Enter form all info");
                getServletContext().getRequestDispatcher("/Register.jsp").forward(request, response);
            }

        }
        request.setAttribute("message", "");
        getServletContext().getRequestDispatcher("/Register.jsp").forward(request, response);

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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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

    public static String cryptWithMD5(String pass) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] passBytes = pass.getBytes();
            md.reset();
            byte[] digested = md.digest(passBytes);
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < digested.length; i++) {
                sb.append(Integer.toHexString(0xff & digested[i]));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException ex) {
            System.out.println(ex);
        }
        return null;
    }

    private class SMTPAuthenticator extends Authenticator {

        private PasswordAuthentication authentication;

        public SMTPAuthenticator(String login, String password) {
            authentication = new PasswordAuthentication(login, password);
        }

        @Override
        protected PasswordAuthentication getPasswordAuthentication() {
            return authentication;
        }
    }

}
