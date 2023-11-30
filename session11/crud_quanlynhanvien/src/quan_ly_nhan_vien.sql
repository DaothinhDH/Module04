CREATE DATABASE quan_ly_nhan_vien;
USE quan_ly_nhan_vien;
CREATE TABLE user
(
    id        int PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(50)  NOT NULL,
    phone     VARCHAR(20)  NOT NULL,
    address   VARCHAR(100) NOT NULL,
    birthday  DATE         NOT NULL,
    sex       bit(1) DEFAULT 1,
    salary    float        NOT NULL
);
DELIMITER //
CREATE PROCEDURE SHOW_USER()
BEGIN
    SELECT * FROM user;
end;
//
DELIMITER //
CREATE PROCEDURE CREATE_USER(
    IN new_user_name VARCHAR(50),
    IN new_phone VARCHAR(20),
    IN new_address VARCHAR(100),
    IN new_birthday DATE,
    IN new_sex bit(1),
    IN new_salary float)
BEGIN
        INSERT INTO user(user_name, phone, address, birthday, sex, salary)
    VALUES (new_user_name, new_phone, new_address, new_birthday, new_sex, new_salary);
end;
//

DELIMITER //
CREATE PROCEDURE UPDATE_USER(
    IN id_update INT,
    IN new_user_name VARCHAR(50),
    IN new_phone VARCHAR(20),
    IN new_address VARCHAR(100),
    IN new_birthday DATE,
    IN new_sex bit(1),
    IN new_salary float
)
BEGIN
    UPDATE user SET user_name = new_user_name,
                    phone = new_phone,
                    address = new_address,
                    birthday = new_birthday,
                    sex = new_sex,
                    salary = new_salary
    WHERE id = id_update;
end //

DELIMITER //
CREATE PROCEDURE FIND_USER(IN id_user INT)
BEGIN
    SELECT * FROM user
        WHERE id = id_user;
end //