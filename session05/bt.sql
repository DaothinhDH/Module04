create database bt_view_ss05;
use bt_view_ss05;
create table customer(
	cID int primary key auto_increment,
    cName varchar(255),
    cAge int
);
create table orders(
	oID int primary key auto_increment,
    cID int,
    foreign key(cID) references customer(cID),
    oDate date,
    oTotalPrice float,
    status bit(2)
);
create table products(
	pID int primary key auto_increment,
    pName varchar(255),
    pPrice float
);
create table order_detail(
	oID int,
    foreign key(oID) references orders(oID),
    pID int,
    foreign key(pID) references products(pID),
    primary key(oID,pID),
    odQty int
);
-- tạo bản ghi
INSERT INTO Customer (cID, cName, cAge)
VALUES (1, 'Minh Quan', 10),
       (2, 'Ngoc Oanh', 20),
       (3, 'Hong Ha', 50);
INSERT INTO orders (cID, oDate,status)
VALUES (1, '2023-11-16',0),
       (2, '2023-12-16',2),
       (3, '2023-10-16',1);
INSERT INTO products (pID, pName, pPrice)
VALUES (1, ' Máy Giặt', 3),
       (2, 'Tu Lạnh ', 5),
       (3, 'Điều hòa', 7),
       (4, 'Quạt', 7),
       (5, 'Bếp điện', 7);
INSERT INTO order_detail (oID, pID, odQty)
VALUES (1, 1, 3),
       (1, 3, 7),
       (1, 4, 2),
       (2, 1, 1),	
       (3, 1, 8),
       (2, 5, 4),
       (2, 3, 3);
       
-- thực hiện chỉ mục trên trường name,bảng customer
CREATE UNIQUE INDEX idx_customer_cNamme ON customer(cName);
-- - Tạo view hiển thị danh sách đơn hàng (case when )  id , userName , status 
CREATE VIEW od_view AS
SELECT o.oID AS ID,c.cName AS userName,
    CASE
        WHEN o.status = 0 THEN 'đang chờ xử lý'
        WHEN o.status = 1 THEN 'đang giao hàng'
        WHEN o.status = 2 THEN 'đã hoàn tất'
        ELSE 'OK'
    END AS trang_thai
FROM orders AS o
JOIN customer AS c ON o.cID = c.cID;
SELECT * FROM bt_view_ss05.od_view;
-- - Tạo thủ tục thêm mới sản phẩm
delimiter &&
CREATE PROCEDURE add_new_product(IN pName VARCHAR(100),IN pPrice FLOAT)
BEGIN
INSERT INTO products (pName,pPrice)
VALUES (pName,pPrice);
end;
&&
CALL add_new_product('Xoài',10);
-- Tạo thủ tục lấy ra 5 sản phẩm có giá cao nhất 
delimiter &&
CREATE PROCEDURE get_product()
BEGIN
SELECT * FROM products
ORDER BY pPrice DESC
LIMIT 3;
END
&&
CALL get_product();
DROP PROCEDURE get_product;

-- - Tạo thủ tục cập nhật
delimiter &&
CREATE PROCEDURE uppdate_products( IN id INT,IN new_name VARCHAR(100))
BEGIN
UPDATE  products SET pName = new_name WHERE pID = id;
end;
&&
CALL uppdate_products(1,'Thinh');
-- - Tạo thủ tục xóa sản phẩm : 
  delimiter &&
CREATE PROCEDURE delete_products( IN id INT)
BEGIN
DELETE FROM products WHERE pID = id;
end;
&&
CALL delete_products(4);





