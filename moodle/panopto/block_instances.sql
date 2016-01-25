
SELECT COUNT(bi.id) AS 'count',cat.name as 'Faculty' FROM mdl5_block_instances bi
JOIN mdl5_context ctx
            ON (ctx.id = bi.parentcontextid)
      JOIN mdl5_course c ON c.id = ctx.instanceid AND ctx.contextlevel = 50
      JOIN mdl5_course_categories cat on cat.id = c.category
      WHERE bi.blockname = 'panopto' AND cat.id IN (13,35,36,2,37,39,31,32)
GROUP BY cat.id;
