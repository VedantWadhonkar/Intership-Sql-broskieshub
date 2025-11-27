USE lms_db;

-- Create indexes to improve performance
CREATE INDEX idx_enrollments_student ON enrollments(student_id);
CREATE INDEX idx_enrollments_course ON enrollments(course_id);
CREATE INDEX idx_grades_module ON grades(module_id);
CREATE INDEX idx_grades_enrollment_module ON grades(enrollment_id, module_id); -- composite for faster grade query
CREATE INDEX idx_attendance_student ON attendance(student_id);
CREATE INDEX idx_attendance_module ON attendance(module_id); -- optional if querying by module

-- Basic Operational Queries

-- 1. All courses a student is enrolled in
SELECT s.full_name, c.course_name
FROM enrollments e
INNER JOIN students s ON e.student_id = s.student_id
INNER JOIN courses c ON e.course_id = c.course_id
WHERE s.student_id = 1;

-- 2. A student's grade for a specific module
SELECT s.full_name, m.module_name, g.grade
FROM grades g
INNER JOIN enrollments e ON g.enrollment_id = e.enrollment_id
INNER JOIN students s ON e.student_id = s.student_id
INNER JOIN modules m ON g.module_id = m.module_id
WHERE s.student_id = 1 
  AND m.module_id = 2;

-- 3. Attendance record for a student
SELECT s.full_name, m.module_name, a.attendance_date, a.status
FROM attendance a
INNER JOIN students s ON a.student_id = s.student_id
INNER JOIN modules m ON a.module_id = m.module_id
WHERE s.student_id = 1;
