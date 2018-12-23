/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shop.model;

import java.io.Serializable;
import shop.model.Product;

public class LineItem implements Serializable {

    private Product product;
    private Category category;
    private double salePrice;
    private int quantity;
    private String categoryName;

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public LineItem(Category category, String categoryName) {
        this.category = category;
        this.categoryName = categoryName;
    }

    public LineItem() {

    }

    public LineItem(Product product) {
        this(product, 1) ;
    }

    public LineItem(Product product, int quantity) {
        this.product = product;
        this.quantity = quantity;

    }
    
    public LineItem(Product product, int quantity,Category category) {
        this.product = product;
        this.quantity = quantity;
        this.category = category;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public double getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(double salePrice) {
        this.salePrice = salePrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    public double getTotalPrice() {
        return quantity * salePrice ;
    }
}
