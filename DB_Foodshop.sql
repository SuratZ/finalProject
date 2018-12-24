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
customOrderID int GENERATED ALWAYS AS IDENTITY(START WITH 1 , INCREMENT BY 1),
CATEGORY_ID INT,
DETAIL clob,
CUST_ID INT
PRIMARY KEY (customOrderID),
FOREIGN KEY (CUST_ID) REFERENCES customer(CUST_ID),
FOREIGN KEY (CATEGORY_ID) REFERENCES CATEGORY(CATEGORY_ID),
FOREIGN KEY (CUST_ID) references Customer(cust_id)
);


create table history 
(history_id int GENERATED ALWAYS AS IDENTITY(START WITH 1 , INCREMENT BY 1) ,
 cust_id int,
 PRODUCT_ID VARCHAR(45),
 time_stamp varchar(45),
 order_id int,
 quantity int,
 total_price int,
primary key (history_id),
Foreign key (Cust_id) references Customer(cust_id),
FOREIGN KEY (PRODUCT_ID) references PRODUCT(PRODUCT_ID)
);



/*insert Dish Food */
insert into PRODUCT (PRODUCT_ID,PRODUCT_NAME,DETAIL,CATEGORY_ID,PRICE,IMAGE)
values ('R01','ข้าวผัด','ใส่ไข่ใส่หมู',1,40,'R01.jpg'),
('R02','ข้าวกระเพราไก่','ไม่ใส่ถั่วฝักยาว',1,30,'R02.jpg'),
('R03','ข้าวไข่ข้นซอสต้มยำ','อร่อยๆ 03',1,50,'R03.jpg'),
('R04','ข้าวคลุกกะปิ','อร่อย 04',1,50,'R04.jpg'),
('R05','ข้าวผัดทะเล','อร่อย 05',1,60,'R05.jpg'),
('R06','ข้าวไข่ระเบิด','อร่อย 06',1,40,'R06.jpg'),
('R07','ราดหน้าทะเลเส้นใหญ่กรอบ','อร่อย 07',1,60,'R07.jpg'),
('R08','ข้าวผัดต้มยำไข่เค็ม','อร่อย 08',1,60,'R08.jpg');


/*insert Desert Food */

/*insert CATEGORY */
insert into CATEGORY (CATEGORY_ID,CATEGORY_NAME) values
(1,'Dish'),(2,'Desert'),(3,'Custom');



