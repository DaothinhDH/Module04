CREATE DATABASE session3;

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
INSERT INTO order_detail (order_id, product_id, quantity, price) VALUES (1, 1, 2, 100);

SELECT o.od_id,c.cus_name,o.created,o.status
FROM customer as c
JOIN orders as o
ON o.cus_id = c.id_cus;

-- hiển thị chi tiết đơn hàng

SELECT o.order_id,p.pName, o.quantity, p.price,(p.price * o.quantity) as total_price
FROM order_detail as o
JOIN product as p
ON o.product_id = p.id WHERE order_id =1;

-- lấy tất cả bản ghi product (id,name,price,categpry_name);
SELECT product.id,product.pName,product.price,category.cat_name as category_name 
FROM product 
JOIN category
ON category.cat_id = product.cat_id order by price asc; -- sắp xếp tiền

-- đếm số sản phẩm
SELECT COUNT(*) FROM product;
-- đếm tổng tiền
SELECT SUM(price) FROM product;
-- tìm nhỏ nhất
SELECT MIN(price) FROM product;

-- lấy ra danh sách dsanh mục gồm id ,name,total_product
SELECT c.*,COUNT(*) as total_product
FROM category as c
JOIN product as p
ON c.cat_id = p.cat_id
GROUP BY c.cat_id;














