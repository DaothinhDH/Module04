create table customer(
c_id int primary key auto_increment,
c_name varchar(25) not null,
c_age tinyint
);
create table orders(
o_id int primary key auto_increment,
c_id int,
foreign key (c_id) references customer(c_id),
o_date date,
o_total_price int
);
create table product(
p_id int primary key auto_increment,
p_name varchar(50),
p_price int check (p_price>0)
);

create table order_detail(
o_id int,
foreign key (o_id) references orders(o_id),
p_id int,
foreign key (p_id) references product(p_id),
o_quantity int
);

INSERT INTO customer(c_name,c_age)
VALUES ( 'A', 10),
       ( 'B', 20),
       ( 'C', 50);
    
INSERT INTO orders(c_id,o_date)
VALUES ( '1', '2006-03-21'),
       ( '2', '2006-03-23'),
       ( '1', '2006-03-16');    
       
INSERT INTO product(p_name,p_price)
VALUES ( 'May giat', 3),
       ( 'Tu lanh', 5),
       ( 'Dieu hoa', 7), 
       ( 'Quat', 7), 
       ( 'Bep dien', 7);

INSERT INTO order_detail(o_id,p_id,o_quantity)
VALUES ( 1,'1', 3),
       ( 1,'3', 7),
       ( 1,'4', 2),
       ( 2,'1', 1),
       ( 3,'1', 8),
       ( 2,'5', 4),
       ( 2,'3', 3);
-- Hiển thị các thông tin gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
SELECT o.o_id,o.o_date,SUM(p.p_price * od.o_quantity) as oPrice 
FROM orders as o
JOIN order_detail as od
ON o.o_id = od.o_id
JOIN product as p
ON p.p_id = od.p_id
GROUP BY o.o_id;
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
SELECT c.c_name
FROM customer as c
LEFT JOIN orders as o
ON c.c_id = o.c_id
WHERE o.o_id IS NULL;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)

SELECT o.o_id,o.o_date, SUM(p.p_price * od.o_quantity) as total_price
FROM orders as o
JOIN order_detail as od 
ON o.o_id = od.o_id
JOIN product as p 
ON p.p_id = od.p_id
GROUP BY o.o_id

       
       
       
       
       