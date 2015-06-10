-- COURSES WITH NO TEACHERS BUT STUDENTS
-- Excluding Category enrolments and only looking for
-- teacher ,editing teacher and student roles
-- COUNT of teachers should be 0
-- Count of students should be atleast 1
-- USE moodle9_live;
SELECT shortname, "1" as deleted FROM (
SELECT  c.shortname
-- ,u.firstname,u.lastname,ra.id,ra.roleid,r.name
,SUM(IF(ra.roleid = 3,1,0)) AS 'teachers',
 SUM(IF(ra.roleid = 5,1,0)) AS 'students'
FROM mdl5_course c
LEFT JOIN mdl5_enrol e ON e.courseid = c.id AND e.enrol <> 'category'

JOIN mdl5_user_enrolments ue ON e.id = ue.enrolid
JOIN mdl5_role_assignments ra ON (ra.userid  = ue.userid
AND ra.roleid IN (3,4,5))
JOIN mdl5_context ct ON
 (ct.id = ra.contextid AND e.courseid = ct.instanceid AND ct.contextlevel = 50)
-- JOIN mdl5_user u ON u.id = ue.userid
 -- JOIN mdl5_role r ON r.id = ra.roleid
 -- WHERE e.courseid = 51617

 GROUP BY  c.id
HAVING teachers = 0
) AS shortames