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
import shop.model.Customer;
import shop.model.History;
import shop.model.jpa.controller.AccountJpaController;
import shop.model.jpa.controller.CustomerJpaController;

/**
 *
 * @author MTFBWY
 */
public class HistoryServlet extends HttpServlet {
@PersistenceUnit (unitName = "projectWebProPU")
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
            getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);
        } else {
        if(session!=null){
            CustomerJpaController custCtrl = new CustomerJpaController(utx, emf);
            Customer customerSession = (Customer)session.getAttribute("customer");
            Customer customer = custCtrl.findCustomer(customerSession.getCustId());
            List<History> history = customer.getHistoryList();
            
            session.setAttribute("history", history);
            getServletContext().getRequestDispatcher("/History.jsp").forward(request, response);
        }
        else{
            session.setAttribute("message", "Please Login");
                        getServletContext().getRequestDispatcher("/Login.jsp").forward(request, response);

        }
       
        }
    }
        
//        HttpSession session = request.getSession(false);
//        try{
//            if(session.getAttribute("cus") == null){
//                response.sendRedirect("Login");
//                return;
//            }
//        }catch(Exception ex){
//            response.sendRedirect("Login");
//            return;
//        }
//        CustomerJpaController CustJpa = new CustomerJpaController(utx, emf);
//        Customer cust = CustJpa.findCustomer(((Customer)session.getAttribute("cust")).getCustId());
//        List<History>historyList = cust.getHistoryList();
//        request.setAttribute("historyList",historyList);
//        getServletContext().getRequestDispatcher("/History.jsp").forward(request, response);
//        
//    }

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
