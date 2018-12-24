package shop.model;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import shop.model.Category;
import shop.model.History;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-12-24T20:43:34")
@StaticMetamodel(Product.class)
public class Product_ { 

    public static volatile SingularAttribute<Product, String> image;
    public static volatile SingularAttribute<Product, String> productId;
    public static volatile ListAttribute<Product, History> historyList;
    public static volatile SingularAttribute<Product, Double> price;
    public static volatile SingularAttribute<Product, String> detail;
    public static volatile SingularAttribute<Product, String> productName;
    public static volatile SingularAttribute<Product, Category> categoryId;

}