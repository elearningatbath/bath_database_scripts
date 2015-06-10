-- Remove users who havenâ€™t logged in for 365 days
USE moodle9_live;
SELECT DISTINCT(u.username),u.firstname,u.lastname
,IF(u.lastlogin = 0 ,0,DATE_FORMAT(FROM_UNIXTIME(u.lastlogin), '%d-%m-%Y ')) AS 'lastlogin'
 FROM mdl5_user u
WHERE lastlogin <= UNIX_TIMESTAMP(DATE_SUB(SYSDATE(),INTERVAL 365 DAY))
AND deleted = 0 -- Shown in moodle
AND lastaccess <= UNIX_TIMESTAMP(DATE_SUB(NOW(),INTERVAL 365 DAY))
AND lastlogin != 0
ORDER BY UNIX_TIMESTAMP(lastlogin) DESC