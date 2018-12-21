package shop.model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import shop.model.Customer;
import shop.model.OrderList;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-11-29T19:16:59")
@StaticMetamodel(History.class)
public class History_ { 

    public static volatile SingularAttribute<History, String> timeStamp;
    public static volatile SingularAttribute<History, Integer> totalPrice;
    public static volatile SingularAttribute<History, OrderList> orderId;
    public static volatile SingularAttribute<History, Integer> historyId;
    public static volatile SingularAttribute<History, Customer> custId;
    public static volatile SingularAttribute<History, Integer> historyCount;

}