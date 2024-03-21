/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

/**
 *
 * @author admin
 */
public class Order {
    private String id;
    private Users user;
    private String fullName;
    private String phoneNumber;
    private String address;
    private String country;
    private String city;
    private String note;
    private int totalQuantity;
    private double totalPriceBeforeTax;
    private double totalPriceAfterTax;
    private LocalDateTime createdAt;
    private LocalDate estimatedDeliveryDate;
    private boolean status;
    private List<OrderDetails> orderDetails;

    public Order() {
    }
    
    

    public Order(String id, Users user, String fullName, String phoneNumber, String address, String country, String city, String note, int totalQuantity, double totalPriceBeforeTax, double totalPriceAfterTax, LocalDateTime createdAt, LocalDate estimatedDeliveryDate) {
        this.id = id;
        this.user = user;
        this.fullName = fullName;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.country = country;
        this.city = city;
        this.note = note;
        this.totalQuantity = totalQuantity;
        this.totalPriceBeforeTax = totalPriceBeforeTax;
        this.totalPriceAfterTax = totalPriceAfterTax;
        this.createdAt = createdAt;
        this.estimatedDeliveryDate = estimatedDeliveryDate;
        this.status = true;
    }

    public String getId() {
        return id;
    }

    public Users getUser() {
        return user;
    }

    public String getFullName() {
        return fullName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public String getCountry() {
        return country;
    }

    public String getCity() {
        return city;
    }

    public String getNote() {
        return note;
    }

    public int getTotalQuantity() {
        return totalQuantity;
    }

    public double getTotalPriceBeforeTax() {
        return totalPriceBeforeTax;
    }

    public double getTotalPriceAfterTax() {
        return totalPriceAfterTax;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public LocalDate getEstimatedDeliveryDate() {
        return estimatedDeliveryDate;
    }

    public boolean getStatus() {
        return status;
    }

    public List<OrderDetails> getOrderDetails() {
        return orderDetails;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setUser(Users user) {
        this.user = user;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public void setTotalQuantity(int totalQuantity) {
        this.totalQuantity = totalQuantity;
    }

    public void setTotalPriceBeforeTax(double totalPriceBeforeTax) {
        this.totalPriceBeforeTax = totalPriceBeforeTax;
    }

    public void setTotalPriceAfterTax(double totalPriceAfterTax) {
        this.totalPriceAfterTax = totalPriceAfterTax;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public void setEstimatedDeliveryDate(LocalDate estimatedDeliveryDate) {
        this.estimatedDeliveryDate = estimatedDeliveryDate;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public void setOrderDetails(List<OrderDetails> orderDetails) {
        this.orderDetails = orderDetails;
    }
    
}
