-- number of course views for all courses in a certain category
SELECT c.id,COUNT(DISTINCT (l.id)) AS 'No of Course Views'
FROM mdl5_logstore_standard_log l
 RIGHT JOIN mdl5_course c ON (c.id = l.courseid)
                             AND  l.action = 'viewed' AND l.target ='course' AND l.eventname = '\\core\\event\\course_viewed'
                             AND l.timecreated BETWEEN 1441062000 AND 1454198400 AND l.edulevel  = 2
 JOIN mdl5_course_categories cat ON c.category = cat.id AND  cat.id IN (14)
GROUP BY c.id;