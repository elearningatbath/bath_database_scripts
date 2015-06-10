-- COURSES WITH NO TEACHERS OR STUDENTS
-- Excluding Category enrolments and only looking for
-- teacher ,editing teacher and student roles
USE moodle9_live;
SELECT c.shortname,"1" as deleted
-- SELECT c.id AS 'courseid',c.fullname AS 'course fullname',c.shortname AS 'course shortname'
FROM mdl5_course c
LEFT JOIN mdl5_enrol e ON e.courseid = c.id AND enrol <> 'category'
LEFT JOIN mdl5_user_enrolments ue ON (ue.enrolid = e.id  )
LEFT JOIN mdl5_role_assignments ra
ON (ra.userid = ue.userid AND (ra.roleid IN(3,4,5)))
LEFT JOIN mdl5_context ct
ON (ra.contextid = ct.id
AND e.courseid = ct.instanceid AND ct.contextlevel = 50  )
WHERE c.id != 1 -- exclude main site course
   GROUP BY c.id
  HAVING COUNT(ra.id)  =  0
