USE minitest_week1;
CREATE TABLE Adess(
AdessID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
adess VARCHAR(100));
INSERT INTO Adess(AdessID,adess)
VALUES(1,'Ba Be-Bac kan');
INSERT INTO Adess(adess)
VALUES('Yen Lap-Phu Tho');
INSERT INTO Adess(adess)
VALUES('My Dinh-Ha Noi');
INSERT INTO Adess(adess)
VALUES('Viet Yen-Bac Giang');
INSERT INTO Adess(adess)
VALUES('Bao Thang-Lao Cai');
CREATE TABLE class(
classID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
className VARCHAR (50) NOT NULL,
Language VARCHAR (70) NOT NULL,
description VARCHAR(80) NOT NULL);
INSERT INTO class(classID,className,Language,description)
VALUES(1,'C0223G1','Java','17');
INSERT INTO class(className,Language,description)
VALUES('C0224','C++','19');
INSERT INTO class(className,Language,description)
VALUES('C0922H1','Java','20');
INSERT INTO class(className,Language,description)
VALUES('C01022I1','PYTHON',12);
INSERT INTO class(className,Language,description)
VALUES('CO5223','CSS',29);
CREATE TABLE course(
courseID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
courseName VARCHAR (200) NOT NULL,
description VARCHAR(225) NOT NULL);
INSERT INTO course(courseID,courseName,description)
VALUES(1,'thang 2 nam 2023','Java');
INSERT INTO course(courseName,description)
VALUES('thang 3 nam 2023','Java');
INSERT INTO course(courseName,description)
VALUES('Thang 9 nam 2022','C++');
INSERT INTO course(courseName,description)
VALUES ('Thang 10 nam 2022','Python');
INSERT INTO course(courseName,description)
VALUES('thang 4 nam 2023','CSS');
CREATE TABLE student(
studentID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
fullName VARCHAR(220) NOT NULL,
AdessID INT NOT NULL,
FOREIGN KEY (AdessID) REFERENCES  Adess(AdessID),
age INT NOT NULL,
PHONE VARCHAR (20) NOT NULL UNIQUE,
classID INT NOT NULL,
FOREIGN KEY (classID) REFERENCES class(classID));
INSERT INTO student(studentID,fullname,AdessID,age,PHONE,classID)
VALUES(1,'Nguyen Hai Son',1,29,05939423943,1);
INSERT INTO student(fullname,AdessID,age,PHONE,classID)
VALUES('Nguyen van Nam',2,31,0345484354,2);
INSERT INTO student(fullname,AdessID,age,PHONE,classID)
VALUES('Nguyen Thi Anh',3,21,0345283242,1);
INSERT INTO student(fullname,AdessID,age,PHONE,classID)
VALUES('le Thi Ngoc Anh',2,21,'03453545',2);
INSERT INTO student(fullname,AdessID,age,PHONE,classID)
VALUES('Ngo Hoang Hai',3,27,'0343445345',3);
INSERT INTO student (fullname,AdessID,age,PHONE,ClassID)
VALUES('Dinh Thi Tu Uuyen',4,17,'034454595',3);
INSERT INTO student(fullname,AdessID,age,PHONE,classID)
VALUES('Giang Thi Dua',4,22,'0878541672',4);
INSERT INTO student(fullname,AdessID,age,PHONE,classID)
VALUES('Bui Xuan Anh',4,39,'084383543',4);
INSERT INTO student(fullname,AdessID,age,PHONE,classID)
VALUES('Trieu Thi Chinh',5,25,'034504545',5);
INSERT INTO student(fullname,AdessID,age,PHONE,classID)
VALUES('Nguyen Quang Truong',5,16,'034532346',5);
CREATE TABLE point(
pointID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
studentID INT NOT NUll,
courseID INT NOT NULL,
FOREIGN KEY (studentID)REFERENCES student(studentID),
FOREIGN KEY(courseID)REFERENCES course(courseID));
INSERT INTO point(pointID,studentID,courseID)
VALUES(1,1,1);
INSERT INTO point(studentID,courseID)
VALUES(1,1);
INSERT INTO point(studentID,courseID)
VALUES(2,2);
INSERT INTO point(studentID,courseID)
VALUES(2,2);
INSERT INTO point(studentID,courseID)
VALUES(2,2);
INSERT INTO point(studentID,courseID)
VALUES(1,1);
INSERT INTO point(studentID,courseID)
VALUES(3,3);
INSERT INTO point(studentID,courseID)
VALUES(3,3);
INSERT INTO point(studentID,courseID)
VALUES(3,3);
INSERT INTO point(studentID,courseID)
VALUES(4,4);
INSERT INTO point(studentID,courseID)
VALUES(4,4);
INSERT INTO point(studentID,courseID)
VALUES(4,4);
INSERT INTO point(studentID,courseID)
VALUES(5,5);
INSERT INTO point(studentID,courseID)
VALUES(5,5);
INSERT INTO point(studentID,courseID)
VALUES(5,5);
SELECT student.studentID,student.fullName
FROM student
WHERE fullName LIKE'nguyen%'
GROUP BY studentID,fullName;
SELECT student.studentID,student.fullName,student.age
FROM student
WHERE age>18 AND age<25
GROUP BY studentID,fullName,age;
SELECT student.studentID,student.fullName
FROM  student
WHERE studentID='1' OR studentID='10'
GROUP BY studentID,fullName;
SELECT student.studentID,student.fullName,class.className,
count(className) AS" lop hoc"
FROM student JOIN class ON student.classID=class.classID
GROUP BY studentID,fullName,className;
SELECT student.studentID,student.fullName,adess.adess,
count(adess)AS " Tinh"
FROM student JOIN adess ON student.AdessID=adess.AdessID
GROUP BY studentID,fullName,adess;
SELECT student.studentID,student.fullName,point.pointID,
AVG(pointID) AS" agv"
FROM student JOIN point ON student.studentID=point.studentID
GROUP BY studentID, fullName,pointID
HAVING AVG(poinID)>=ALL(SELECT AVG(poinID) FROM point GROUP BY point.studentID);





