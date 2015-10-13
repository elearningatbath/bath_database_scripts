
/*SAMIS Courses with their assignments */
/* This query would fetch all courses that have SAMIS enrolments */

/*Sample Result*/
/*id
idnumber
fullname
Submission Point
Assignment ID

61

HL20050

Performance Assessment

Motion Analysis Project Brief

1 */


USE moodle9_live;
SELECT c.id,c.idnumber,c.fullname,a.name AS "Submission Point",a.id as "Assignment ID"
FROM mdl5_course c
  JOIN mdl5_enrol e ON e.courseid = c.id AND e.enrol = 'SITS'
  JOIN mdl5_user_enrolments ue on ue.enrolid = e.id
  JOIN mdl5_role_assignments ra ON (ra.userid  = ue.userid

                                    AND ra.roleid = 5) -- Students
  JOIN mdl5_context ct ON   (ct.id = ra.contextid AND e.courseid = ct.instanceid AND ct.contextlevel = 50)

  JOIN mdl5_assign a ON a.course = c.id
  #to get the enrolments within a range we need sits-mappings
  /*LEFT JOIN
  (SELECT sm.courseid,sm.id,sm.sits_code FROM mdl5_sits_mappings sm GROUP BY sm.courseid) map
    ON map.courseid = e.courseid AND map.sits_code = c.idnumber*/

WHERE c.visible = 1

GROUP BY a.id
     ;