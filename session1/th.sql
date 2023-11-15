CREATE DATABASE session01;
USE session01;

-- tao bang users

CREATE TABLE users(
id INT PRIMARY KEY,
user_name VARCHAR(50),
email VARCHAR(50),
PASSWORD VARCHAR(255)
);

CREATE TABLE products (
    id INT PRIMARY KEY,
    product_name VARCHAR(50),
    stock INT,
    price INT,
    description VARCHAR(255),
    image TEXT,
    category_id INT
);

CREATE TABLE categorys(
id INT PRIMARY KEY,
category_name VARCHAR(50),
description_ct VARCHAR(255),
status_ct bit
);

SELECT * FROM session01.users;
SELECT * FROM session01.products;
SELECT * FROM session01.categorys;
