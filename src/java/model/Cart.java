/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author admin
 */
public class Cart {
    private Map<Integer, ProductInCart> cart;

    public Cart() {
        cart = new HashMap<>();
    }

    public Map<Integer, ProductInCart> getCart() {
        return cart;
    }
    
    public void updateProduct(Product product, int quantity) {
        if (cart.get(product.getId())== null) {
            ProductInCart productInCart = new ProductInCart(product, quantity);
            cart.put(product.getId(), productInCart);
        }
        else {
            ProductInCart productInCart = cart.get(product.getId());
            productInCart.setProduct(product);
            productInCart.setQuantity(quantity);
        }
    }
}
