/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shop.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
import shop.model.Customer;
import shop.model.History;
import shop.model.LineItem;
import shop.model.Product;
import shop.model.ShoppingCart;
import shop.model.jpa.controller.AccountJpaController;
import shop.model.jpa.controller.CustomerJpaController;
import shop.model.jpa.controller.HistoryJpaController;
import shop.model.jpa.controller.ProductJpaController;

/**
 *
 * @author Zeron
 */
public class CheckOutTestServlet extends HttpServlet {

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
        ProductJpaController productCtrl = new ProductJpaController(utx, emf);
        if (session == null) {
            request.getSession(true);
        }
        if (session.getAttribute("account") == null) {
            session.setAttribute("message", "This site required you to Login");
            getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);
        }
        HistoryJpaController historyCtrl = new HistoryJpaController(utx, emf);
        Customer cust = (Customer) session.getAttribute("customer");
        ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
        List<LineItem> c = cart.getLineItems();
        HistoryJpaController historyJpa = new HistoryJpaController(utx, emf);
        int historyId = historyJpa.getHistoryCount() + 1;

        for (LineItem lineItem : c) {
            try {
                History his = new History(new Date(), historyId, lineItem.getQuantity(), (int) Math.round(lineItem.getProduct().getPrice() * lineItem.getQuantity()),
                        cust, lineItem.getProduct());

                historyJpa.create(his);
            } catch (Exception ex) {
                Logger.getLogger(CheckOutTestServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
        session.removeAttribute("cart");
        response.sendRedirect("index.jsp");
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
