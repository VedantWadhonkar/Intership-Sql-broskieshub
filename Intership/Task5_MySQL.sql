/********************************************************************
 Task 5: Build a Role-Based Access Control (RBAC) Model in MySQL
 Objective: Implement SQL-level access control for Admin, Editor, Viewer

********************************************************************/

DROP DATABASE IF EXISTS RBAC_Demo;
CREATE DATABASE RBAC_Demo;
USE RBAC_Demo;

-- 2. Create Sample Table
CREATE TABLE Articles (
    ArticleID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(150) NOT NULL,
    Content TEXT NOT NULL,
    Author VARCHAR(50) NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample records
INSERT INTO Articles (Title, Content, Author) VALUES
('RBAC Model in MySQL', 'Demonstration of Role-Based Access Control', 'AdminUser'),
('SQL Best Practices', 'Always use roles for privilege management', 'EditorUser');


-- 3. Create Roles

DROP ROLE IF EXISTS admin_role, editor_role, viewer_role;
CREATE ROLE admin_role, editor_role, viewer_role;

-- 4. Grant Privileges to Roles

-- Admin Role: Full database access
GRANT ALL PRIVILEGES ON RBAC_Demo.* TO admin_role;

-- Editor Role: Can read, insert, and update (but not delete or drop)
GRANT SELECT, INSERT, UPDATE ON RBAC_Demo.Articles TO editor_role;

-- Viewer Role: Read-only access
GRANT SELECT ON RBAC_Demo.Articles TO viewer_role;


-- 5. Create Users and Assign Roles

-- Drop if users already exist (to avoid duplicate errors)
DROP USER IF EXISTS 'admin_user'@'localhost';
DROP USER IF EXISTS 'editor_user'@'localhost';
DROP USER IF EXISTS 'viewer_user'@'localhost';

-- Create Users
CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'Admin@123';
CREATE USER 'editor_user'@'localhost' IDENTIFIED BY 'Editor@123';
CREATE USER 'viewer_user'@'localhost' IDENTIFIED BY 'Viewer@123';

-- Grant Roles to Users
GRANT admin_role TO 'admin_user'@'localhost';
GRANT editor_role TO 'editor_user'@'localhost';
GRANT viewer_role TO 'viewer_user'@'localhost';

-- Set Default Role (ensures role is active on login)
SET DEFAULT ROLE admin_role TO 'admin_user'@'localhost';
SET DEFAULT ROLE editor_role TO 'editor_user'@'localhost';
SET DEFAULT ROLE viewer_role TO 'viewer_user'@'localhost';

select * from articles;

