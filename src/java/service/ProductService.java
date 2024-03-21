/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.ProductDAO;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;
import model.Product;
import model.ReturnObject;
import util.ImageUtils;

/**
 *
 * @author admin
 */
public class ProductService {
    private final ProductDAO productDAO;
    
    public ProductService() {
        productDAO = new ProductDAO();
    }
    
    public ReturnObject<?> insertProduct(String name, String description, double price, LocalDate year, int quantity, byte[] imageByteArray, boolean notSale) throws SQLException {
        Product product = new Product(name, price, quantity, ImageUtils.compressImage(imageByteArray), description, year, notSale);
        boolean checkInsert = productDAO.insert(product);
        if (checkInsert) return new ReturnObject<Product>(true, product);
        return new ReturnObject<String>(false, "Error inserting new product to database");
    }
    
    public ReturnObject<?> updateProduct(int id, String name, String description, double price, LocalDate year, int quantity, boolean notSale) throws SQLException {
        Product product = new Product(id, name, price, quantity, description, year, notSale);
        boolean checkUpdate = productDAO.update(product);
        if (checkUpdate) return new ReturnObject<Product>(true, product);
        return new ReturnObject<String>(false, "Error updating product to database");
    }
    
    public List<Product> searchAllProducts(String search) throws SQLException {
        return productDAO.searchAll(search);
    }
    
    public List<Product> searchProductsByNotSale(String search, boolean expectedNotSale) throws SQLException {
        return productDAO.searchByNotSale(search, expectedNotSale);
    }
    
    public Product searchProductById(int id) throws SQLException {
        return productDAO.searchById(id);
    }
    
    public ReturnObject<?> deleteProduct(int id) throws SQLException {
        boolean checkDelete = productDAO.delete(id);
        if (checkDelete) return new ReturnObject<>(true, "Delete product successfully");
        return new ReturnObject<>(false, "Error deleting product from database");
    } 
}
