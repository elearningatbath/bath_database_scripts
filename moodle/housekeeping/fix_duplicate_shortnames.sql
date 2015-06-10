UPDATE moodle9_live.mdl5_course
SET shortname = CONCAT(shortname,'-',id)
WHERE shortname IN
(
SELECT shortname FROM
 (
  SELECT shortname
  FROM moodle9_live.mdl5_course
  GROUP BY shortname HAVING count(id) > 1
 )
 AS shortnames
)