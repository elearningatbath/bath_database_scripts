USE moodle9_live;
SELECT DISTINCT(c.shortname),"1" as deleted
  -- ,DATE_FORMAT(FROM_UNIXTIME(c2.time),'%d-%m-%Y') AS 'Time last accessed'
FROM mdl5_course c
LEFT JOIN
(SELECT DISTINCT(c1.id) FROM mdl5_course c1
JOIN
mdl5_log l1 ON (l1.course = c1.id
AND l1.time >=  UNIX_TIMESTAMP(DATE_SUB(NOW(),INTERVAL 24 MONTH)) -- 24 months prior
 AND l1.time <= UNIX_TIMESTAMP(NOW()))
WHERE l1.action = 'view' AND l1.module = 'course'

) c2 ON c2.id = c.id
WHERE c2.id IS NULL
AND c.visible = 0 -- hidden courses
-- GROUP BY c.id
 -- ORDER BY l.time DESC