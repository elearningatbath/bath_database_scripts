USE moodle9_live;
SELECT
	c.shortname, "1" as deleted
FROM
	mdl5_course c
JOIN  mdl5_log l ON
(
		l.course = c.id
	AND l.time >=  UNIX_TIMESTAMP(DATE_SUB(NOW(),INTERVAL 5 YEAR))
  -- Go back 5 years until now
)
WHERE
		l.action = 'view'
	AND l.module = 'course'
GROUP BY c.id
HAVING COUNT(DISTINCT(l.userid)) <= 5