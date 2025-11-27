-- Drop and Create Database
DROP DATABASE IF EXISTS CompanyDB;
CREATE DATABASE CompanyDB;
USE CompanyDB;

-- Enable Profiling
SET profiling = 1;

-- Create Employee Table
CREATE TABLE Employee (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    city VARCHAR(50)
);

-- Insert some initial sample records
INSERT INTO Employee (emp_name, department, salary, city) VALUES
('Amit', 'HR', 50000, 'Mumbai'),
('Ravi', 'IT', 60000, 'Pune'),
('Neha', 'Finance', 70000, 'Mumbai'),
('Sita', 'IT', 55000, 'Delhi'),
('Raj', 'Finance', 65000, 'Mumbai'),
('Anil', 'HR', 48000, 'Pune');

-- Insert bulk data (5000 rows for testing performance)
INSERT INTO Employee (emp_name, department, salary, city)
SELECT 
  CONCAT('Emp', t.n) AS emp_name,
  ELT(FLOOR(1 + (RAND() * 4)), 'HR', 'IT', 'Finance', 'Admin') AS department,
  FLOOR(40000 + (RAND() * 30000)) AS salary,
  ELT(FLOOR(1 + (RAND() * 4)), 'Mumbai', 'Pune', 'Delhi', 'Bangalore') AS city
FROM (
    SELECT a.N + b.N * 10 + c.N * 100 + d.N * 1000 AS n
    FROM 
        (SELECT 0 AS N UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4
         UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) a,
        (SELECT 0 AS N UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4
         UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) b,
        (SELECT 0 AS N UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4
         UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) c,
        (SELECT 0 AS N UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4
         UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) d
) 
LIMIT 5000;


-- Before Index
EXPLAIN SELECT emp_name, department, salary 
FROM Employee 
WHERE city = 'Mumbai';

SELECT emp_name, department, salary 
FROM Employee 
WHERE city = 'Mumbai';

-- Check profiling results (before index)
SHOW PROFILES;


-- Create Index

CREATE INDEX idx_city ON Employee(city);


-- After Index
EXPLAIN SELECT emp_name, department, salary 
FROM Employee 
WHERE city = 'Mumbai';

SELECT emp_name, department, salary 
FROM Employee 
WHERE city = 'Mumbai';

-- Check profiling results (after index)
SHOW PROFILES;
