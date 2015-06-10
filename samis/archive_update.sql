USE moodle9_2014; -- Change this every year
-- Disable Plugins / blocks
UPDATE mdl5_block SET visible = 0 WHERE name = 'bath_oue';
UPDATE mdl5_block SET visible = 0 WHERE name = 'sits';
UPDATE mdl5_block SET visible = 0 WHERE name = 'panopto';

-- Set SAMIS full sync setting to Off
UPDATE mdl5_config SET value = 0 WHERE name = 'sits_cron_select';
UPDATE mdl5_config SET value = 0 WHERE name = 'sits_gui_enabled';
UPDATE mdl5_block SET cron = 0 WHERE name = 'gradeout';

