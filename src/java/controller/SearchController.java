/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Product;
import model.Users;
import org.apache.tomcat.util.codec.binary.Base64;
import service.ProductService;

/**
 *
 * @author admin
 */
@WebServlet(name = "SearchController", urlPatterns = {"/SearchController"})
public class SearchController extends HttpServlet {

    private static final String ERROR_US = "home.jsp";
    private static final String SUCCESS_US = "home.jsp";
    private static final String ERROR_AD = "admin.jsp";
    private static final String SUCCESS_AD = "admin.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url;
        HttpSession session = request.getSession();
        Users loginUser = (Users) session.getAttribute("LOGIN_USER");
        String roleId = loginUser.getRole().getId();
        if (roleId.equals("US")) url = ERROR_US;
        else url = ERROR_AD;
        
        try {
            String search = request.getParameter("search");
            ProductService productService = new ProductService();
            if (roleId.equals("AD")) {
                List<Product> listProduct = productService.searchAllProducts(search);
                request.setAttribute("LIST_PRODUCT", listProduct);
                url = SUCCESS_AD;
            }
            else {
                request.setAttribute("LIST_PRODUCT", productService.searchProductsByNotSale(search, false));
                url = SUCCESS_US;
            }
        }
        catch (Exception e) {
            log("Error at SearchController: " + e.toString());
        }
        finally {
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
