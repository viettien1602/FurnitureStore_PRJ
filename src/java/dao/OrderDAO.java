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
import java.sql.Timestamp;
import model.Order;
import model.OrderDetails;
import model.Product;
import util.DBUtils;

/**
 *
 * @author admin
 */
public class OrderDAO {
    private static String CREATE_ORDER = "insert into [Order](id, userId, fullName, phoneNumber, address, country, city, note, totalQuantity, totalPriceBeforeTax, totalPriceAfterTex, createdAt, estimatedDeliveryDate, status) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static String CREATE_ORDERDETAILS = "insert into OrderDetails(id, orderId, productId, quantity, price) values(?, ?, ?, ?, ?)";
    
    public boolean createOrder(Order order) throws SQLException {
        boolean check = false;
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(CREATE_ORDER);
                ptm.setString(1, order.getId());
                ptm.setInt(2, order.getUser().getId());
                ptm.setString(3, order.getFullName());
                ptm.setString(4, order.getPhoneNumber());
                ptm.setString(5, order.getAddress());
                ptm.setString(6, order.getCountry());
                ptm.setString(7, order.getCity());
                ptm.setString(8, order.getNote());
                ptm.setInt(9, order.getTotalQuantity());
                ptm.setDouble(10, order.getTotalPriceBeforeTax());
                ptm.setDouble(11, order.getTotalPriceAfterTax());
                ptm.setTimestamp(12, Timestamp.valueOf(order.getCreatedAt()));
                ptm.setDate(13, Date.valueOf(order.getEstimatedDeliveryDate()));
                ptm.setBoolean(14, order.getStatus());
                check = ptm.executeUpdate() > 0;                    
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            if (rs != null) rs.close();
            if (ptm != null) ptm.close();
            if (con != null) con.close();
        }
        return check;
    }
    
    public boolean createOrderDetails(OrderDetails orderDetails) throws SQLException {
        boolean check = false;
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(CREATE_ORDERDETAILS);
                ptm.setString(1, orderDetails.getId());
                ptm.setString(2, orderDetails.getOrder().getId());
                ptm.setInt(3, orderDetails.getProduct().getId());
                ptm.setInt(4, orderDetails.getQuantity());
                ptm.setDouble(5, orderDetails.getPrice());
                check = ptm.executeUpdate() > 0;                    
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            if (rs != null) rs.close();
            if (ptm != null) ptm.close();
            if (con != null) con.close();
        }
        return check;
    }
}
