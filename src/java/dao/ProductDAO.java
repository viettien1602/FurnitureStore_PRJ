/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import model.Product;
import util.DBUtils;
import util.ImageUtils;

/**
 *
 * @author admin
 */
public class ProductDAO {

    private static final String INSERT = "insert into Product(name, price, quantity, image, description, year, notSale) values (?, ?, ?, ?, ?, ?, ?)";
    private static final String UPDATE = "update Product set name = ?, price = ?, quantity = ?, description = ?, year = ?, notSale = ? where id = ? and status = 1"; 
    private static final String SEARCH_ALL = "select id, name, price, quantity, image, description, year, notSale, status from Product where name like ? and status = 1";
    private static final String SEARCH_BY_NOT_SALE = "select id, name, price, quantity, image, description, year, notSale, status from Product where name like ? and notSale = ? and status = 1";
    private static final String DELETE = "update Product set status = 0 where id = ?";
    private static final String SEARCH_BY_ID = "select id, name, price, quantity, image, description, year, notSale, status from Product where id = ? and notSale = 0 and status = 1";

    public boolean insert(Product product) throws SQLException {
        boolean check = false;
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(INSERT);
                ptm.setString(1, product.getName());
                ptm.setDouble(2, product.getPrice());
                ptm.setInt(3, product.getQuantity());
                ptm.setBytes(4, product.getImage());
                ptm.setString(5, product.getDescription());
                ptm.setDate(6, Date.valueOf(product.getYear()));
                ptm.setBoolean(7, product.isNotSale());
                check = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return check;
    }

    public boolean update(Product product) throws SQLException {
        boolean check = false;
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(UPDATE);
                ptm.setString(1, product.getName());
                ptm.setDouble(2, product.getPrice());
                ptm.setInt(3, product.getQuantity());
                ptm.setString(4, product.getDescription());
                ptm.setDate(5, Date.valueOf(product.getYear()));
                ptm.setBoolean(6, product.isNotSale());
                ptm.setInt(7, product.getId());
                check = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return check;
    }

    public List<Product> searchAll(String search) throws SQLException {
        List<Product> listProduct = new ArrayList<>();
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(SEARCH_ALL);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    byte[] imageByteArray = rs.getBytes("image");
                    String description = rs.getString("description");
                    LocalDate year = rs.getDate("year").toLocalDate();
                    boolean notSale = rs.getBoolean("notSale");
                    boolean status = rs.getBoolean("status");
                    listProduct.add(new Product(id, name, price, quantity, ImageUtils.decompressImage(imageByteArray), description, year, notSale, status));
                }
            }
        } catch (Exception e) {

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return listProduct;
    }

    public List<Product> searchByNotSale(String search, boolean expectedNotSale) throws SQLException {
        List<Product> listProduct = new ArrayList<>();
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(SEARCH_BY_NOT_SALE);
                ptm.setString(1, "%" + search + "%");
                ptm.setInt(2, expectedNotSale == true ? 1 : 0);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    byte[] imageByteArray = rs.getBytes("image");
                    String description = rs.getString("description");
                    LocalDate year = rs.getDate("year").toLocalDate();
                    boolean notSale = rs.getBoolean("notSale");
                    boolean status = rs.getBoolean("status");
                    listProduct.add(new Product(id, name, price, quantity, ImageUtils.decompressImage(imageByteArray), description, year, notSale, status));
                }
            }
        } catch (Exception e) {

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return listProduct;
    }

    public Product searchById(int id) throws SQLException {
        Product product = null;
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(SEARCH_BY_ID);
                ptm.setInt(1, id);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String name = rs.getString("name");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    byte[] imageByteArray = rs.getBytes("image");
                    String description = rs.getString("description");
                    LocalDate year = rs.getDate("year").toLocalDate();
                    boolean notSale = rs.getBoolean("notSale");
                    boolean status = rs.getBoolean("status");
                    product = new Product(id, name, price, quantity, ImageUtils.decompressImage(imageByteArray), description, year, notSale, status);
                }
            }
        } catch (Exception e) {

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return product;
    }

    public boolean delete(int id) throws SQLException {
        boolean check = false;
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(DELETE);
                ptm.setInt(1, id);
                check = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return check;
    }
}
