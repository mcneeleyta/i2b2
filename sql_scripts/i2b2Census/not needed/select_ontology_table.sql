select * from [I2B2Metadata].[i2b2_acs2]
order by c_hlevel asc

select * from [I2B2Census].[acs_20135a_definition]
where table_label like '%Families%'
order by table_label

--158
select 5 as c_hlevel,
       '\i2b2\acs\2013\20135a\zipcode\' + category + '\' as c_fullname,
	   category as c_name,
	   'N' as c_synonym_cd,
	   'CA' as c_visualattributes,
	   null as c_totalnum,
	   null as c_basecode,
	   null as c_metadataxml,
	   'patient_num' as c_facttablecolumn,
	   'acs_zcta5_patient_zip_percent_diminsion_1' as c_tablename,
	   'concept_path' as c_columnname,
	   'T' as c_columndatatype,
	   'like' as c_operator,
	   '\i2b2\acs\2013\20135a\zipcode\' + category + '\' as c_dimcode,
	   null as c_comment,
	   category as c_tooltip,
	   '@' as m_applied_path,
	   GetDate() as update_date,
	   GetDate() as download_date,
	   GetDate() as import_date,
	   'ACS' as sourcesystem_cd,
	   null as valuetype_cd,
	   null as m_exclusion_cd,
	   '\i2b2\acs\2013\20135a\zipcode\' + category + '\' as c_path,
	   null as c_symbol
  from (select distinct rtrim(ltrim(m.table_universe)) as category,
		  dataset_code
          from i2b2Census.i2b2Census.acs_20135a_definition m
		  where m.table_universe is not null) m

