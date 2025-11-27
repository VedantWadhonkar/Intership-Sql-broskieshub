USE lms_db;

-- Instructors (10)
INSERT INTO instructors (full_name, email, specialization) VALUES
('Dr. A Sharma', 'a.sharma@lms.com', 'Data Science'),
('Prof. B Verma', 'b.verma@lms.com', 'Web Development'),
('Dr. C Mehta', 'c.mehta@lms.com', 'Machine Learning'),
('Prof. D Joshi', 'd.joshi@lms.com', 'Cyber Security'),
('Dr. E Iyer', 'e.iyer@lms.com', 'Cloud Computing'),
('Prof. F Khan', 'f.khan@lms.com', 'Mobile Development'),
('Dr. G Reddy', 'g.reddy@lms.com', 'AI'),
('Prof. H Singh', 'h.singh@lms.com', 'Database Management'),
('Dr. I Nair', 'i.nair@lms.com', 'Networking'),
('Prof. J Rao', 'j.rao@lms.com', 'Software Testing');

-- Courses (15)
INSERT INTO courses (course_name, instructor_id, start_date, end_date) VALUES
('Python Programming', 1, '2025-01-10', '2025-03-10'),
('Web Development', 2, '2025-02-01', '2025-04-01'),
('Machine Learning', 3, '2025-03-01', '2025-05-01'),
('Cyber Security', 4, '2025-01-15', '2025-03-15'),
('Cloud Computing', 5, '2025-02-10', '2025-04-10'),
('Mobile App Development', 6, '2025-01-20', '2025-03-20'),
('Artificial Intelligence', 7, '2025-03-05', '2025-05-05'),
('Database Systems', 8, '2025-02-05', '2025-04-05'),
('Networking Basics', 9, '2025-01-25', '2025-03-25'),
('Software Testing', 10, '2025-02-15', '2025-04-15'),
('Java Programming', 2, '2025-01-12', '2025-03-12'),
('Front-end Frameworks', 2, '2025-03-01', '2025-05-01'),
('Back-end Development', 2, '2025-01-20', '2025-03-20'),
('Data Analytics', 1, '2025-02-01', '2025-04-01'),
('DevOps Fundamentals', 5, '2025-03-10', '2025-05-10');

-- Modules (Each course has 2-3 modules)
INSERT INTO modules (course_id, module_name) VALUES
(1, 'Introduction to Python'), (1, 'Data Structures in Python'), (1, 'OOP in Python'),
(2, 'HTML Basics'), (2, 'CSS and JS'), (2, 'Responsive Design'),
(3, 'ML Basics'), (3, 'Regression & Classification'), (3, 'Model Evaluation'),
(4, 'Network Security'), (4, 'Cryptography'),
(5, 'Cloud Concepts'), (5, 'AWS Services'),
(6, 'Android Development'), (6, 'iOS Development'),
(7, 'AI Fundamentals'), (7, 'Neural Networks'),
(8, 'SQL Basics'), (8, 'Database Design'),
(9, 'Networking Concepts'), (9, 'Routing & Switching'),
(10, 'Software QA'), (10, 'Automation Testing'),
(11, 'Java Basics'), (11, 'Advanced Java'),
(12, 'React JS'), (12, 'Angular'),
(13, 'Node.js'), (13, 'Express.js'),
(14, 'Data Analysis with Python'), (14, 'Data Visualization'),
(15, 'DevOps Tools'), (15, 'CI/CD Pipelines');

