/* This is for any new course creations. Make sure the SITS categories correspond to the new SAMIS Departments */
USE moodle9_live;
UPDATE  mdl5_sits_categories SET sits_dep_code = <NEW_DEP_CODE> WHERE category_id = <MOODLE_CATEGORY_ID> ;