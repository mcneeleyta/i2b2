insert into i2b2data.i2b2data.[ENCOUNTER_MAPPING]
  (encounter_num, encounter_ide,
   encounter_ide_status, encounter_ide_source, project_id,
   patient_ide, patient_ide_source, UPDATE_DATE, UPLOAD_DATE,
   import_date, upload_id, download_date, sourcesystem_cd )
select next value for [i2b2data].[i2b2data].[SQ_UP_ENCDIM_ENCOUNTERNUM] as encounter_num
      , (SELECT cast(current_value as varchar(200))  FROM sys.sequences WHERE name = 'SQ_UP_ENCDIM_ENCOUNTERNUM') as encounter_ide
      , 'A' as encounter_ide_status
      , 'acs@health.missouri.edu' as encounter_ide_source
      , 'ACS' as project_id
      , pd.patient_num as patient_ide
      , 'Millenium' as patient_ide_source
	  , CURRENT_TIMESTAMP as update_date
	  , CURRENT_TIMESTAMP as upload_date
      , CURRENT_TIMESTAMP as import_date
      , null as upload_id
      , CURRENT_TIMESTAMP as download_date
      , 'acs@health.missouri.edu' as sourcesystem_cd
  from i2b2data.i2b2data.acs_zcta5_patient_zip_percent_diminsion_1 pd