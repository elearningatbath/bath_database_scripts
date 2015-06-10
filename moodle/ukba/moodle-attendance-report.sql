USE moodle9_live;
SELECT
	cat.name	AS 'Category name',
	c.fullname	AS 'Course full name',
	c.idnumber	AS 'Course ID number',
	a.name		AS 'Assignment name',
	u.firstname	AS 'First name',
	u.lastname	AS 'Last name',
	u.username	AS 'BUCS ID',
 IF(a.duedate,DATE_FORMAT(FROM_UNIXTIME(a.duedate), '%d-%m-%Y'), NULL)
				AS 'Assignment due date',
	asub.id		AS 'Submission ID',
 IF(asub.timemodified,DATE_FORMAT(FROM_UNIXTIME(asub.timemodified),'%d-%m-%Y'),NULL)
				AS 'Submission last modified'
FROM
			   mdl5_assign				a
	INNER JOIN mdl5_course					c		ON  a.course 	 = c.id
	INNER JOIN mdl5_course_categories		cat		ON  cat.id 		 = c.category
	INNER JOIN mdl5_context					ctx		ON (c.id 		 = ctx.instanceid	AND ctx.contextlevel= 50		)
	INNER JOIN mdl5_role_assignments		ra 		ON (ra.contextid = ctx.id 			AND ra.roleid		= 5 		)
	INNER JOIN mdl5_user					u		ON  u.id 		 = ra.userid
	LEFT  JOIN mdl5_assign_submission	asub	ON (a.id 		 = asub.assignment 	AND asub.userid 	= ra.userid	)