-- Students (50)
INSERT INTO students (full_name, email, date_of_birth) VALUES
('Student1', 'student1@example.com', '2003-01-01'),
('Student2', 'student2@example.com', '2002-02-02'),
('Student3', 'student3@example.com', '2003-03-03'),
('Student4', 'student4@example.com', '2002-04-04'),
('Student5', 'student5@example.com', '2003-05-05'),
('Student6', 'student6@example.com', '2002-06-06'),
('Student7', 'student7@example.com', '2003-07-07'),
('Student8', 'student8@example.com', '2002-08-08'),
('Student9', 'student9@example.com', '2003-09-09'),
('Student10', 'student10@example.com', '2002-10-10'),
('Student11', 'student11@example.com', '2003-11-11'),
('Student12', 'student12@example.com', '2002-12-12'),
('Student13', 'student13@example.com', '2003-01-13'),
('Student14', 'student14@example.com', '2002-02-14'),
('Student15', 'student15@example.com', '2003-03-15'),
('Student16', 'student16@example.com', '2002-04-16'),
('Student17', 'student17@example.com', '2003-05-17'),
('Student18', 'student18@example.com', '2002-06-18'),
('Student19', 'student19@example.com', '2003-07-19'),
('Student20', 'student20@example.com', '2002-08-20'),
('Student21', 'student21@example.com', '2003-09-21'),
('Student22', 'student22@example.com', '2002-10-22'),
('Student23', 'student23@example.com', '2003-11-23'),
('Student24', 'student24@example.com', '2002-12-24'),
('Student25', 'student25@example.com', '2003-01-25'),
('Student26', 'student26@example.com', '2002-02-26'),
('Student27', 'student27@example.com', '2003-03-27'),
('Student28', 'student28@example.com', '2002-04-28'),
('Student29', 'student29@example.com', '2003-05-29'),
('Student30', 'student30@example.com', '2002-06-30'),
('Student31', 'student31@example.com', '2003-07-31'),
('Student32', 'student32@example.com', '2002-08-01'),
('Student33', 'student33@example.com', '2003-09-02'),
('Student34', 'student34@example.com', '2002-10-03'),
('Student35', 'student35@example.com', '2003-11-04'),
('Student36', 'student36@example.com', '2002-12-05'),
('Student37', 'student37@example.com', '2003-01-06'),
('Student38', 'student38@example.com', '2002-02-07'),
('Student39', 'student39@example.com', '2003-03-08'),
('Student40', 'student40@example.com', '2002-04-09'),
('Student41', 'student41@example.com', '2003-05-10'),
('Student42', 'student42@example.com', '2002-06-11'),
('Student43', 'student43@example.com', '2003-07-12'),
('Student44', 'student44@example.com', '2002-08-13'),
('Student45', 'student45@example.com', '2003-09-14'),
('Student46', 'student46@example.com', '2002-10-15'),
('Student47', 'student47@example.com', '2003-11-16'),
('Student48', 'student48@example.com', '2002-12-17'),
('Student49', 'student49@example.com', '2003-01-18'),
('Student50', 'student50@example.com', '2002-02-19');

-- Enrollments (100+)
INSERT INTO enrollments (student_id, course_id) VALUES
(1,1),(2,1),(3,1),(4,2),(5,2),(6,2),(7,3),(8,3),(9,3),(10,4),
(11,4),(12,4),(13,5),(14,5),(15,5),(16,6),(17,6),(18,6),(19,7),(20,7),
(21,7),(22,8),(23,8),(24,8),(25,9),(26,9),(27,9),(28,10),(29,10),(30,10),
(31,11),(32,11),(33,11),(34,12),(35,12),(36,12),(37,13),(38,13),(39,13),
(40,14),(41,14),(42,14),(43,15),(44,15),(45,15),(46,1),(47,2),(48,3),(49,4),(50,5),
-- Add more to reach 100+ enrollments
(1,2),(2,3),(3,4),(4,5),(5,6),(6,7),(7,8),(8,9),(9,10),(10,11),
(11,12),(12,13),(13,14),(14,15),(15,1),(16,2),(17,3),(18,4),(19,5),(20,6),
(21,7),(22,8),(23,9),(24,10),(25,11),(26,12),(27,13),(28,14),(29,15),(30,1),
(31,2),(32,3),(33,4),(34,5),(35,6),(36,7),(37,8),(38,9),(39,10),(40,11),
(41,12),(42,13),(43,14),(44,15),(45,1),(46,2),(47,3),(48,4),(49,5),(50,6);

-- Grades (random example)
INSERT INTO grades (enrollment_id, module_id, grade) VALUES
(1,1,85),(1,2,90),(2,1,78),(2,2,82),(3,1,88),(3,2,84),(4,3,75),(4,4,80),
(5,3,91),(5,4,89),(6,3,70),(6,4,73),(7,5,92),(7,6,95),(8,5,85),(8,6,88);

-- Attendance (sample random)
INSERT INTO attendance (student_id, module_id, attendance_date, status) VALUES
(1,1,'2025-02-01','Present'),
(1,2,'2025-02-02','Absent'),
(2,1,'2025-02-01','Present'),
(3,3,'2025-02-01','Present'),
(4,4,'2025-02-02','Present'),
(5,4,'2025-02-02','Absent');
