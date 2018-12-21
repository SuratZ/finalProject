package shop.model;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import shop.model.Customer;
import shop.model.History;
import shop.model.OrderDetail;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-11-29T19:16:59")
@StaticMetamodel(OrderList.class)
public class OrderList_ { 

    public static volatile SingularAttribute<OrderList, String> timeStamp;
    public static volatile ListAttribute<OrderList, OrderDetail> orderDetailList;
    public static volatile SingularAttribute<OrderList, Integer> orderId;
    public static volatile ListAttribute<OrderList, History> historyList;
    public static volatile SingularAttribute<OrderList, Customer> custId;

}