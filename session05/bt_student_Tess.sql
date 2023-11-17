create database bt_studentTest;

CREATE TABLE student(
RN INT AUTO_INCREMENT PRIMARY KEY,
sName VARCHAR(50),
age INT,
status BIT
);
INSERT INTO student(sName,age,status)
VALUES ('Nguyen Hong Ha',20,1),
       ('Truong Ngoc Anh',30,0),
       ('Tuan Min',25,1),
       ('Dan Truong',22,0);
       
CREATE TABLE tess(
testID INT AUTO_INCREMENT PRIMARY KEY,
tName VARCHAR(50)
);
INSERT INTO tess(testID,tName) 
VALUES (1,'EPC'),
       (2,'DWMX'),
       (3,'SQL1'),
       (4,'SQL2');
       
CREATE TABLE studentTess(
RN INT,
FOREIGN KEY (RN) REFERENCES student(RN),
testID INT,
FOREIGN KEY (testID) REFERENCES tess(testID),
tDate date,
mark FLOAT
);
INSERT INTO studentTess(RN,testID,tDate,mark)
VALUES (1,1,'2006-07-17',8),
       (1,2,'2006-07-18',5),
       (1,3,'2006-07-19',6),
       (2,1,'2006-07-20',4),
       (2,2,'2006-07-21',5),
       (2,3,'2006-07-22',9),
       (3,1,'2006-07-23',10),
       (3,3,'2006-07-24',2);
-- Sử dụng alter để sửa đổi
-- a. Thêm ràng buộc dữ liệu cho cột age với giá trị thuộc khoảng: 15-55
ALTER TABLE student
ADD CONSTRAINT age_ck check (age > 15 AND age < 55);
-- b. Thêm giá trị mặc định cho cột mark trong bảng StudentTest là 0
ALTER TABLE studenttess
ALTER COLUMN mark SET DEFAULT 0;
-- c. Thêm khóa chính cho bảng studenttest là (RN,TestID)
ALTER TABLE studenttess
ADD CONSTRAINT pk_studenttess PRIMARY KEY(RN,testID);
-- d. Thêm ràng buộc duy nhất (unique) cho cột name trên bảng Test
ALTER TABLE tess
MODIFY COLUMN tName VARCHAR(50) UNIQUE;
-- e. Xóa ràng buộc duy nhất (unique) trên bảng Test
AlTER TABLE tess
DROP INDEX tName;
-- 3 Hiển thị danh sách các học viên đã tham gia thi, các môn thi được thi bởi các học viên đó, điểm thi và ngày thi giống như hình sau:
SELECT s.RN, s.sName, t.tName, st.mark, st.tDate
FROM student AS s
JOIN studentTess AS st ON s.RN = st.RN
JOIN tess AS t ON st.testID = t.testID;

-- 4 Hiển thị danh sách các bạn học viên chưa thi môn nào
SELECT *
FROM student AS s
LEFT JOIN studenttess AS st ON st.RN = s.RN
WHERE st.RN IS NULL;

-- Hiển thị danh sách học viên phải thi lại, tên môn học phải thi lại và điểm thi(điểm phải thi lại là điểm nhỏ hơn 5) 
SELECT s.sName,t.tName,st.mark,st.tDate
FROM student as s
JOIN studenttess as st ON s.RN = st.RN
JOIN tess as t ON t.testID = st.testID
WHERE st.mark < 5;

-- Hiển thị danh sách học viên và điểm trung bình(Average) của các môn đã thi.
-- Danh sách phải sắp xếp theo thứ tự điểm trung bình giảm dần(nếu không sắp xếp thì chỉ được ½ số điểm)
SELECT s.RN,s.sName,AVG(st.mark) as Average
FROM student as s
JOIN studenttess as st ON s.RN = st.RN
GROUP BY  s.RN,s.sName
ORDER BY Average DESC;

