SELECT * FROM  CAM_SAS 
WHERE SPR_CODE = '139062197/1'
AND MOD_CODE =  'AR00000'
AND AYR_CODE = '2013/4'
AND PSL_CODE = 'AY';

-- Student Module result screen
SELECT SMR_COMA,SMR_CRED,SMR_RSLT,SMR_PROC FROM INS_SMR
WHERE SPR_CODE = '139062197/1'
AND MOD_CODE =  'AR00000';

-- Student module result details
SELECT SMR_AGRD FROM INS_SMRT
WHERE SPR_CODE = '139062197/1'
AND MOD_CODE =  'AR00000';

-- Wipe out values for a user - gradeout testing
UPDATE INS_SMRT SET SMR_AGRD = '',SPR_CODE= '',AYR_CODE = '',MAV_OCCUR='',MOD_CODE='' WHERE SPR_CODE = '139062197/1' AND AYR_CODE = '2014/5';

UPDATE INS_SMR SET SMR_COMA = '',SMR_CRED = '',SMR_RSLT = '' , SMR_PROC = ''
WHERE SPR_CODE = '139062197/1'
AND MOD_CODE =  'AR00000' AND PSL_CODE = 'AY' AND AYR_CODE = '2013/4'




SELECT stu.stu_udf1 "username", smo.mod_code "sits_code", smo.psl_code "period_code", dpt.dpt_code "dep_code", 1 "role"
FROM ins_stu stu, cam_smo smo, ins_mod mod, ins_dpt dpt, srs_scj scj
where stu.stu_code=substr(smo.spr_code,1,9)
      AND smo.mod_code='CM10227'
      AND mod.DPT_CODE=dpt.DPT_CODE
      AND stu.stu_code=scj.scj_stuc
      AND SUBSTR(mod.mod_code,1,2) != 'ZZ'
      AND scj.scj_stac NOT IN ('G', 'DE', 'L', 'NS', 'T')