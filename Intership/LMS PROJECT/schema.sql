-- schema.sql
-- Database: Learning Management System (LMS)
-- drop database lms_db;
CREATE DATABASE IF NOT EXISTS lms_db;
USE lms_db;

-- 1. Students Table
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    date_of_birth DATE,
    registration_date DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 2. Instructors Table
CREATE TABLE instructors (
    instructor_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    specialization VARCHAR(100)
);

-- 3. Courses Table
CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    instructor_id INT,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (instructor_id) REFERENCES instructors(instructor_id)
        ON DELETE SET NULL
);

-- 4. Modules Table
CREATE TABLE modules (
    module_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT NOT NULL,
    module_name VARCHAR(100) NOT NULL,
    total_lessons INT DEFAULT 10,
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
        ON DELETE CASCADE
);

-- 5. Enrollments Table
CREATE TABLE enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    completion_status VARCHAR(20) DEFAULT 'In Progress',
    FOREIGN KEY (student_id) REFERENCES students(student_id)
        ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
        ON DELETE CASCADE
);

-- 6. Grades Table
CREATE TABLE grades (
    grade_id INT AUTO_INCREMENT PRIMARY KEY,
    enrollment_id INT NOT NULL,
    module_id INT NOT NULL,
    grade DECIMAL(5,2),
    FOREIGN KEY (enrollment_id) REFERENCES enrollments(enrollment_id)
        ON DELETE CASCADE,
    FOREIGN KEY (module_id) REFERENCES modules(module_id)
        ON DELETE CASCADE
);

-- 7. Attendance Table
CREATE TABLE attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    module_id INT NOT NULL,
    attendance_date DATE,
    status ENUM('Present','Absent') DEFAULT 'Present',
    FOREIGN KEY (student_id) REFERENCES students(student_id)
        ON DELETE CASCADE,
    FOREIGN KEY (module_id) REFERENCES modules(module_id)
        ON DELETE CASCADE
);
