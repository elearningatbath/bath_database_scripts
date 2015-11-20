USE moodle9_live;
SELECT
             u.id AS 'USERID' ,u.firstname,
  u.lastname,u.username AS 'BUCS Username' ,u.email,u.deleted
FROM
  mdl5_user u

WHERE
  u.deleted = 1 -- user is deleted
  AND email <> '' -- email is not blank
  AND (username <> '' AND username NOT LIKE 'ltiprovider%' AND (firstname NOT LIKE '%test%' OR lastname NOT LIKE '%test%'));