-- Hiển thị tên và điểm trung bình của học viên có điểm trung bình lớn nhất 
SELECT s.RN,s.sName,AVG(st.mark) as Average
FROM student as s
JOIN studenttess as st ON s.RN = st.RN
GROUP BY  s.RN,s.sName
HAVING AVG(st.mark) >= ALL (SELECT AVG(mark) FROM studenttess);

-- Hiển thị điểm thi cao nhất của từng môn học. Danh sách phải được sắp xếp theo tên môn học
SELECT t.testID, t.tName,MAX(st.mark) as 'Max Mark'
FROM tess as t
JOIN studenttess st ON t.testID = st.testID
GROUP BY t.testID, t.tName;

-- Hiển thị danh sách tất cả các học viên và môn học mà các học viên đó đã thi nếu học viên chưa thi môn nào thì phần tên môn học để Null
SELECT s.RN, s.sName,t.tName
FROM student as s
LEFT JOIN studenttess as st ON s.RN = st.RN
LEFT JOIN tess as t ON st.testID = t.testID
GROUP BY s.RN, s.sName,t.tName;

-- Sửa (Update) tuổi của tất cả các học viên mỗi người lên một tuổi.
UPDATE student SET age = age + 1;

-- 11.Thêm trường tên là Status có kiểu Varchar(10) vào bảng Student.
ALTER TABLE student
MODIFY COLUMN status VARCHAR(10);
-- Cập nhật(Update) trường Status sao cho những học viên nhỏ hơn 30 tuổi sẽ nhận giá trị ‘Young’, 
-- trường hợp còn lại nhận giá trị ‘Old’ sau đó hiển thị toàn bộ nội dung bảng Student lên
UPDATE student SET status = 'YOUNG' WHERE age < 30;
UPDATE student SET status = 'OLD' WHERE age >= 30 ;
SELECT * FROM student;

-- Hiển thị danh sách học viên và điểm thi, dánh sách phải sắp xếp tăng dần theo ngày thi 
SELECT s.RN,s.sName,t.tName,st.mark,st.tDate
FROM student as s
JOIN studenttess as st ON s.RN = st.RN
JOIN tess as t ON t.testID = st.testID
ORDER BY st.tDate ASC;

-- Hiển thị các thông tin sinh viên có tên bắt đầu bằng ký tự ‘T’ và
--  điểm thi trung bình >4.5. Thông tin bao gồm Tên sinh viên, tuổi, điểm trung bình
SELECT s.sName,s.age,AVG(st.mark) as DTB
FROM student as s
JOIN studenttess as st ON s.RN = st.RN
WHERE s.sName LIKE 'T%'
GROUP BY s.sName,s.age
HAVING DTB > 4.5;

-- Hiển thị các thông tin sinh viên (Mã, tên, tuổi, điểm trung bình, xếp hạng).
-- Trong đó, xếp hạng dựa vào điểm trung bình của học viên, điểm trung bình cao nhất thì xếp hạng 1.
SELECT s.RN, s.sName, s.age, AVG(st.mark) AS average_score,
       RANK() OVER (ORDER BY AVG(st.mark) DESC) AS ranking
FROM student s
JOIN studenttess st ON st.RN = s.RN
GROUP BY s.RN, s.sName, s.age
ORDER BY average_score DESC;
-- Sủa đổi kiểu dữ liệu cột name trong bảng student thành nvarchar(max)
ALTER TABLE student
MODIFY  sName NVARCHAR(1111);
-- Cập nhật (sử dụng phương thức write) cột name trong bảng student với yêu cầu sau:
-- a. Nếu tuổi >20 -> thêm ‘Old’ vào trước tên (cột name)
-- b. Nếu tuổi <=20 thì thêm ‘Young’ vào trước tên (cột name)
UPDATE student 
SET sName = CONCAT(if ( age > 20, 'old','Young'), sName);
-- Xóa tất cả các môn học chưa có bất kỳ sinh viên nào thi
DELETE t
FROM tess t
LEFT JOIN studenttess st ON t.testID = st.testID
WHERE st.testID IS NULL;
-- Xóa thông tin điểm thi của sinh viên có điểm <5.
DELETE FROM studentTess
WHERE mark < 5;


