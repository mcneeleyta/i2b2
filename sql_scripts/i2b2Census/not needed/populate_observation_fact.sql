insert into i2b2data.i2b2data.[OBSERVATION_FACT](
  patient_num, 
  encounter_num, 
  concept_cd,
  provider_id,
  start_date,
  modifier_cd,
  instance_num,
  valtype_cd,
  tval_char,
  nval_num,
  valueflag_cd,
  units_cd,
  end_date,
  location_cd,
  update_date,
  import_date, 
  upload_id, 
  download_date, 
  sourcesystem_cd)
select top 169150
  em.patient_ide as patient_num, 
  em.encounter_num,
  cast(tf.variable_code as varchar(50)) as concept_cd,
  em.project_id as provider_id,
  CURRENT_TIMESTAMP as start_date,
  '@' as modifier_cd,
  1 as instance_num,
  '@' as valtype_cd,
  null as tval_char,
  null as nval_num, 
  null as valueflag_cd, 
  null as units_cd,
  CURRENT_TIMESTAMP as end_date,
  '@' as location_cd,
  CURRENT_TIMESTAMP as update_date,
  CURRENT_TIMESTAMP as import_date, 
  null as upload_id,
  CURRENT_TIMESTAMP as download_date,
  em.encounter_ide_source as source_cd
from i2b2data.i2b2data.[ENCOUNTER_MAPPING] em, I2B2Census.I2B2Census.acs_20135a_definition tf
	where tf.total_column_name is not null
	and em.PROJECT_ID = 'ACS'



--delete from i2b2data.i2b2data.observation_fact
--where provider_id = 'ACS'

--select * from i2b2data.i2b2data.observation_fact
--where provider_id = 'ACS'

-- select top 10 * from i2b2data.i2b2data.ENCOUNTER_MAPPING em
-- where SOURCESYSTEM_CD = 'acs@health.missouri.edu'

