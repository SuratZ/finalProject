package shop.model;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import shop.model.Customer;
import shop.model.Product;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-12-24T20:43:34")
@StaticMetamodel(History.class)
public class History_ { 

    public static volatile SingularAttribute<History, Date> timeStamp;
    public static volatile SingularAttribute<History, Integer> quantity;
    public static volatile SingularAttribute<History, Product> productId;
    public static volatile SingularAttribute<History, Integer> orderId;
    public static volatile SingularAttribute<History, Integer> totalPrice;
    public static volatile SingularAttribute<History, Integer> historyId;
    public static volatile SingularAttribute<History, Customer> custId;

}