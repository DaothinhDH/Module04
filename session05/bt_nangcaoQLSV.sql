CREATE TABLE student (
st_id INT AUTO_INCREMENT PRIMARY KEY,
st_name VARCHAR(50),
age INT,
email VARCHAR(50)
);
INSERT INTO student (st_name, age, email) VALUES
  ('Viet Anh', 20, 'beo@example.com'),
  ('Minh Huy', 22, 'huy@example.com'),
  ('Tung', 21, 'tataus@example.com'),
   ('Anh Duc', 21, 'duc@example.com'),
  ('Chi Tính', 21, 'tinh@example.com');

CREATE TABLE classes (
  cl_id INT AUTO_INCREMENT PRIMARY KEY,
  cl_name VARCHAR(50)
);
INSERT INTO classes (cl_name) VALUES
  ('C0706L'),
  ('C0708G'),
  ('Java');

CREATE TABLE classStudent(
st_id INT,
FOREIGN KEY (st_id) REFERENCES student(st_id),
cl_id INT,
FOREIGN KEY (cl_id) REFERENCES classes(cl_id)
);
INSERT INTO classStudent (st_id, cl_id) VALUES
  (1, 1),
  (2, 2),
  (3, 3);

CREATE TABLE subject(
sub_id INT AUTO_INCREMENT PRIMARY KEY,
sub_name VARCHAR(50)
);
INSERT INTO subject (sub_name) VALUES
  ('SQL'),
  ('C++'),
  ('VISUAL BASIC');
  
CREATE TABLE mark(
mark INT,
sub_id INT,
FOREIGN KEY (sub_id) REFERENCES subject(sub_id),
st_id INT,
FOREIGN KEY (st_id) REFERENCES student (st_id)
);
INSERT INTO mark (mark, sub_id, st_id) VALUES
  (8, 1, 1),
  (4, 2, 1),
  (6, 1, 1),
  (3, 1, 3),
  (7, 2, 4),
  (5, 1, 5),
  (1, 3, 3),
  (3, 3, 5),
  (4, 2, 4),
  (7, 1, 3);
  
  -- 1 Hien thi danh sach tat ca cac hoc vien
  SELECT * FROM student;
  -- 2 Hien thi danh sach tat ca cac mon hoc
  SELECT * FROM subject;
  -- 3 tính điểm trung bình
SELECT s.st_id, s.st_name,AVG(m.mark) as DiemTb
FROM student as s
JOIN mark as m ON s.st_id = m.st_id
GROUP BY s.st_id, s.st_name;
-- 4 Hien thi mon hoc nao co hoc sinh thi duoc diem cao nhat
SELECT s.st_id, s.st_name,m.mark
FROM student as s
JOIN mark as m ON s.st_id = m.st_id
GROUP BY s.st_id, s.st_name,m.mark
HAVING m.mark >= ALL (SELECT mark FROM mark);
-- 5 Danh so thu tu cua diem theo chieu giam
SELECT * FROM mark ORDER BY (mark) DESC;
-- 6 Thay doi kieu du lieu cua cot SubjectName trong bang Subjects thanh nvarchar(max)
ALTER TABLE subject
MODIFY COLUMN sub_name nvarchar(1111);
-- 7 Cap nhat them dong chu « Day la mon hoc « vao truoc cac ban ghi tren cot SubjectName trong bang Subjects
UPDATE subject 
SET sub_name = CONCAT ('đây là môn học ',sub_name);
-- 8 Viet Check Constraint de kiem tra do tuoi nhap vao trong bang Student yeu cau Age >15 va Age < 50
ALTER TABLE student
ADD CONSTRAINT age CHECK(age >15 AND age < 50);
-- 9 Loai bo tat ca quan he giua cac bang
ALTER TABLE classStudent
DROP FOREIGN  KEY classstudent_ibfk_1,
DROP FOREIGN KEY classstudent_ibfk_2;

ALTER TABLE mark
DROP FOREIGN KEY mark_ibfk_1,
DROP FOREIGN KEY mark_ibfk_2;

-- 10 Xoa hoc vien co StudentID la 1
DELETE FROM student WHERE st_id = 1;
-- 11 Trong bang Student them mot column Status co kieu du lieu la Bit va co gia tri Default la 1
ALTER TABLE student
ADD COLUMN status BIT DEFAULT(1);
-- 12 Cap nhap gia tri Status trong bang Student thanh 0
UPDATE student SET status = 0;
  

  
  
