use logic;
create table depatment_detail(
 id int  auto_increment primary key,
 name varchar(50) not null
);
CREATE TABLE Students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    gender ENUM('Male', 'Female') NOT NULL,
    marks INT NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Depatment_detail(id)
);
insert into depatment_detail (name) values('cse'),('Mech'),('eee');

INSERT INTO Students (name, gender, marks, department_id) VALUES
('Gokul', 'Male', 85, 1),
('karthick', 'Male', 78, 1),
('vasanth', 'Male', 65, 1),
('rena', 'Female', 90, 1),
('bala', 'Male', 55, 1);

INSERT INTO Students (name, gender, marks, department_id) VALUES
('viji', 'Female', 88, 2),
('vijay', 'Male', 72, 2),
('kavya', 'Female', 68, 2),
('shidou', 'Male', 82, 2),
('riku', 'Female', 60, 2);

INSERT INTO Students (name, gender, marks, department_id) VALUES
('Kavin', 'Male', 77, 3),
('boobalan', 'Female', 83, 3),
('minato', 'Male', 70, 3),
('hinata', 'Female', 65, 3),
('gill', 'Male', 58, 3);
 
 select * from depatment_detail;
 select * from students;
 
 SET SQL_SAFE_UPDATES = 1;
 
 UPDATE Students SET marks = marks - 10 WHERE id = 1;
 
 DELETE FROM Students WHERE marks < 35;
 update students set department_id =2 where id=3;
 
 select s.name ,s.id ,s.marks as students, d.name as department from students s join depatment_detail d on s.department_id=d.id;
 
 SELECT s.id, s.name, s.gender, s.marks
FROM Students s
JOIN depatment_detail d ON s.department_id = d.id
WHERE d.name = 'CSE' AND s.marks > 70;

SELECT *
FROM Students
WHERE name LIKE 'A%' OR name LIKE '%n';

SELECT d.name AS department_name, AVG(s.marks) AS avg_marks
FROM Students s
JOIN Depatment_detail d ON s.department_id = d.id
GROUP BY d.id, d.name;

SELECT *
FROM Students
WHERE marks = (SELECT MAX(marks) FROM Students);

SELECT d.id, d.name, AVG(s.marks) AS avg_marks
FROM depatment_detail d
JOIN Students s ON d.id = s.department_id
GROUP BY d.id, d.name
HAVING AVG(s.marks) > 75;

SELECT s.*
FROM Students s
JOIN (
    SELECT department_id, AVG(marks) AS dept_avg
    FROM Students
    GROUP BY department_id
) dept_avg ON s.department_id = dept_avg.department_id
WHERE s.marks > dept_avg.dept_avg;