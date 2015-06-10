SELECT u.firstname,u.lastname,u.username,qa.userid,qa.sumgrades,c.fullname AS course,
FROM_UNIXTIME(qa.timefinish) as timefinish FROM
moodle9_live.mdl5_course c JOIN moodle9_live.mdl5_quiz q ON q.course = c.id
JOIN moodle9_live.mdl5_quiz_attempts qa  ON
q.id = qa.quiz
JOIN moodle9_live.mdl5_user u on u.id = qa.userid
WHERE c.id BETWEEN 53987 AND 54005
AND  qa.sumgrades > 84
AND qa.timemodified > 1388620800
AND qa.timemodified <= 1389009600
GROUP BY qa.userid
ORDER BY timefinish;