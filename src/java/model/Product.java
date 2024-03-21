/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.time.LocalDate;

/**
 *
 * @author admin
 */
public class Product {
    private int id;
    private String name;
    private double price;
    private int quantity;
    private byte[] image;
    private String description;
    private LocalDate year;
    private boolean notSale;
    private boolean status;

    public Product() {
    }

    public Product(int id, String name, double price, int quantity, byte[] image, String description, LocalDate year, boolean notSale, boolean status) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.image = image;
        this.description = description;
        this.year = year;
        this.notSale = notSale;
        this.status = status;
    }

    public Product(String name, double price, int quantity, byte[] image, String description, LocalDate year, boolean notSale) {
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.image = image;
        this.description = description;
        this.year = year;
        this.notSale = notSale;
        this.status = true;
    }

    public Product(int id, String name, double price, int quantity, String description, LocalDate year, boolean notSale) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.description = description;
        this.year = year;
        this.notSale = notSale;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public double getPrice() {
        return price;
    }

    public int getQuantity() {
        return quantity;
    }

    public byte[] getImage() {
        return image;
    }

    public String getDescription() {
        return description;
    }

    public LocalDate getYear() {
        return year;
    }

    public boolean isNotSale() {
        return notSale;
    }

    public boolean isStatus() {
        return status;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setYear(LocalDate year) {
        this.year = year;
    }

    public void setNotSale(boolean notSale) {
        this.notSale = notSale;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}
