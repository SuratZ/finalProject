/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shop.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
import shop.model.LineItem;
import shop.model.OrderDetail;
import shop.model.OrderList;
import shop.model.ShoppingCart;
import shop.model.jpa.controller.AccountJpaController;
import shop.model.jpa.controller.CustomerJpaController;
import shop.model.jpa.controller.OrderDetailJpaController;
import shop.model.jpa.controller.OrderListJpaController;
import shop.model.jpa.controller.ProductJpaController;
import shop.model.jpa.controller.exceptions.RollbackFailureException;

/**
 *
 * @author Krittaporn
 */
public class CheckOutServlet extends HttpServlet {
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
       HttpSession session = request.getSession(false);
        ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
                Account account = (Account) session.getAttribute("account");

        CustomerJpaController cusCtrl = new CustomerJpaController(utx, emf);
        Customer customer = cusCtrl.findByEmail(account.getEmail());
        AccountJpaController accounttrl = new AccountJpaController(utx, emf);
        ProductJpaController prodCtrl = new ProductJpaController(utx, emf);
        OrderListJpaController olCtrl = new OrderListJpaController(utx, emf);
        OrderDetailJpaController odCtrl = new OrderDetailJpaController(utx, emf);
        OrderDetail od = new OrderDetail();
        OrderList ol = new OrderList();
        if (session != null) {
            ol.setTimeStamp(new Date()+"");
            ol.setCustId(customer);
            olCtrl.create(ol);
            List<LineItem> items = cart.getLineItems();
            List<OrderDetail> odList = new ArrayList<OrderDetail>();
            for (LineItem itemsInCart : items) {
                od.setOrderId(ol);
                od.setProductId(itemsInCart.getProduct());
                od.setAmount(itemsInCart.getQuantity());
                odCtrl.create(od);
                odList.add(od);
                ol.setOrderDetailList(odList);
            }
        }
        session.setAttribute("account", account);
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
    try {
        processRequest(request, response);
    } catch (Exception ex) {
        Logger.getLogger(CheckOutServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        Logger.getLogger(CheckOutServlet.class.getName()).log(Level.SEVERE, null, ex);
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

}
