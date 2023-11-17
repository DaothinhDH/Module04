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
    oTotalPrice float
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
INSERT INTO orders (cID, oDate)
VALUES (1, '2023-11-16'),
       (2, '2023-12-16'),
       (2, '2023-10-16');
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

-- Hiển thị các thông tin gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order,
-- danh sách phải sắp xếp theo thứ tự ngày tháng,
SELECT * FROM orders;
-- Hiển thị tên và giá của các sản phẩm có giá cao nhất
SELECT p.pName ,p.pPrice 
FROM products as p
WHERE p.pPrice >= all(SELECT p2.pPrice FROM products p2);
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách đó 
SELECT c.cName,p.pName 
FROM customer as c
JOIN orders as o ON c.cID = o.cID
JOIN order_detail as od ON od.oID = od.oID
JOIN products as p ON od.pID = p.pID
GROUP BY c.cName,p.pName;
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
SELECT c.cName 
FROM customer as c
left JOIN orders as o ON o.cID = c.cID
WHERE o.cID is NULL;

-- Hiển thị chi tiết của từng hóa đơn
SELECT o.oID, o.oDate, od.odQty, p.pName, pPrice
FROM orders as o
JOIN order_detail as od ON o.oID = od.oID
JOIN products as p ON p.pID = od.pID
GROUP BY o.oID, o.oDate, od.odQty, p.pName, pPrice;
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn 
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. 
-- Giá bán của từng loại được tính = odQTY*pPrice)

SELECT o.oID, o.oDate, SUM(od.odQty * p.pPrice) as Totalprice
FROM orders as o
JOIN order_detail as od ON o.oID = od.oID
JOIN products as p ON od.pID = p.pID
GROUP BY  o.oID,o.oDate





