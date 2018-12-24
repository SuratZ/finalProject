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
CUST_ID INT,
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
('R08','ข้าวผัดต้มยำไข่เค็ม','อร่อย 08',1,60,'R08.jpg')
('R09','ข้าวหมูแดง','อร่อย 09',1,40,'R09.jpg'),
('R10','สุกี้ทะเลแห้ง','อร่อย 10',1,60,'R10.jpg'),
('R11','ลอดช่อง','อร่อย 11',2,20,'R11.jpg'),
('R12','วุ้นเป็ด','อร่อย 12',2,30,'R12.jpg'),
('R13','ทาร์ตไข่','อร่อย 13',2,10,'R13.jpg'),
('R14','ขนมถ้วย','อร่อย 14',2,2,'R14.jpg'),
('R15','ขนมชั้น','อร่อย 15',2,5,'R15.jpg'),
('R16','ข้าวไก่เทอริยากิ','อร่อย 16',1,50,'R16.jpg'),
('R17','ข้าวหน้าหมูเกาหลี','อร่อย 17',1,70,'R17.jpg'),
('R18','ข้าวเหนียวมะม่วง','อร่อย 18',2,30,'R18.jpg'),
('R19','สาคูกะทิ','อร่อย 19',2,20,'R19.jpg'),
('R20','เค้กนมสด','อร่อย 20',2,30,'R20.jpg'),
('R21','เครปเค้กวานิลลา','อร่อย 21',2,50,'R21.jpg'),
('R22','ไอติมกะทิ','อร่อย 22',2,25,'R22.jpg'),
('R23','ขนมครก','อร่อย 23',2,20,'R23.jpg')
;


/*insert Desert Food */

/*insert CATEGORY */
insert into CATEGORY (CATEGORY_ID,CATEGORY_NAME) values
(1,'Dish'),(2,'Desert'),(3,'Custom');



