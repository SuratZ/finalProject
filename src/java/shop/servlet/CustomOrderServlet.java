/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shop.servlet;

import java.io.IOException;
import java.util.Date;
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
import shop.model.Category;
import shop.model.Customer;
import shop.model.History;
import shop.model.Product;
import shop.model.ShoppingCart;
import shop.model.jpa.controller.CategoryJpaController;
import shop.model.jpa.controller.ProductJpaController;

/**
 *
 * @author Zeron
 */
public class CustomOrderServlet extends HttpServlet {
@PersistenceUnit(unitName = "projectWebProPU")
    EntityManagerFactory emf;
    @Resource
    UserTransaction utx;
    Category categoryId;
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
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();

        ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
        if(cart == null){
            cart = new ShoppingCart();
            session.setAttribute("cart", cart);
        }
        String customId = request.getParameter("customID");
        String optionOrder = request.getParameter("optionOrder");
        int customIdInt = Integer.parseInt(customId);
        if(customIdInt>=0){
            customIdInt++;
            session.setAttribute("customId", customIdInt);
        }
        String productDetail = request.getParameter("optionOrder");
        int productId = 0;
        session.setAttribute("productCode", customId);
        session.setAttribute("productName", "custom-Order");
        session.setAttribute("productDetail", optionOrder);
        CategoryJpaController catCtrl = new CategoryJpaController(utx, emf);
       
   
        ProductJpaController productCtrl = new ProductJpaController(utx, emf);
        
        
        try {
                Product pro = new Product("customOrder.jpg","C"+(productId++),"CustomOrder",new Category(3),productDetail, 50.0);
                productCtrl.create(pro);
                cart.add(pro);
            } catch (Exception ex) {
                Logger.getLogger(CheckOutTestServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        
        
//        session.setAttribute("message", "");
//        String customOrder = request.getParameter("orderName");
//            String customeOrderDetail = request.getParameter("orderDetail");
//            OrderList orderlist = (OrderList) session.getAttribute("orderlist");
//            if (orderlist == null) {
//                orderlist = new OrderList();
//                session.setAttribute("orderlist", orderlist);
//            }
//            OrderListJpaController orderlistCtrl = new OrderListJpaController(utx, emf);
//            String productId = request.getParameter("productId");
//            ProductJpaController proJpa = new ProductJpaController(utx, emf);
//            Product product = proJpa.findProduct(productId);
//            session.setAttribute("product", product); //???
//            try {
//                orderlistCtrl.create(orderlist);
//            } catch (RollbackFailureException ex) {
//                Logger.getLogger(AddItemToCartServlet.class.getName()).log(Level.SEVERE, null, ex);
//            } catch (Exception ex) {
//                Logger.getLogger(AddItemToCartServlet.class.getName()).log(Level.SEVERE, null, ex);
//            }
            response.sendRedirect("CustomOrder.jsp");
        
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
