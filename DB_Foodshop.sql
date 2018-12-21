DROP TABLE CATEGORY;
DROP TABLE PRODUCT;
DROP TABLE ACCOUNT;
DROP TABLE CUSTOMER;
DROP TABLE ORDER_LIST;
DROP TABLE ORDER_DETAIL;
DROP TABLE ORDER_LIST;
DROP TABLE HISTORY;
DROP TABLE CUSTOM_ORDER;


CREATE TABLE CATEGORY
(CATEGORY_ID INT,
CATEGORY_NAME VARCHAR(45),
PRIMARY KEY (CATEGORY_ID));

CREATE TABLE PRODUCT
(PRODUCT_ID VARCHAR(45),
PRODUCT_NAME VARCHAR(45),
CATEGORY_ID INT,
DETAIL clob,
PRICE DOUBLE,
IMAGE VARCHAR(45),
PRIMARY KEY (PRODUCT_ID),
FOREIGN KEY (CATEGORY_ID) REFERENCES CATEGORY(CATEGORY_ID));

create table Account
(EMAIL VARCHAR(45) NOT NULL,
PASSWORD VARCHAR(45) NOT NULL,
DATE_REGIS timestamp,
PRIMARY KEY (email));


CREATE TABLE CUSTOMER
(NAME VARCHAR(45),
LASTNAME VARCHAR(45),
CUST_ID INT GENERATED ALWAYS AS IDENTITY(START WITH 1 , INCREMENT BY 1) ,
EMAIL VARCHAR(45) ,
ADDRESS VARCHAR(500) , 
Tel varchar(10),
PRIMARY KEY (CUST_ID),
FOREIGN KEY (EMAIL) REFERENCES ACCOUNT(email));

create TABLE CUSTOM_ORDER (
customOrderNo int,
orderName varchar(50),
orderDetail clob
CUST_ID INT
PRIMARY KEY (customOrderNo),
FOREIGN KEY (CUST_ID) REFERENCES customer(CUST_ID)
);


CREATE TABLE ORDER_LIST
(ORDER_ID INT,TIME_STAMP VARCHAR(45),CUST_ID int,
PRIMARY KEY (ORDER_ID),
FOREIGN KEY (CUST_ID) REFERENCES customer(CUST_ID));


CREATE TABLE ORDER_DETAIL
(ORDER_DETAILNO INT,ORDER_ID INT,PRODUCT_ID VARCHAR(45),AMOUNT INT,TOTAL_PRICE INT,
PRIMARY KEY (ORDER_DETAILNO),
FOREIGN KEY (ORDER_ID) REFERENCES  ORDER_LIST(ORDER_ID) ,
FOREIGN KEY (PRODUCT_ID) REFERENCES    PRODUCT(PRODUCT_ID));


create table history 
(history_id int, cust_id int, time_stamp varchar(45), order_id int, history_count int, total_price int,
primary key (history_id),
Foreign key (Cust_id) references Customer(cust_id),
Foreign key (Order_id) references Order_list(order_id)
);


INSERT INTO CATEGORY (CATEGORY_ID,CATEGORY_NAME)
VALUES (1,'Rice'),(2,'Soup'),(3,'Fried'),(4,'Snack');

/*insert Dish Food */
insert into PRODUCT (PRODUCT_ID,PRODUCT_NAME,DETAIL,CATEGORY_ID,PRICE,IMAGE)
values ('R01','ข้าวผัด','ใส่ไข่ใส่หมู',1,40,'R01.jpg'),
('R02','ข้าวกระเพราไก่','ไม่ใส่ถั่วฝักยาว',1,30,'R02.jpg');


/*insert Desert Food */

/*insert CATEGORY */
insert into CATEGORY (CATEGORY_ID,CATEGORY_NAME) values
(1,'Dish'),(2,'Desert');


