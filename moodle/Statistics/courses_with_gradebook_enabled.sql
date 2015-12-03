-- Show me assignments that have entries in the gradebook
-- This will ONLY show assignments that have a GRADEBOOK entry with it.
-- Note: to get a YES and a NO , get a list of all assignments and do a VLOOKUP between the result sets
-- WHERE clause can be used to get data only for specific assignments
SELECT c.id,a.id ,a.name
FROM mdl5_assign a
  JOIN mdl5_course c ON c.id = a.course
  -- JOIN mdl5_course_modules cm ON cm.course = c.id
  JOIN mdl5_enrol e ON e.courseid = c.id AND e.enrol = 'SITS'
  JOIN mdl5_user_enrolments ue on ue.enrolid = e.id
  JOIN mdl5_role_assignments ra ON (ra.userid  = ue.userid AND ra.roleid = 5)
  JOIN mdl5_context ct ON   (ct.id = ra.contextid AND e.courseid = ct.instanceid AND ct.contextlevel = 50)
  JOIN mdl5_grade_items gi On gi.iteminstance = a.id AND gi.courseid = c.id
  JOIN mdl5_grade_grades gg ON gi.id = gg.itemid AND gg.userid = ra.userid AND gg.finalgrade IS NOT NULL

#WHERE a.id IN (1,2,3,4)
GROUP BY a.id
UNION

SELECT c.id,a.id ,a.name
FROM mdl5_assign a
  JOIN mdl5_course c ON c.id = a.course
  -- JOIN mdl5_course_modules cm ON cm.course = c.id
  JOIN mdl5_enrol e ON e.courseid = c.id AND e.enrol = 'SITS'
  JOIN mdl5_user_enrolments ue on ue.enrolid = e.id
  JOIN mdl5_role_assignments ra ON (ra.userid  = ue.userid AND ra.roleid = 5)
  JOIN mdl5_context ct ON   (ct.id = ra.contextid AND e.courseid = ct.instanceid AND ct.contextlevel = 50)
  JOIN mdl5_grade_items gi On gi.iteminstance = a.id AND gi.courseid = c.id
  JOIN mdl5_grade_grades gg ON gi.id = gg.itemid AND gg.userid = ra.userid AND gg.finalgrade IS NULL

#WHERE a.id IN (1,2,3,4)
GROUP BY a.id