CREATE TABLE category(
cat_id INT AUTO_INCREMENT PRIMARY KEY,
cat_name VARCHAR(100) UNIQUE,
status TINYINT DEFAULT(1)
);

CREATE TABLE product(
id INT AUTO_INCREMENT PRIMARY KEY,
pName VARCHAR (200),
cat_id INT,
FOREIGN KEY (cat_id) REFERENCES category(cat_id),
price FLOAT CHECK(price >0),
sale_price FLOAT,
constraint CHECK(sale_price < price)
);

CREATE TABLE customer(
id_cus INT AUTO_INCREMENT PRIMARY KEY,
cus_name VARCHAR(100),
email VARCHAR(100),
birthday DATE,
gender TINYINT
);

CREATE TABLE orders(
od_id INT AUTO_INCREMENT PRIMARY KEY,
cus_id INT,
FOREIGN KEY (cus_id) REFERENCES customer(id_cus),
created DATE DEFAULT (CURRENT_DATE()),
status TINYINT
);

CREATE TABLE order_detail(
order_id INT,
FOREIGN KEY (order_id) REFERENCES orders (od_id),
product_id INT,
FOREIGN KEY (product_id) REFERENCES product(id),
PRIMARY KEY (order_id,product_id),
quantity INT,
price FLOAT
);
-- tạo mới 5 bản ghi category
INSERT INTO category(cat_name) VALUES ('categoy1');
INSERT INTO category(cat_name) VALUES ('categoy2');
INSERT INTO category(cat_name) VALUES ('categoy3');
INSERT INTO category(cat_name) VALUES ('categoy4');
INSERT INTO category(cat_name) VALUES ('categoy5');
-- tạo mới 5 bản ghi product
INSERT INTO product(pName,cat_id,price,sale_price) VALUES ('áo gucci',1,100,50);
INSERT INTO product(pName,cat_id,price,sale_price) VALUES ('áo LV',1,100,50);
INSERT INTO product(pName,cat_id,price,sale_price) VALUES ('áo Zara',1,100,49);
INSERT INTO product(pName,cat_id,price,sale_price) VALUES ('áo doremon',1,100,69);
INSERT INTO product(pName,cat_id,price,sale_price) VALUES ('áo nobita',1,100,79);
INSERT INTO product(pName,cat_id,price,sale_price) VALUES ('áo tom',1,100,39);
-- tạo mới 5 bản ghi custommer
INSERT INTO customer (cus_name,email,birthday,gender) VALUES ('viet anh','vietanh@gmail.com','1993-01-01',1);
INSERT INTO customer (cus_name,email,birthday,gender) VALUES ('Thay luan','luan@gmail.com','1993-01-01',1);
INSERT INTO customer (cus_name,email,birthday,gender) VALUES ('Minh huy','huy@gmail.com','1993-01-01',1);
INSERT INTO customer (cus_name,email,birthday,gender) VALUES ('Anh Duc','duc@gmail.com','1993-01-01',1);
INSERT INTO customer (cus_name,email,birthday,gender) VALUES ('Thay Chien','chien@gmail.com','1993-01-01',1);
-- tạo mới 5 bản ghi order
INSERT INTO orders (cus_id,status) VALUES (1,1);
INSERT INTO orders (cus_id,status) VALUES (2,1);
INSERT INTO orders (cus_id,status) VALUES (3,1);
INSERT INTO orders (cus_id,status) VALUES (4,1);
INSERT INTO orders (cus_id,status) VALUES (5,1);
-- tạo mới 5 bản ghi order_detail
INSERT INTO order_detail (order_id,product_id,quantity,price) VALUES (6,1,10,100);
INSERT INTO order_detail (order_id,product_id,quantity,price) VALUES (7,2,10,200);
INSERT INTO order_detail (order_id,product_id,quantity,price) VALUES (8,3,10,300);
INSERT INTO order_detail (order_id,product_id,quantity,price) VALUES (9,4,10,400);
INSERT INTO order_detail (order_id,product_id,quantity,price) VALUES (10,5,10,500);
-- thêm cột note vào order
alter TABLE orders ADD column note varchar(200);
-- Hiển thị danh mục có trạng thái là 1
SELECT * FROM category WHERE status = 1;
-- hiển thị thông tin sản phẩm
SELECT * FROM product;
-- hiển thị sản phẩm có giá khuyến mãi
SELECT * FROM product WHERE sale_price;
-- hiển thị sản phẩm Hiển thị sản phẩm: Id , name ,price, sale_price, percent_price(1 - (sale_price/ price) * 100)
SELECT id,pName,price,sale_price,(1 - (sale_price / price) ) * 100 as 'percent_price' FROM product;
-- cập nhật giá sản phẩm theo id = 1;
UPDATE product SET price = 150 WHERE id = 1;
-- xóa sản phẩm có id 1
DELETE FROM order_detail WHERE product_id = 1;
DELETE FROM product WHERE id =1;




