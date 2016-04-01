SELECT c.id,cm.id,a.name AS "Submission Point",a.id as "Assignment ID"

FROM mdl5_course c

  JOIN mdl5_assign a ON a.course = c.id
  JOIN mdl5_course_modules cm ON cm.instance = a.id AND c.id = cm.course
  #to get the enrolments within a range we need sits-mappings
  -- Turniitin data
   JOIN mdl5_plagiarism_turnitin_config ptc ON ptc.cm = cm.id
                                                   AND cm.module = 26 AND (ptc.name = 'use_turnitin' AND ptc.value = 1)
WHERE c.visible = 1

GROUP BY a.id;