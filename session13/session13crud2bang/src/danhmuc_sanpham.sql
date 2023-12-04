CREATE DATABASE session13;
USE session13;

CREATE TABLE category (
                          id INT AUTO_INCREMENT PRIMARY KEY,
                          name VARCHAR(100) NOT NULL UNIQUE,
                          status BIT(1) DEFAULT 1
);

CREATE TABLE product (
                         id INT AUTO_INCREMENT PRIMARY KEY,
                         name VARCHAR(200) NOT NULL,
                         price DOUBLE NOT NULL,
                         category_id INT NOT NULL,
                         FOREIGN KEY (category_id) REFERENCES category(id)
);
DELIMITER //
CREATE PROCEDURE PROC_ADD_CATEGORY(IN _name VARCHAR(100))
BEGIN
    INSERT INTO category (name) VALUES (_name);
end //

delimiter //
create procedure PROC_SHOW_LIST_CATEGORY()
begin
    select * from category;
end //

delimiter //
create procedure PROC_UPDATE_CATEGORY(in cName varchar(50), cStatus bit(1), cId int)
begin
    update category set name = cName, status = cStatus where id = cId;
end //

delimiter //
create procedure PROC_DELETE_CATEGORY(in cId int)
begin
    delete from category where id = cId;
end //

delimiter //
create procedure PROC_FIND_BY_ID(in cId int)
begin
    select *from category where id = cId;
end //

delimiter //
create procedure PROC_FIND_BY_NAME(in cName varchar(50))
begin
    select * from category where name like concat('%',cName,'%');
end //