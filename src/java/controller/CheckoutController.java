/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.Product;
import model.ReturnObject;
import model.Users;
import service.OrderService;
import service.ProductService;

/**
 *
 * @author admin
 */
@WebServlet(name = "CheckoutController", urlPatterns = {"/CheckoutController"})
public class CheckoutController extends HttpServlet {

    private static final String ERROR = "checkout.jsp";
    private static final String INVOICE = "invoice.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            Users user = (Users) session.getAttribute("LOGIN_USER");
            Cart cart = (Cart) session.getAttribute("CART");
            if (cart == null) {
                request.setAttribute("CART_MESSAGE", "Cart not found");
                return;
            }
            if (cart.getCart().isEmpty()) {
                request.setAttribute("CART_MESSAGE", "Cart is empty");
                return;
            }
            String fullName = request.getParameter("fullName");
            String phoneNumber = request.getParameter("phoneNumber");
            String address = request.getParameter("address");
            String country = request.getParameter("country");
            String city = request.getParameter("city");
            String note = request.getParameter("note");
            // tim product ung voi id
            OrderService orderService = new OrderService();
            ReturnObject<?> checkCheckout = orderService.checkout(fullName, phoneNumber, address, country, city, note, cart, user);
            if (checkCheckout.isSuccess()) {
                request.setAttribute("ORDER", checkCheckout.getReturnValue());
                url = INVOICE;
                cart.resetCart();
            }
            else {
                request.setAttribute("CART_MESSAGE", checkCheckout.getReturnValue());
            }
        } catch (Exception e) {
            log("Error at AddToCartController:" + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