----------------------------------
--level 6
select 6 as c_hlevel,
       '\i2b2\acs\2013\20135a\zipcode\' + category + '\' as c_fullname,
	   name as c_name,
	   'N' as c_synonym_cd,
	   'CA' as c_visualattributes,
	   null as c_totalnum,
	   dataset_code + '_'+ table_source_code + 'lvl6' as c_basecode,
	   null as c_metadataxml,
	   'patient_num' as c_facttablecolumn,
	   'acs_zcta5_patient_zip_percent_diminsion_1' as c_tablename,
	   'concept_path' as c_columnname,
	   'T' as c_columndatatype,
	   'like' as c_operator,
	   '\i2b2\acs\2013\20135a\zipcode\' + category + '\' as c_dimcode,
	   null as c_comment,
	   name as c_tooltip,
	   '@' as m_applied_path,
	   GetDate() as update_date,
	   GetDate() as download_date,
	   GetDate() as import_date,
	   'ACS' as sourcesystem_cd,
	   null as valuetype_cd,
	   null as m_exclusion_cd,
	   '\i2b2\acs\2013\20135a\zipcode\' + category + '\' as c_path,
	   null as c_symbol
  from (select distinct (rtrim(ltrim(table_universe)) + '\' + rtrim(ltrim(table_label))) as category,
		rtrim(ltrim(table_label)) as name, dataset_code, table_source_code
          from i2b2Census.i2b2Census.acs_20135a_definition m
		  where table_universe is not null) m
order by c_fullname asc

------------------------------------------
--level 7
select 7 as c_hlevel,
       '\i2b2\acs\2013\20135a\zipcode\' + category + '\' as c_fullname,
	   name as c_name,
	   'N' as c_synonym_cd,
	   'CA' as c_visualattributes,
	   null as c_totalnum,
	   dataset_code + '_'+ table_source_code + '_' + variable_code + 'lvl7' as c_basecode,
	   null as c_metadataxml,
	   'patient_num' as c_facttablecolumn,
	   'acs_zcta5_patient_zip_percent_diminsion_1' as c_tablename,
	   'concept_path' as c_columnname,
	   'T' as c_columndatatype,
	   'like' as c_operator,
	   '\i2b2\acs\2013\20135a\zipcode\' + category + '\' as c_dimcode,
	   null as c_comment,
	   name as c_tooltip,
	   '@' as m_applied_path,
	   GetDate() as update_date,
	   GetDate() as download_date,
	   GetDate() as import_date,
	   'ACS' as sourcesystem_cd,
	   null as valuetype_cd,
	   null as m_exclusion_cd,
	   '\i2b2\acs\2013\20135a\zipcode\' + category + '\' as c_path,
	   null as c_symbol
  from (select distinct (rtrim(ltrim(table_universe)) + '\' + rtrim(ltrim(table_label)) + '\' + rtrim(ltrim(variable_label))) as category,
		rtrim(ltrim(variable_label)) as name, dataset_code, table_source_code, variable_code
          from i2b2Census.i2b2Census.acs_20135a_definition m
		  where table_universe is not null
		  and variable_label != 'Total'
		  ) m
order by c_fullname asc

----------------------------------------------------------
--level 8 percentage level
select 8 as c_hlevel,
       '\i2b2\acs\2013\20135a\zipcode\' + category + '\Percentage\' as c_fullname,
	   name as c_name,
	   'N' as c_synonym_cd,
	   'CA' as c_visualattributes,
	   null as c_totalnum,
	   dataset_code + '_'+ table_source_code + '_' + variable_code + 'lvl8' as c_basecode,
	   null as c_metadataxml,
	   'patient_num' as c_facttablecolumn,
	   'acs_zcta5_patient_zip_percent_diminsion_1' as c_tablename,
	   'concept_path' as c_columnname,
	   'T' as c_columndatatype,
	   'like' as c_operator,
	   '\i2b2\acs\2013\20135a\zipcode\' + category + '\Percentage\' as c_dimcode,
	   null as c_comment,
	   name as c_tooltip,
	   '@' as m_applied_path,
	   GetDate() as update_date,
	   GetDate() as download_date,
	   GetDate() as import_date,
	   'ACS' as sourcesystem_cd,
	   null as valuetype_cd,
	   null as m_exclusion_cd,
	   '\i2b2\acs\2013\20135a\zipcode\' + category + '\Percentage\' as c_path,
	   null as c_symbol
  from (select distinct (rtrim(ltrim(table_universe)) + '\' + rtrim(ltrim(table_label)) + '\' + rtrim(ltrim(variable_label))) as category,
		'Percentage' as name, dataset_code, table_source_code, variable_code
          from i2b2Census.i2b2Census.acs_20135a_definition m
		  where table_universe is not null
		  and table_label in (select table_label from i2b2Census.i2b2Census.acs_20135a_definition
								where variable_label = 'Total')
		  and variable_label != 'Total'
		  ) m
order by c_fullname asc

--------------------------------------------------------------
--level 9 percentage  3383
select 9 as c_hlevel,
       '\i2b2\acs\2013\20135a\zipcode\' + category + '\Percentage\0-9.99' as c_fullname,
	   name as c_name,
	   'N' as c_synonym_cd,
	   'FA' as c_visualattributes,
	   null as c_totalnum,
	   dataset_code + '_'+ table_source_code + '_' + variable_code + '_lvl9_pct_0_9' as c_basecode,
	   null as c_metadataxml,
	   'patient_num' as c_facttablecolumn,
	    case when table_location = 1 then 'acs_zcta5_patient_zip_percent_diminsion_1'
		when table_location = 2 then 'acs_zcta5_patient_zip_percent_diminsion_2'
		when table_location = 3 then 'acs_zcta5_patient_zip_percent_diminsion_3'
		when table_location = 4 then 'acs_zcta5_patient_zip_percent_diminsion_4'
		when table_location = 5 then 'acs_zcta5_patient_zip_percent_diminsion_5'
		when table_location = 6 then 'acs_zcta5_patient_zip_percent_diminsion_6'
		else 'x' end as c_tablename,
	   'concept_path' as c_columnname,
	   'T' as c_columndatatype,
	   'between' as c_operator,
	   '0 and 9.99' as c_dimcode,
	   null as c_comment,
	   name as c_tooltip,
	   '@' as m_applied_path,
	   GetDate() as update_date,
	   GetDate() as download_date,
	   GetDate() as import_date,
	   'ACS' as sourcesystem_cd,
	   null as valuetype_cd,
	   null as m_exclusion_cd,
	   '\i2b2\acs\2013\20135a\zipcode\' + category + '\Percentage\0-9.99' as c_path,
	   null as c_symbol
  from (select distinct (rtrim(ltrim(table_universe)) + '\' + rtrim(ltrim(table_label)) + '\' + rtrim(ltrim(variable_label))) as category,
		'0-9.99' as name, dataset_code, table_source_code, variable_code, table_location
          from i2b2Census.i2b2Census.acs_20135a_definition m
		  where table_universe is not null
		  and table_label in (select table_label from i2b2Census.i2b2Census.acs_20135a_definition
								where variable_label = 'Total')
		  and variable_label != 'Total'
		  ) m
order by c_fullname asc



select * from i2b2Census.i2b2Census.acs_20135a_definition
where table_universe is not null
and table_label in (select table_label from i2b2Census.i2b2Census.acs_20135a_definition
						where variable_label = 'Total')
order by variable_code asc


select * from i2b2Census.i2b2Census.acs_20135a_definition
where table_universe = 'Asian alone population 15 years and over'
order by table_universe asc

--from (select distinct rtrim(ltrim(substring(table_universe, charindex(';', table_universe)+1, charindex(' - ', table_universe)-charindex(';', table_universe)-1))) as category


--select 5 as c_hlevel,
--       '\i2b2\acs\2013\20135a\zipcode\' + category + '\' as c_fullname,
--	   category as c_name,
--	   'N' as c_synonym_cd,
--	   'CA' as c_visualattributes,
--	   null as c_totalnum,
--	   'ACS-2013-ZIP:' + substring(category, 1, 30) as c_basecode,
--	   null as c_metadataxml,
--	   'concept_cd' as c_facttablecolumn,
--	   'concept_dimension' as c_tablename,
--	   'concept_path' as c_columnname,
--	   'T' as c_columndatatype,
--	   'like' as c_operator,
--	   '\i2b2\acs\2013\20135a\zipcode\' + category + '\' as c_dimcode,
--	   null as c_comment,
--	   category as c_tooltip,
--	   '@' as m_applied_path,
--	   GetDate() as update_date,
--	   GetDate() as download_date,
--	   GetDate() as import_date,
--	   'ACS' as sourcesystem_cd,
--	   null as valuetype_cd,
--	   null as m_exclusion_cd,
--	   '\i2b2\acs\2013\20135a\zipcode\' + category + '\' as c_path,
--	   null as c_symbol
--  from (select distinct rtrim(ltrim(substring(description, charindex(';', description)+1, charindex(' - ', description)-charindex(';', description)-1))) as category
--          from i2b2data.i2b2data.ACS_13_5YR_DP03_zip_meta m
--		  where column_name not in ('GEO.id', 'GEO.id2', 'GEO.display-label')) m