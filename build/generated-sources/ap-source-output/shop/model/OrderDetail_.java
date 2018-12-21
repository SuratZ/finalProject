package shop.model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import shop.model.OrderList;
import shop.model.Product;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-11-29T19:16:59")
@StaticMetamodel(OrderDetail.class)
public class OrderDetail_ { 

    public static volatile SingularAttribute<OrderDetail, Integer> amount;
    public static volatile SingularAttribute<OrderDetail, Integer> orderDetailno;
    public static volatile SingularAttribute<OrderDetail, Product> productId;
    public static volatile SingularAttribute<OrderDetail, Integer> totalPrice;
    public static volatile SingularAttribute<OrderDetail, OrderList> orderId;

}