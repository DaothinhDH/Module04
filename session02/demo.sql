CREATE DATABASE session02;
USE session02;
CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(40),
    address VARCHAR(255),
    email VARCHAR(255)
);

CREATE TABLE orders (
    id INT AUTO_INCREMENT,
    staff VARCHAR(50),
    PRIMARY KEY(id),
    customers_id INT,
    FOREIGN KEY(customers_id) REFERENCES customers(id)
);
insert into orders (staff,customers_id) -- chèn dũ liệu mới vào bảng
values('thinh',1);
update orders  -- cập nhật giá trị mới của bản ghi
set staff = 'ccc'
where id = 2;
delete from orders -- xóa ban ghi
where id = 2;

ALTER TABLE orders
ADD COLUMN new_dess VARCHAR(50) NOT NULL; -- thêm mới 1 cột
alter table orders
modify column new_dess varchar (55) null; -- sửa 1 cột
alter table orders
drop column new_dess;  -- xóa 1 cột 
alter table orders
change column new_dess descriptions varchar(50) null; -- thay đổi tên mô tả 1 cột;
--  alter table orders
--  rename to orders_details;  -- thay đổi tên của bảng


SELECT * FROM customers;
SELECT * FROM orders;