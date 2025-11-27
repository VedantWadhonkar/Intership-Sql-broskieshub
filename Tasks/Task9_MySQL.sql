drop database  if exists StudentDB;
CREATE DATABASE StudentDB;
USE StudentDB;
CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    department VARCHAR(50)
);
CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100),
    credits INT
);
CREATE TABLE Enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    grade DECIMAL(4,2),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);
INSERT INTO Students (name, age, department) VALUES
('Amit', 20, 'CSE'),
('Priya', 21, 'ECE'),
('Rahul', 19, 'CSE'),
('Sneha', 22, 'ME');
INSERT INTO Courses (course_name, credits) VALUES
('Database Systems', 4),
('Operating Systems', 3),
('Mathematics', 4),
('Computer Networks', 3);
INSERT INTO Enrollments (student_id, course_id, grade) VALUES
(1, 1, 85.5),
(1, 2, 78.0),
(2, 1, 88.0),
(3, 3, 92.5),
(4, 4, 70.0);
SELECT * FROM Students;
SELECT s.name, c.course_name
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE c.course_name = 'Database Systems';
SELECT s.name, AVG(e.grade) AS average_grade
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
GROUP BY s.name;
SELECT c.course_name
FROM Courses c
JOIN Enrollments e ON c.course_id = e.course_id
JOIN Students s ON e.student_id = s.student_id
WHERE s.name = 'Amit';
SELECT s.name, c.course_name, e.grade
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE e.grade > 80;
