package shop.model;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import shop.model.Product;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-11-29T19:16:59")
@StaticMetamodel(Category.class)
public class Category_ { 

    public static volatile SingularAttribute<Category, String> categoryName;
    public static volatile SingularAttribute<Category, Integer> categoryId;
    public static volatile ListAttribute<Category, Product> productList;

}