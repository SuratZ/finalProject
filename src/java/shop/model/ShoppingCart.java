/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shop.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Zeron
 */
public class ShoppingCart implements Serializable{

   
    private Map<String, LineItem> cart;

    public ShoppingCart() {
        cart = new HashMap();
    }

    public void add(Product p) {
        LineItem line = cart.get(p.getProductId());
        if (line == null) {
            cart.put(p.getProductId(), new LineItem(p));
        } else {
            line.setQuantity(line.getQuantity() + 1);
        }
    }
     public void lower(Product p) {
        LineItem line = cart.get(p.getProductId());
        
            line.setQuantity(line.getQuantity() - 1);
        
    }
    
    

    public void remove(Product p) {
        this.remove(p.getProductId());
    }

    public void remove(String productCode) {
        cart.remove(productCode);
    }

    public double getTotalPrice() {
        double sum = 0;
        Collection<LineItem> lineItems = cart.values();
        for (LineItem lineItem : lineItems) {
            sum += lineItem.getTotalPrice();
        }
        return sum;
    }

    public int getTotalQuantity() {
        int sum = 0;
        Collection<LineItem> lineItems = cart.values();
        for (LineItem lineItem : lineItems) {
            sum += lineItem.getQuantity();
        }
        return sum;
    }
    
    public List<LineItem> getLineItems() {
        return new ArrayList(cart.values()) ;
    }

    public void add(String productCode) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
