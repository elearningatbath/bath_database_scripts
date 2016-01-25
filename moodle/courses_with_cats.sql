/*Get count of visible courses in certain categories*/
SELECT  COUNT(DISTINCT(c.id)),cat.name
FROM mdl5_course c
  JOIN mdl5_course_categories cat on cat.id = c.category
WHERE c.visible = 1
      AND  cat.id IN (13,35,36,2,37,39,31,32)
GROUP BY cat.id;