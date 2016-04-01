SELECT c.id,COALESCE(count(l.id),0) AS 'No of Views'
FROM mdl5_logstore_standard_log l
RIGHT JOIN mdl5_course c ON c.id = l.courseid  AND l.crud = 'r'
 JOIN mdl5_course_categories cat ON c.category = cat.id AND  cat.id IN (14)
GROUP BY c.id;