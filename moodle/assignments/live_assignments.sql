SELECT c.id,
  c.fullname,
  c.idnumber,
  COUNT(DISTINCT(a.id)),
  FROM_UNIXTIME(asub.timemodified)
FROM mdl5_course c
  JOIN mdl5_assign a ON a.course = c.id
  JOIN mdl5_assign_submission asub ON asub.assignment = a.id
                                      AND asub.timemodified >=  1410130800
                                      AND asub.timemodified  <= 1434841200
       AND c.id <> 1 AND c.visible = 1
GROUP by c.id



