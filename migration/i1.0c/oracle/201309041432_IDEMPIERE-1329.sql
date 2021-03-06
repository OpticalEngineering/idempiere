SET SQLBLANKLINES ON
SET DEFINE OFF

-- Sep 4, 2013 2:23:31 PM COT
-- IDEMPIERE-1329 Images are being saved with EntityType=D
ALTER TABLE AD_Image MODIFY EntityType VARCHAR2(40) DEFAULT 'U'
;

-- Sep 4, 2013 2:23:32 PM COT
UPDATE AD_Image SET EntityType='U' WHERE EntityType IS NULL OR (EntityType='D' AND AD_Image_ID>=1000000)
;

SELECT register_migration_script('201309041432_IDEMPIERE-1329.sql') FROM dual
;

