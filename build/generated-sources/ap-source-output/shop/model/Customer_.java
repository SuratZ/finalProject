package shop.model;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import shop.model.Account;
import shop.model.History;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-12-24T20:43:34")
@StaticMetamodel(Customer.class)
public class Customer_ { 

    public static volatile SingularAttribute<Customer, String> address;
    public static volatile ListAttribute<Customer, History> historyList;
    public static volatile SingularAttribute<Customer, String> name;
    public static volatile SingularAttribute<Customer, Integer> custId;
    public static volatile SingularAttribute<Customer, String> tel;
    public static volatile SingularAttribute<Customer, Account> email;
    public static volatile SingularAttribute<Customer, String> lastname;

}