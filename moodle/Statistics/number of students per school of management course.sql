-- This SQL statement finds the number of students registered in each School of Management course
-- however it does not include courses with 0 students
SELECT
  mdl5_course.id, mdl5_course.idnumber, mdl5_course.fullname,COUNT(mdl5_user_enrolments.id)
FROM
  mdl5_course
  LEFT JOIN mdl5_enrol ON (mdl5_course.id = mdl5_enrol.courseid)
  INNER JOIN mdl5_user_enrolments  ON (mdl5_enrol.id = mdl5_user_enrolments.enrolid)
  INNER JOIN mdl5_user ON (mdl5_user_enrolments.userid = mdl5_user.id)
  INNER JOIN mdl5_role_assignments ON (mdl5_user_enrolments.userid = mdl5_role_assignments.userid)
  INNER JOIN mdl5_context ON (mdl5_context.id = mdl5_role_assignments.contextid AND mdl5_enrol.courseid = mdl5_context.instanceid)
WHERE  mdl5_course.category = 14
AND mdl5_role_assignments.roleid = 5
AND mdl5_context.contextlevel = 50
AND mdl5_user.deleted = 0
GROUP BY mdl5_course.id;