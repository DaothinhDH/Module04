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
(2, 2, 10),
(1, 3, 9),
(1, 1, 20),
(2, 2, 18),
(1, 3, 19);

--  Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
SELECT * FROM subject 
WHERE credit = (SELECT MAX(credit) FROM subject);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất
SELECT * FROM mark
WHERE mark = (SELECT MAX(mark) FROM mark);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
SELECT s.st_id,s.st_name, AVG(m.mark) as DiemTb
FROM student as s
JOIN mark as m ON s.st_id = m.st_id
GROUP BY s.st_id,s.st_name
ORDER BY AVG (m.mark) DESC;

-- sử dụng câu lệnh LIMIT
SELECT * FROM mark LIMIT 2 OFFSET 0; 
SELECT * FROM mark LIMIT 2 OFFSET 2; 
-- hàm ABS giá trị tuyệt đối
SELECT abs(-5);
SELECT ROUND(1.6); -- LÀM 	tròn số quy tắc 0.5








