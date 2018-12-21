package shop.model;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import shop.model.Customer;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-11-29T19:16:59")
@StaticMetamodel(Account.class)
public class Account_ { 

    public static volatile SingularAttribute<Account, String> password;
    public static volatile SingularAttribute<Account, Date> activateTimestamp;
    public static volatile ListAttribute<Account, Customer> customerList;
    public static volatile SingularAttribute<Account, Date> dateRegis;
    public static volatile SingularAttribute<Account, String> email;
    public static volatile SingularAttribute<Account, String> activateKey;

}