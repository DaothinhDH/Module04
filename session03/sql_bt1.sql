create table class(
class_id int not null primary key auto_increment,
class_name varchar(60) not null,
start_date datetime not null,
status bit(1)
);
INSERT INTO class (class_name, start_date, status)
VALUES
  ('Math 101', '2023-11-15 08:00:00', 1),
  ('English 201', '2023-11-16 10:00:00', 1),
  ('Science 301', '2023-11-17 13:00:00', 1);
  
create table student(
student_id int not null primary key auto_increment,
student_name varchar(30) not null,
address varchar(50),
phone varchar(20),
status bit(1),
class_id int not null,
foreign key(class_id)references class(class_id)
);
INSERT INTO student (student_name, address, phone, status, class_id)
VALUES
  ('John Doe', '123 Main St', '(123) 456-7890', 1, 1),
  ('Jane Smith', '456 Oak Ave', '(555) 555-1212', 1, 1),
  ('Bob Johnson', '789 Maple Dr', '(555) 123-4567', 1, 2);
  
  delete from  student  where student_id = 6;

create table subject(
sub_id int not null primary key auto_increment,
sub_name varchar(30),
credit tinyint not null default(1)  check(credit>=1),
status bit(1) default(1)
);
INSERT INTO subject (sub_name, credit, status)
VALUES
  ('Math', 3, 1),
  ('English', 2, 1),
  ('Science', 4, 1);

create table mark(
mark_id int not null primary key auto_increment,
sub_id int not null unique key,
foreign key(sub_id)references subject(sub_id),
student_id int not null unique key,
foreign key(student_id) references student(student_id),
mark float default(0) check (mark between 0 and 100),
exam_time tinyint default(1)
);
INSERT INTO mark (sub_id, student_id, mark, exam_time)
VALUES
  (1, 1, 80, 1),
  (2, 2, 90, 1),
  (3, 3, 75, 1);

-- hiển thị tất cả sinh viên có kí tự bắt đầu là 'h'
SELECT * FROM student WHERE student_name LIKE 'h%';
-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12
SELECT * FROM class WHERE MONTH (start_date) = 12;
-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5
SELECT * FROM subject WHERE credit BETWEEN 3 AND 5;
-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Jane Smith’ là 2
UPDATE student SET class_id = 2 WHERE student_name = 'Jane Smith';
-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần
SELECT s.student_name,sb.sub_name,m.mark
FROM student as s
JOIN mark as m
ON s.student_id = m.student_id
JOIN subject as sb 
ON m.sub_id = sb.sub_id
ORDER BY m.mark DESC, s.student_name ASC;



