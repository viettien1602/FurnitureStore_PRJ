/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.ReturnObject;
import service.ProductService;
import util.ImageUtils;

/**
 *
 * @author admin
 */
@WebServlet(name = "InsertController", urlPatterns = {"/InsertController"})
public class InsertController extends HttpServlet {

    private static final String ERROR = "admin.jsp";
    private static final String SUCCESS = "admin.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            double price = Double.parseDouble(request.getParameter("price"));
            LocalDate year = LocalDate.parse(request.getParameter("year"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            Part image = request.getPart("image");
            byte[] imageByteArray = ImageUtils.convertInputStreamToByteArray(image.getInputStream());
            boolean notSale = request.getParameter("notSale") != null && "true".equals(request.getParameter("notSale"));
            ProductService productService = new ProductService();
            ReturnObject<?> returnObject = productService.insertProduct(name, description, price, year, quantity, imageByteArray, notSale);
            if (returnObject.isSuccess()) {
                request.setAttribute("MESSAGE", "Added new product successfully");
                request.setAttribute("LIST_PRODUCT", productService.searchAllProducts(""));
            }
            else request.setAttribute("MESSAGE", returnObject.getReturnValue());
        } catch (Exception e) {
            log("Error at InsertController: " + e.toString());
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
