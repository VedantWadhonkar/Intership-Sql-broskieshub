USE lms_db;

-- 1. Top 5 Most Active Students (by completed modules)
SELECT s.full_name, COUNT(DISTINCT g.module_id) AS modules_completed
FROM grades g
JOIN enrollments e ON g.enrollment_id = e.enrollment_id
JOIN students s ON e.student_id = s.student_id
GROUP BY s.student_id
ORDER BY modules_completed DESC
LIMIT 5;

-- 2. Top 5 Most Enrolled Courses
SELECT c.course_name, COUNT(e.enrollment_id) AS total_enrollments
FROM enrollments e
JOIN courses c ON e.course_id = c.course_id
GROUP BY c.course_id
ORDER BY total_enrollments DESC
LIMIT 5;

-- 3. Course Completion Rate (based on all modules graded)
SELECT 
    c.course_name,
    ROUND(
        COUNT(DISTINCT CASE WHEN g.grade IS NOT NULL THEN e.student_id END)*100.0 
        / COUNT(DISTINCT e.student_id), 2
    ) AS completion_percentage
FROM enrollments e
JOIN courses c ON e.course_id = c.course_id
LEFT JOIN grades g ON g.enrollment_id = e.enrollment_id
GROUP BY c.course_id;

-- 4. Instructor Performance (average student grade)
SELECT 
    i.full_name AS instructor,
    ROUND(AVG(g.grade), 2) AS avg_grade
FROM grades g
JOIN enrollments e ON g.enrollment_id = e.enrollment_id
JOIN courses c ON e.course_id = c.course_id
JOIN instructors i ON c.instructor_id = i.instructor_id
GROUP BY i.instructor_id
ORDER BY avg_grade DESC;

-- 5. Student Attendance Report
SELECT 
    s.full_name,
    m.module_name,
    SUM(CASE WHEN a.status = 'Present' THEN 1 ELSE 0 END) AS days_present,
    COUNT(a.attendance_id) AS total_classes,
    ROUND(
        SUM(CASE WHEN a.status = 'Present' THEN 1 ELSE 0 END) * 100.0 
        / COUNT(a.attendance_id), 2
    ) AS attendance_percentage
FROM attendance a
JOIN students s ON a.student_id = s.student_id
JOIN modules m ON a.module_id = m.module_id
WHERE s.student_id = 1
GROUP BY s.student_id, m.module_id;
