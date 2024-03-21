/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.OrderDAO;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import model.Cart;
import model.Order;
import model.OrderDetails;
import model.Product;
import model.ProductInCart;
import model.ReturnObject;
import model.Users;

/**
 *
 * @author admin
 */
public class OrderService {
    private final OrderDAO orderDAO;

    public OrderService() {
        this.orderDAO = new OrderDAO();
    }
    
    public ReturnObject<?> checkout(String fullName, String phoneNumber, String address, String country, String city, String note, Cart cart, Users user) throws SQLException {
        String orderId = UUID.randomUUID().toString();
        LocalDateTime createdAt = LocalDateTime.now();
        LocalDate estimatedDeliveryDate = createdAt.toLocalDate().plusDays(5);
        Order order = new Order(orderId, user, fullName, phoneNumber, address, country, city, note, 0, 0, 0, createdAt, estimatedDeliveryDate);
        int totalQuantity = 0;
        int totalPrice = 0;
        List<OrderDetails> orderDetails = new ArrayList<>();
        for (int key : cart.getCart().keySet()) {
            ProductInCart productInCart = cart.getCart().get(key);
            Product product = productInCart.getProduct();
            totalQuantity += productInCart.getQuantity();
            totalPrice += product.getPrice() * productInCart.getQuantity();
            String orderDetailId = UUID.randomUUID().toString();
            orderDetails.add(new OrderDetails(orderDetailId, order, product, productInCart.getQuantity(), product.getPrice()));
        }
        order.setTotalQuantity(totalQuantity);
        order.setTotalPriceBeforeTax(totalPrice);
        order.setTotalPriceAfterTax(totalPrice * 1.07);
        order.setOrderDetails(orderDetails);
        
        boolean checkCreateOrder = orderDAO.createOrder(order);
        boolean checkCreateOrderDetails = false;
        for (OrderDetails orderDetail : orderDetails) {
            checkCreateOrderDetails = orderDAO.createOrderDetails(orderDetail);
            if (checkCreateOrderDetails == false) break;
        }
        boolean totalCheck = checkCreateOrder && checkCreateOrderDetails;
        if (totalCheck) return new ReturnObject<Order>(true, order);
        else return new ReturnObject<String>(false, "Error when checking out");
    }
    
    
}
