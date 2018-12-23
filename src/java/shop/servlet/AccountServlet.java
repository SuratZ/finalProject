/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shop.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;
import shop.model.Account;
import static shop.model.Account_.email;
import static shop.model.Account_.password;
import shop.model.Customer;
import shop.model.Product;
import shop.model.jpa.controller.AccountJpaController;
import shop.model.jpa.controller.CustomerJpaController;
import shop.model.jpa.controller.ProductJpaController;

/**
 *
 * @author Zeron
 */
public class AccountServlet extends HttpServlet {
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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
       
        if (session.getAttribute("account") == null) {
            session.setAttribute("message", "This site required you to Login");
            getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);
        } else {
            //String accountEmail = request.getParameter("email");
            Account accountsession = (Account)session.getAttribute("account");
            AccountJpaController accountCtrl = new AccountJpaController(utx, emf);
            Account account = accountCtrl.findAccount(accountsession.getEmail());
   
            CustomerJpaController customerCtrl = new CustomerJpaController(utx, emf);
            System.out.println(account.getEmail());
            Customer customer = customerCtrl.findByEmail(account.getEmail());
            
            System.out.println(customer);
            
            /*session.setAttribute("account", customer);*/
            
            
            getServletContext().getRequestDispatcher("/Account.jsp").forward(request, response);
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
