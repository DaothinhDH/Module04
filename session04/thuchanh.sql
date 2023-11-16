CREATE TABLE class(
 cl_id INT AUTO_INCREMENT PRIMARY KEY,
 CL_name VARCHAR(50)NOT NULL UNIQUE,
 st_date DATE NOT NULL UNIQUE,
 status bit default(1)
);

CREATE TABLE student (
st_id INT AUTO_INCREMENT PRIMARY KEY,
st_name VARCHAR(50) NOT NULL UNIQUE,
address VARCHAR(50) NOT NULL UNIQUE,
phone VARCHAR(15),
status BIT DEFAULT(1),
cl_id INT,
FOREIGN KEY (cl_id) REFERENCES class(cl_id)
);

CREATE TABLE subject(
sub_id INT AUTO_INCREMENT PRIMARY KEY,
sub_name VARCHAR(50),
credit INT,
status bit DEFAULT(1)
);

CREATE TABLE mark(
m_id INT AUTO_INCREMENT PRIMARY KEY,
sub_id INT,
FOREIGN KEY (sub_id) REFERENCES subject(sub_id),
st_id INT,
FOREIGN KEY (st_id) REFERENCES student(st_id),
mark INT,
examtiems bit DEFAULT (1)
);

INSERT INTO class (CL_name, st_date) VALUES
('Class A', '2023-09-01'),
('Class B', '2023-09-02'),
('Class C', '2023-09-03');

INSERT INTO student (st_name, address, phone, cl_id) VALUES
('John Doe', '123 Main St', '555-1234', 1),
('Jane Smith', '456 Elm St', '555-5678', 1),
('Bob Johnson', '789 Oak St', '555-9012', 2);

INSERT INTO subject (sub_name, credit) VALUES
('Math', 3),
('Science', 4),
('English', 2);

INSERT INTO mark (sub_id, st_id, mark) VALUES
(1, 1, 15),
(2, 1, 10),
(1, 2, 9),
(1, 1, 20),
(2, 1, 18),
(1, 2, 19);


-- Hiển thị số lượng sinh viên ở từng nơi
SELECT address, COUNT(st_id) as 'số lượng sinh viên'
FROM student
GROUP BY address;

-- Tính điểm trung bình các môn học của mỗi học viên
SELECT s.st_id,s.st_name,AVG(mark)
FROM student as s
JOIN mark as m ON s.st_id = m.st_id
GROUP BY s.st_id,s.st_name;

--  Hiển thị những bạn học viên co điểm trung bình các môn học lớn hơn 15
SELECT s.st_id,s.st_name,AVG(mark)
FROM student as s
JOIN mark as m ON s.st_id = m.st_id
GROUP BY s.st_id,s.st_name
HAVING AVG(mark) > 15;

-- Hiển thị thông tin các học viên có điểm trung bình lớn nhất
SELECT s.st_id,s.st_name, AVG(mark)
FROM student as s
JOIN mark as m ON s.st_id = m.st_id
GROUP BY s.st_id,s.st_name
HAVING AVG(mark) >= ALL (SELECT AVG(mark) FROM mark GROUP BY mark.st_id)





