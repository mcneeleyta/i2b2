--delete from i2b2metadata.i2b2metadata.i2b2_acs

--select * from i2b2metadata.i2b2metadata.i2b2_acs

insert into i2b2metadata.i2b2metadata.i2b2_acs(c_hlevel, c_fullname, c_name, c_synonym_cd, c_visualattributes, c_facttablecolumn, c_tablename, c_columnname,
  c_columndatatype, c_operator, c_dimcode, c_tooltip, m_applied_path, update_date, download_date, import_date, sourcesystem_cd)
  values(1, '\i2b2\acs\', 'American Community Survey', 'N', 'CA', 'patient_num', 'concept_dimension', 'concept_path',
         'T', 'LIKE', '\i2b2\acs\', 'American Community Survey', '@', GetDate(), GetDate(), GetDate(), 'ACS');

insert into i2b2metadata.i2b2metadata.i2b2_acs(c_hlevel, c_fullname, c_name, c_synonym_cd, c_visualattributes, c_facttablecolumn, c_tablename, c_columnname,
  c_columndatatype, c_operator, c_dimcode, c_tooltip, m_applied_path, update_date, download_date, import_date, sourcesystem_cd)
  values(2, '\i2b2\acs\2013\', '2013 American Community Survey', 'N', 'CA', 'patient_num', 'concept_dimension', 'concept_path',
         'T', 'LIKE', '\i2b2\acs\2013\', '2013 American Community Survey', '@', GetDate(), GetDate(), GetDate(), 'ACS');

insert into i2b2metadata.i2b2metadata.i2b2_acs(c_hlevel, c_fullname, c_name, c_synonym_cd, c_visualattributes, c_facttablecolumn, c_tablename, c_columnname,
  c_columndatatype, c_operator, c_dimcode, c_tooltip, m_applied_path, update_date, download_date, import_date, sourcesystem_cd)
  values(3, '\i2b2\acs\2013\20135a\', '2013 American Community Survey group A files', 'N', 'CA', 'patient_num', 'concept_dimension', 'concept_path',
         'T', 'LIKE', '\i2b2\acs\2013\20135a\', '2013 American Community Survey group A files', '@', GetDate(), GetDate(), GetDate(), 'ACS');

insert into i2b2metadata.i2b2metadata.i2b2_acs(c_hlevel, c_fullname, c_name, c_synonym_cd, c_visualattributes, c_facttablecolumn, c_tablename, c_columnname,
  c_columndatatype, c_operator, c_dimcode, c_tooltip, m_applied_path, update_date, download_date, import_date, sourcesystem_cd)
  values(3, '\i2b2\acs\2013\20135b\', '2013 American Community Survey group B files', 'N', 'CA', 'patient_num', 'concept_dimension', 'concept_path',
         'T', 'LIKE', '\i2b2\acs\2013\20135b\', '2013 American Community Survey group A files', '@', GetDate(), GetDate(), GetDate(), 'ACS');

insert into i2b2metadata.i2b2metadata.i2b2_acs(c_hlevel, c_fullname, c_name, c_synonym_cd, c_visualattributes, c_facttablecolumn, c_tablename, c_columnname,
  c_columndatatype, c_operator, c_dimcode, c_tooltip, m_applied_path, update_date, download_date, import_date, sourcesystem_cd)
  values(4, '\i2b2\acs\2013\20135a\zipcode\', '2013 American Community Survey by 5 digit zipcode', 'N', 'CA', 'patient_num', 'concept_dimension', 'concept_path',
         'T', 'LIKE', '\i2b2\acs\2013\20135a\zipcode\', '2013 American Community Survey by 5 digit zipcode', '@', GetDate(), GetDate(), GetDate(), 'ACS');

insert into i2b2metadata.i2b2metadata.i2b2_acs(c_hlevel, c_fullname, c_name, c_synonym_cd, c_visualattributes, c_facttablecolumn, c_tablename, c_columnname,
  c_columndatatype, c_operator, c_dimcode, c_tooltip, m_applied_path, update_date, download_date, import_date, sourcesystem_cd)
  values(4, '\i2b2\acs\2013\20135b\zipcode\', '2013 American Community Survey by 5 digit zipcode', 'N', 'CA', 'patient_num', 'concept_dimension', 'concept_path',
         'T', 'LIKE', '\i2b2\acs\2013\20135b\zipcode\', '2013 American Community Survey by 5 digit zipcode', '@', GetDate(), GetDate(), GetDate(), 'ACS');

insert into i2b2metadata.i2b2metadata.i2b2_acs(c_hlevel, c_fullname, c_name, c_synonym_cd, c_visualattributes, c_totalnum, c_basecode, c_metadataxml, 
  c_facttablecolumn, c_tablename, c_columnname,
  c_columndatatype, c_operator, c_dimcode, c_comment, c_tooltip, m_applied_path, update_date, download_date, import_date, sourcesystem_cd,
  valuetype_cd, m_exclusion_cd, c_path, c_symbol)
select 5 as c_hlevel,
       '\i2b2\acs\2013\20135a\zipcode\' + category + '\' as c_fullname,
	   category as c_name,
	   'N' as c_synonym_cd,
	   'CA' as c_visualattributes,
	   null as c_totalnum,
	   '' as c_basecode,
	   null as c_metadataxml,
	   'patient_num' as c_facttablecolumn,
	   'concept_dimension' as c_tablename,
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
	   --'\i2b2\acs\2013\20135a\zipcode\' + category + '\' as c_path,
	   '' as c_path,
	   null as c_symbol
  from (select distinct rtrim(ltrim(table_universe)) as category
          from i2b2Census.i2b2Census.acs_20135a_definition m
		  where table_universe is not null) m

----------------------------------
--level 6
insert into i2b2metadata.i2b2metadata.i2b2_acs(c_hlevel, c_fullname, c_name, c_synonym_cd, c_visualattributes, c_totalnum, c_basecode, c_metadataxml, 
  c_facttablecolumn, c_tablename, c_columnname,
  c_columndatatype, c_operator, c_dimcode, c_comment, c_tooltip, m_applied_path, update_date, download_date, import_date, sourcesystem_cd,
  valuetype_cd, m_exclusion_cd, c_path, c_symbol)
select 6 as c_hlevel,
       '\i2b2\acs\2013\20135a\zipcode\' + category + '\' as c_fullname,
	   name as c_name,
	   'N' as c_synonym_cd,
	   'CA' as c_visualattributes,
	   null as c_totalnum,
	   '' as c_basecode,
	   null as c_metadataxml,
	   'patient_num' as c_facttablecolumn,
	   'concept_dimension' as c_tablename,
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
	   --'\i2b2\acs\2013\20135a\zipcode\' + category + '\' as c_path,
	   	'' as c_path,
	   null as c_symbol
  from (select distinct (rtrim(ltrim(table_universe)) + '\' + rtrim(ltrim(table_label))) as category,
		rtrim(ltrim(table_label)) as name, dataset_code, table_source_code
          from i2b2Census.i2b2Census.acs_20135a_definition m
		  where table_universe is not null) m

------------------------------------------
--level 7
insert into i2b2metadata.i2b2metadata.i2b2_acs(c_hlevel, c_fullname, c_name, c_synonym_cd, c_visualattributes, c_totalnum, c_basecode, c_metadataxml, 
  c_facttablecolumn, c_tablename, c_columnname,
  c_columndatatype, c_operator, c_dimcode, c_comment, c_tooltip, m_applied_path, update_date, download_date, import_date, sourcesystem_cd,
  valuetype_cd, m_exclusion_cd, c_path, c_symbol)
select 7 as c_hlevel,
       '\i2b2\acs\2013\20135a\zipcode\' + category + '\' as c_fullname,
	   name as c_name,
	   'N' as c_synonym_cd,
	   'CA' as c_visualattributes,
	   null as c_totalnum,
	   '' as c_basecode,
	   null as c_metadataxml,
	   'patient_num' as c_facttablecolumn,
	   'concept_dimension' as c_tablename,
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
	   --'\i2b2\acs\2013\20135a\zipcode\' + category + '\' as c_path,
	   '' as c_path,
	   null as c_symbol
  from (select distinct (rtrim(ltrim(table_universe)) + '\' + rtrim(ltrim(table_label)) + '\' + rtrim(ltrim(variable_label))) as category,
		rtrim(ltrim(variable_label)) as name, dataset_code, table_source_code, variable_code
          from i2b2Census.i2b2Census.acs_20135a_definition m
		  where table_universe is not null
		  and variable_label != 'Total'
		  ) m

--------------------------------------------------------------------
--level 8 percentage
insert into i2b2metadata.i2b2metadata.i2b2_acs(c_hlevel, c_fullname, c_name, c_synonym_cd, c_visualattributes, c_totalnum, c_basecode, c_metadataxml, 
  c_facttablecolumn, c_tablename, c_columnname,
  c_columndatatype, c_operator, c_dimcode, c_comment, c_tooltip, m_applied_path, update_date, download_date, import_date, sourcesystem_cd,
  valuetype_cd, m_exclusion_cd, c_path, c_symbol)
select 8 as c_hlevel,
       '\i2b2\acs\2013\20135a\zipcode\' + category + '\Percentage\' as c_fullname,
	   name as c_name,
	   'N' as c_synonym_cd,
	   'CA' as c_visualattributes,
	   null as c_totalnum,
	   '' as c_basecode,
	   null as c_metadataxml,
	   'patient_num' as c_facttablecolumn,
	   'concept_dimension' as c_tablename,
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
	   --'\i2b2\acs\2013\20135a\zipcode\' + category + '\Percentage\' as c_path,
	   '' as c_path,
	   null as c_symbol
  from (select distinct (rtrim(ltrim(table_universe)) + '\' + rtrim(ltrim(table_label)) + '\' + rtrim(ltrim(variable_label))) as category,
		'Percentage' as name, dataset_code, table_source_code, variable_code
          from i2b2Census.i2b2Census.acs_20135a_definition m
		  where table_universe is not null
		  and table_label in (select table_label from i2b2Census.i2b2Census.acs_20135a_definition
								where variable_label = 'Total')
		  and variable_label != 'Total'
		  ) m

----------------------------------------------
--level 9 percentages
insert into i2b2metadata.i2b2metadata.i2b2_acs(c_hlevel, c_fullname, c_name, c_synonym_cd, c_visualattributes, c_totalnum, c_basecode, c_metadataxml, 
  c_facttablecolumn, c_tablename, c_columnname,
  c_columndatatype, c_operator, c_dimcode, c_comment, c_tooltip, m_applied_path, update_date, download_date, import_date, sourcesystem_cd,
  valuetype_cd, m_exclusion_cd, c_path, c_symbol)
select 9 as c_hlevel,
       '\i2b2\acs\2013\20135a\zipcode\' + category + '\Percentage\0-9.99\' as c_fullname,
	   name as c_name,
	   'N' as c_synonym_cd,
	   'FA' as c_visualattributes,
	   null as c_totalnum,
	   dataset_code + '_'+ table_source_code + '_' + variable_code + '_lvl9_pct_0_9' as c_basecode,
	   null as c_metadataxml,
	   'patient_num' as c_facttablecolumn,
	    case when table_location = 1 then 'acs_zcta5_patient_zip_percent_dimension_1'
		when table_location = 2 then 'vw_acs_zcta5_patient_zip_percent_dimension_2'
		when table_location = 3 then 'vw_acs_zcta5_patient_zip_percent_dimension_3'
		when table_location = 4 then 'vw_acs_zcta5_patient_zip_percent_dimension_4'
		when table_location = 5 then 'vw_acs_zcta5_patient_zip_percent_dimension_5'
		when table_location = 6 then 'vw_acs_zcta5_patient_zip_percent_dimension_6'
		else 'x' end as c_tablename,
	   variable_code as c_columnname,
	   'N' as c_columndatatype,
	   'BETWEEN' as c_operator,
       '0 AND 9.99' as c_dimcode,
	   null as c_comment,
	   name as c_tooltip,
	   '@' as m_applied_path,
	   GetDate() as update_date,
	   GetDate() as download_date,
	   GetDate() as import_date,
	   'ACS' as sourcesystem_cd,
	   null as valuetype_cd,
	   null as m_exclusion_cd,
	   '\i2b2\acs\2013\20135a\zipcode\' + category + '\Percentage\0-9.99\' as c_path,
	   null as c_symbol
  from (select distinct (rtrim(ltrim(table_universe)) + '\' + rtrim(ltrim(table_label)) + '\' + rtrim(ltrim(variable_label))) as category,
		'0-9.99' as name, dataset_code, table_source_code, variable_code, table_location
          from i2b2Census.i2b2Census.acs_20135a_definition m
		  where table_universe is not null
		  and table_label in (select table_label from i2b2Census.i2b2Census.acs_20135a_definition
								where variable_label = 'Total')
		  and variable_label != 'Total'
		  ) m


--10-19
insert into i2b2metadata.i2b2metadata.i2b2_acs(c_hlevel, c_fullname, c_name, c_synonym_cd, c_visualattributes, c_totalnum, c_basecode, c_metadataxml, 
  c_facttablecolumn, c_tablename, c_columnname,
  c_columndatatype, c_operator, c_dimcode, c_comment, c_tooltip, m_applied_path, update_date, download_date, import_date, sourcesystem_cd,
  valuetype_cd, m_exclusion_cd, c_path, c_symbol)
select 9 as c_hlevel,
       '\i2b2\acs\2013\20135a\zipcode\' + category + '\Percentage\10-19.99\' as c_fullname,
	   name as c_name,
	   'N' as c_synonym_cd,
	   'FA' as c_visualattributes,
	   null as c_totalnum,
	   dataset_code + '_'+ table_source_code + '_' + variable_code + '_lvl9_pct_10_19' as c_basecode,
	   null as c_metadataxml,
	   'patient_num' as c_facttablecolumn,
	    case when table_location = 1 then 'acs_zcta5_patient_zip_percent_dimension_1'
		when table_location = 2 then 'vw_acs_zcta5_patient_zip_percent_dimension_2'
		when table_location = 3 then 'vw_acs_zcta5_patient_zip_percent_dimension_3'
		when table_location = 4 then 'vw_acs_zcta5_patient_zip_percent_dimension_4'
		when table_location = 5 then 'vw_acs_zcta5_patient_zip_percent_dimension_5'
		when table_location = 6 then 'vw_acs_zcta5_patient_zip_percent_dimension_6'
		else 'x' end as c_tablename,
	   variable_code as c_columnname,
	   'N' as c_columndatatype,
	   'BETWEEN' as c_operator,
       '10 AND 19.99' as c_dimcode,
	   null as c_comment,
	   name as c_tooltip,
	   '@' as m_applied_path,
	   GetDate() as update_date,
	   GetDate() as download_date,
	   GetDate() as import_date,
	   'ACS' as sourcesystem_cd,
	   null as valuetype_cd,
	   null as m_exclusion_cd,
	   '\i2b2\acs\2013\20135a\zipcode\' + category + '\Percentage\10-19.99\' as c_path,
	   null as c_symbol
  from (select distinct (rtrim(ltrim(table_universe)) + '\' + rtrim(ltrim(table_label)) + '\' + rtrim(ltrim(variable_label))) as category,
		'10-19.99' as name, dataset_code, table_source_code, variable_code, table_location
          from i2b2Census.i2b2Census.acs_20135a_definition m
		  where table_universe is not null
		  and table_label in (select table_label from i2b2Census.i2b2Census.acs_20135a_definition
								where variable_label = 'Total')
		  and variable_label != 'Total'
		  ) m


--20-29
insert into i2b2metadata.i2b2metadata.i2b2_acs(c_hlevel, c_fullname, c_name, c_synonym_cd, c_visualattributes, c_totalnum, c_basecode, c_metadataxml, 
  c_facttablecolumn, c_tablename, c_columnname,
  c_columndatatype, c_operator, c_dimcode, c_comment, c_tooltip, m_applied_path, update_date, download_date, import_date, sourcesystem_cd,
  valuetype_cd, m_exclusion_cd, c_path, c_symbol)
select 9 as c_hlevel,
       '\i2b2\acs\2013\20135a\zipcode\' + category + '\Percentage\20-29.99\' as c_fullname,
	   name as c_name,
	   'N' as c_synonym_cd,
	   'FA' as c_visualattributes,
	   null as c_totalnum,
	   dataset_code + '_'+ table_source_code + '_' + variable_code + '_lvl9_pct_20_29' as c_basecode,
	   null as c_metadataxml,
	   'patient_num' as c_facttablecolumn,
	    case when table_location = 1 then 'acs_zcta5_patient_zip_percent_dimension_1'
		when table_location = 2 then 'vw_acs_zcta5_patient_zip_percent_dimension_2'
		when table_location = 3 then 'vw_acs_zcta5_patient_zip_percent_dimension_3'
		when table_location = 4 then 'vw_acs_zcta5_patient_zip_percent_dimension_4'
		when table_location = 5 then 'vw_acs_zcta5_patient_zip_percent_dimension_5'
		when table_location = 6 then 'vw_acs_zcta5_patient_zip_percent_dimension_6'
		else 'x' end as c_tablename,
	   variable_code as c_columnname,
	   'N' as c_columndatatype,
	   'BETWEEN' as c_operator,
       '20 AND 29.99' as c_dimcode,
	   null as c_comment,
	   name as c_tooltip,
	   '@' as m_applied_path,
	   GetDate() as update_date,
	   GetDate() as download_date,
	   GetDate() as import_date,
	   'ACS' as sourcesystem_cd,
	   null as valuetype_cd,
	   null as m_exclusion_cd,
	   '\i2b2\acs\2013\20135a\zipcode\' + category + '\Percentage\20-29.99\' as c_path,
	   null as c_symbol
  from (select distinct (rtrim(ltrim(table_universe)) + '\' + rtrim(ltrim(table_label)) + '\' + rtrim(ltrim(variable_label))) as category,
		'20-29.99' as name, dataset_code, table_source_code, variable_code, table_location
          from i2b2Census.i2b2Census.acs_20135a_definition m
		  where table_universe is not null
		  and table_label in (select table_label from i2b2Census.i2b2Census.acs_20135a_definition
								where variable_label = 'Total')
		  and variable_label != 'Total'
		  ) m


--30-39
insert into i2b2metadata.i2b2metadata.i2b2_acs(c_hlevel, c_fullname, c_name, c_synonym_cd, c_visualattributes, c_totalnum, c_basecode, c_metadataxml, 
  c_facttablecolumn, c_tablename, c_columnname,
  c_columndatatype, c_operator, c_dimcode, c_comment, c_tooltip, m_applied_path, update_date, download_date, import_date, sourcesystem_cd,
  valuetype_cd, m_exclusion_cd, c_path, c_symbol)
select 9 as c_hlevel,
       '\i2b2\acs\2013\20135a\zipcode\' + category + '\Percentage\30-39.99\' as c_fullname,
	   name as c_name,
	   'N' as c_synonym_cd,
	   'FA' as c_visualattributes,
	   null as c_totalnum,
	   dataset_code + '_'+ table_source_code + '_' + variable_code + '_lvl9_pct_30_39' as c_basecode,
	   null as c_metadataxml,
	   'patient_num' as c_facttablecolumn,
	    case when table_location = 1 then 'acs_zcta5_patient_zip_percent_dimension_1'
		when table_location = 2 then 'vw_acs_zcta5_patient_zip_percent_dimension_2'
		when table_location = 3 then 'vw_acs_zcta5_patient_zip_percent_dimension_3'
		when table_location = 4 then 'vw_acs_zcta5_patient_zip_percent_dimension_4'
		when table_location = 5 then 'vw_acs_zcta5_patient_zip_percent_dimension_5'
		when table_location = 6 then 'vw_acs_zcta5_patient_zip_percent_dimension_6'
		else 'x' end as c_tablename,
	   variable_code as c_columnname,
	   'N' as c_columndatatype,
	   'BETWEEN' as c_operator,
       '30 AND 39.99' as c_dimcode,
	   null as c_comment,
	   name as c_tooltip,
	   '@' as m_applied_path,
	   GetDate() as update_date,
	   GetDate() as download_date,
	   GetDate() as import_date,
	   'ACS' as sourcesystem_cd,
	   null as valuetype_cd,
	   null as m_exclusion_cd,
	   '\i2b2\acs\2013\20135a\zipcode\' + category + '\Percentage\30-39.99\' as c_path,
	   null as c_symbol
  from (select distinct (rtrim(ltrim(table_universe)) + '\' + rtrim(ltrim(table_label)) + '\' + rtrim(ltrim(variable_label))) as category,
		'30-39.99' as name, dataset_code, table_source_code, variable_code, table_location
          from i2b2Census.i2b2Census.acs_20135a_definition m
		  where table_universe is not null
		  and table_label in (select table_label from i2b2Census.i2b2Census.acs_20135a_definition
								where variable_label = 'Total')
		  and variable_label != 'Total'
		  ) m


--40-49
insert into i2b2metadata.i2b2metadata.i2b2_acs(c_hlevel, c_fullname, c_name, c_synonym_cd, c_visualattributes, c_totalnum, c_basecode, c_metadataxml, 
  c_facttablecolumn, c_tablename, c_columnname,
  c_columndatatype, c_operator, c_dimcode, c_comment, c_tooltip, m_applied_path, update_date, download_date, import_date, sourcesystem_cd,
  valuetype_cd, m_exclusion_cd, c_path, c_symbol)
select 9 as c_hlevel,
       '\i2b2\acs\2013\20135a\zipcode\' + category + '\Percentage\40-49.99\' as c_fullname,
	   name as c_name,
	   'N' as c_synonym_cd,
	   'FA' as c_visualattributes,
	   null as c_totalnum,
	   dataset_code + '_'+ table_source_code + '_' + variable_code + '_lvl9_pct_40_49' as c_basecode,
	   null as c_metadataxml,
	   'patient_num' as c_facttablecolumn,
	    case when table_location = 1 then 'acs_zcta5_patient_zip_percent_dimension_1'
		when table_location = 2 then 'vw_acs_zcta5_patient_zip_percent_dimension_2'
		when table_location = 3 then 'vw_acs_zcta5_patient_zip_percent_dimension_3'
		when table_location = 4 then 'vw_acs_zcta5_patient_zip_percent_dimension_4'
		when table_location = 5 then 'vw_acs_zcta5_patient_zip_percent_dimension_5'
		when table_location = 6 then 'vw_acs_zcta5_patient_zip_percent_dimension_6'
		else 'x' end as c_tablename,
	   variable_code as c_columnname,
	   'N' as c_columndatatype,
	   'BETWEEN' as c_operator,
       '40 AND 49.99' as c_dimcode,
	   null as c_comment,
	   name as c_tooltip,
	   '@' as m_applied_path,
	   GetDate() as update_date,
	   GetDate() as download_date,
	   GetDate() as import_date,
	   'ACS' as sourcesystem_cd,
	   null as valuetype_cd,
	   null as m_exclusion_cd,
	   '\i2b2\acs\2013\20135a\zipcode\' + category + '\Percentage\40-49.99\' as c_path,
	   null as c_symbol
  from (select distinct (rtrim(ltrim(table_universe)) + '\' + rtrim(ltrim(table_label)) + '\' + rtrim(ltrim(variable_label))) as category,
		'40-49.99' as name, dataset_code, table_source_code, variable_code, table_location
          from i2b2Census.i2b2Census.acs_20135a_definition m
		  where table_universe is not null
		  and table_label in (select table_label from i2b2Census.i2b2Census.acs_20135a_definition
								where variable_label = 'Total')
		  and variable_label != 'Total'
		  ) m


--50-59
insert into i2b2metadata.i2b2metadata.i2b2_acs(c_hlevel, c_fullname, c_name, c_synonym_cd, c_visualattributes, c_totalnum, c_basecode, c_metadataxml, 
  c_facttablecolumn, c_tablename, c_columnname,
  c_columndatatype, c_operator, c_dimcode, c_comment, c_tooltip, m_applied_path, update_date, download_date, import_date, sourcesystem_cd,
  valuetype_cd, m_exclusion_cd, c_path, c_symbol)
select 9 as c_hlevel,
       '\i2b2\acs\2013\20135a\zipcode\' + category + '\Percentage\50-59.99\' as c_fullname,
	   name as c_name,
	   'N' as c_synonym_cd,
	   'FA' as c_visualattributes,
	   null as c_totalnum,
	   dataset_code + '_'+ table_source_code + '_' + variable_code + '_lvl9_pct_50_59' as c_basecode,
	   null as c_metadataxml,
	   'patient_num' as c_facttablecolumn,
	    case when table_location = 1 then 'acs_zcta5_patient_zip_percent_dimension_1'
		when table_location = 2 then 'vw_acs_zcta5_patient_zip_percent_dimension_2'
		when table_location = 3 then 'vw_acs_zcta5_patient_zip_percent_dimension_3'
		when table_location = 4 then 'vw_acs_zcta5_patient_zip_percent_dimension_4'
		when table_location = 5 then 'vw_acs_zcta5_patient_zip_percent_dimension_5'
		when table_location = 6 then 'vw_acs_zcta5_patient_zip_percent_dimension_6'
		else 'x' end as c_tablename,
	   variable_code as c_columnname,
	   'N' as c_columndatatype,
	   'BETWEEN' as c_operator,
       '50 AND 59.99' as c_dimcode,
	   null as c_comment,
	   name as c_tooltip,
	   '@' as m_applied_path,
	   GetDate() as update_date,
	   GetDate() as download_date,
	   GetDate() as import_date,
	   'ACS' as sourcesystem_cd,
	   null as valuetype_cd,
	   null as m_exclusion_cd,
	   '\i2b2\acs\2013\20135a\zipcode\' + category + '\Percentage\50-59.99\' as c_path,
	   null as c_symbol
  from (select distinct (rtrim(ltrim(table_universe)) + '\' + rtrim(ltrim(table_label)) + '\' + rtrim(ltrim(variable_label))) as category,
		'50-59.99' as name, dataset_code, table_source_code, variable_code, table_location
          from i2b2Census.i2b2Census.acs_20135a_definition m
		  where table_universe is not null
		  and table_label in (select table_label from i2b2Census.i2b2Census.acs_20135a_definition
								where variable_label = 'Total')
		  and variable_label != 'Total'
		  ) m

--60-69
insert into i2b2metadata.i2b2metadata.i2b2_acs(c_hlevel, c_fullname, c_name, c_synonym_cd, c_visualattributes, c_totalnum, c_basecode, c_metadataxml, 
  c_facttablecolumn, c_tablename, c_columnname,
  c_columndatatype, c_operator, c_dimcode, c_comment, c_tooltip, m_applied_path, update_date, download_date, import_date, sourcesystem_cd,
  valuetype_cd, m_exclusion_cd, c_path, c_symbol)
select 9 as c_hlevel,
       '\i2b2\acs\2013\20135a\zipcode\' + category + '\Percentage\60-69.99\' as c_fullname,
	   name as c_name,
	   'N' as c_synonym_cd,
	   'FA' as c_visualattributes,
	   null as c_totalnum,
	   dataset_code + '_'+ table_source_code + '_' + variable_code + '_lvl9_pct_60_69' as c_basecode,
	   null as c_metadataxml,
	   'patient_num' as c_facttablecolumn,
	    case when table_location = 1 then 'acs_zcta5_patient_zip_percent_dimension_1'
		when table_location = 2 then 'vw_acs_zcta5_patient_zip_percent_dimension_2'
		when table_location = 3 then 'vw_acs_zcta5_patient_zip_percent_dimension_3'
		when table_location = 4 then 'vw_acs_zcta5_patient_zip_percent_dimension_4'
		when table_location = 5 then 'vw_acs_zcta5_patient_zip_percent_dimension_5'
		when table_location = 6 then 'vw_acs_zcta5_patient_zip_percent_dimension_6'
		else 'x' end as c_tablename,
	   variable_code as c_columnname,
	   'N' as c_columndatatype,
	   'BETWEEN' as c_operator,
       '60 AND 69.99' as c_dimcode,
	   null as c_comment,
	   name as c_tooltip,
	   '@' as m_applied_path,
	   GetDate() as update_date,
	   GetDate() as download_date,
	   GetDate() as import_date,
	   'ACS' as sourcesystem_cd,
	   null as valuetype_cd,
	   null as m_exclusion_cd,
	   '\i2b2\acs\2013\20135a\zipcode\' + category + '\Percentage\60-69.99\' as c_path,
	   null as c_symbol
  from (select distinct (rtrim(ltrim(table_universe)) + '\' + rtrim(ltrim(table_label)) + '\' + rtrim(ltrim(variable_label))) as category,
		'60-69.99' as name, dataset_code, table_source_code, variable_code, table_location
          from i2b2Census.i2b2Census.acs_20135a_definition m
		  where table_universe is not null
		  and table_label in (select table_label from i2b2Census.i2b2Census.acs_20135a_definition
								where variable_label = 'Total')
		  and variable_label != 'Total'
		  ) m

--70-79
insert into i2b2metadata.i2b2metadata.i2b2_acs(c_hlevel, c_fullname, c_name, c_synonym_cd, c_visualattributes, c_totalnum, c_basecode, c_metadataxml, 
  c_facttablecolumn, c_tablename, c_columnname,
  c_columndatatype, c_operator, c_dimcode, c_comment, c_tooltip, m_applied_path, update_date, download_date, import_date, sourcesystem_cd,
  valuetype_cd, m_exclusion_cd, c_path, c_symbol)
select 9 as c_hlevel,
       '\i2b2\acs\2013\20135a\zipcode\' + category + '\Percentage\70-79.99\' as c_fullname,
	   name as c_name,
	   'N' as c_synonym_cd,
	   'FA' as c_visualattributes,
	   null as c_totalnum,
	   dataset_code + '_'+ table_source_code + '_' + variable_code + '_lvl9_pct_70_79' as c_basecode,
	   null as c_metadataxml,
	   'patient_num' as c_facttablecolumn,
	    case when table_location = 1 then 'acs_zcta5_patient_zip_percent_dimension_1'
		when table_location = 2 then 'vw_acs_zcta5_patient_zip_percent_dimension_2'
		when table_location = 3 then 'vw_acs_zcta5_patient_zip_percent_dimension_3'
		when table_location = 4 then 'vw_acs_zcta5_patient_zip_percent_dimension_4'
		when table_location = 5 then 'vw_acs_zcta5_patient_zip_percent_dimension_5'
		when table_location = 6 then 'vw_acs_zcta5_patient_zip_percent_dimension_6'
		else 'x' end as c_tablename,
	   variable_code as c_columnname,
	   'N' as c_columndatatype,
	   'BETWEEN' as c_operator,
       '70 AND 79.99' as c_dimcode,
	   null as c_comment,
	   name as c_tooltip,
	   '@' as m_applied_path,
	   GetDate() as update_date,
	   GetDate() as download_date,
	   GetDate() as import_date,
	   'ACS' as sourcesystem_cd,
	   null as valuetype_cd,
	   null as m_exclusion_cd,
	   '\i2b2\acs\2013\20135a\zipcode\' + category + '\Percentage\70-79.99\' as c_path,
	   null as c_symbol
  from (select distinct (rtrim(ltrim(table_universe)) + '\' + rtrim(ltrim(table_label)) + '\' + rtrim(ltrim(variable_label))) as category,
		'70-79.99' as name, dataset_code, table_source_code, variable_code, table_location
          from i2b2Census.i2b2Census.acs_20135a_definition m
		  where table_universe is not null
		  and table_label in (select table_label from i2b2Census.i2b2Census.acs_20135a_definition
								where variable_label = 'Total')
		  and variable_label != 'Total'
		  ) m

--80-89
insert into i2b2metadata.i2b2metadata.i2b2_acs(c_hlevel, c_fullname, c_name, c_synonym_cd, c_visualattributes, c_totalnum, c_basecode, c_metadataxml, 
  c_facttablecolumn, c_tablename, c_columnname,
  c_columndatatype, c_operator, c_dimcode, c_comment, c_tooltip, m_applied_path, update_date, download_date, import_date, sourcesystem_cd,
  valuetype_cd, m_exclusion_cd, c_path, c_symbol)
select 9 as c_hlevel,
       '\i2b2\acs\2013\20135a\zipcode\' + category + '\Percentage\80-89.99\' as c_fullname,
	   name as c_name,
	   'N' as c_synonym_cd,
	   'FA' as c_visualattributes,
	   null as c_totalnum,
	   dataset_code + '_'+ table_source_code + '_' + variable_code + '_lvl9_pct_80_89' as c_basecode,
	   null as c_metadataxml,
	   'patient_num' as c_facttablecolumn,
	    case when table_location = 1 then 'acs_zcta5_patient_zip_percent_dimension_1'
		when table_location = 2 then 'vw_acs_zcta5_patient_zip_percent_dimension_2'
		when table_location = 3 then 'vw_acs_zcta5_patient_zip_percent_dimension_3'
		when table_location = 4 then 'vw_acs_zcta5_patient_zip_percent_dimension_4'
		when table_location = 5 then 'vw_acs_zcta5_patient_zip_percent_dimension_5'
		when table_location = 6 then 'vw_acs_zcta5_patient_zip_percent_dimension_6'
		else 'x' end as c_tablename,
	   variable_code as c_columnname,
	   'N' as c_columndatatype,
	   'BETWEEN' as c_operator,
       '80 AND 89.99' as c_dimcode,
	   null as c_comment,
	   name as c_tooltip,
	   '@' as m_applied_path,
	   GetDate() as update_date,
	   GetDate() as download_date,
	   GetDate() as import_date,
	   'ACS' as sourcesystem_cd,
	   null as valuetype_cd,
	   null as m_exclusion_cd,
	   '\i2b2\acs\2013\20135a\zipcode\' + category + '\Percentage\80-89.99\' as c_path,
	   null as c_symbol
  from (select distinct (rtrim(ltrim(table_universe)) + '\' + rtrim(ltrim(table_label)) + '\' + rtrim(ltrim(variable_label))) as category,
		'80-89.99' as name, dataset_code, table_source_code, variable_code, table_location
          from i2b2Census.i2b2Census.acs_20135a_definition m
		  where table_universe is not null
		  and table_label in (select table_label from i2b2Census.i2b2Census.acs_20135a_definition
								where variable_label = 'Total')
		  and variable_label != 'Total'
		  ) m

--90-100
insert into i2b2metadata.i2b2metadata.i2b2_acs(c_hlevel, c_fullname, c_name, c_synonym_cd, c_visualattributes, c_totalnum, c_basecode, c_metadataxml, 
  c_facttablecolumn, c_tablename, c_columnname,
  c_columndatatype, c_operator, c_dimcode, c_comment, c_tooltip, m_applied_path, update_date, download_date, import_date, sourcesystem_cd,
  valuetype_cd, m_exclusion_cd, c_path, c_symbol)
select 9 as c_hlevel,
       '\i2b2\acs\2013\20135a\zipcode\' + category + '\Percentage\90-100\' as c_fullname,
	   name as c_name,
	   'N' as c_synonym_cd,
	   'FA' as c_visualattributes,
	   null as c_totalnum,
	   dataset_code + '_'+ table_source_code + '_' + variable_code + '_lvl9_pct_90_100' as c_basecode,
	   null as c_metadataxml,
	   'patient_num' as c_facttablecolumn,
	    case when table_location = 1 then 'acs_zcta5_patient_zip_percent_dimension_1'
		when table_location = 2 then 'vw_acs_zcta5_patient_zip_percent_dimension_2'
		when table_location = 3 then 'vw_acs_zcta5_patient_zip_percent_dimension_3'
		when table_location = 4 then 'vw_acs_zcta5_patient_zip_percent_dimension_4'
		when table_location = 5 then 'vw_acs_zcta5_patient_zip_percent_dimension_5'
		when table_location = 6 then 'vw_acs_zcta5_patient_zip_percent_dimension_6'
		else 'x' end as c_tablename,
	   variable_code as c_columnname,
	   'N' as c_columndatatype,
	   'BETWEEN' as c_operator,
       '90 AND 100' as c_dimcode,
	   null as c_comment,
	   name as c_tooltip,
	   '@' as m_applied_path,
	   GetDate() as update_date,
	   GetDate() as download_date,
	   GetDate() as import_date,
	   'ACS' as sourcesystem_cd,
	   null as valuetype_cd,
	   null as m_exclusion_cd,
	   '\i2b2\acs\2013\20135a\zipcode\' + category + '\Percentage\90-100\' as c_path,
	   null as c_symbol
  from (select distinct (rtrim(ltrim(table_universe)) + '\' + rtrim(ltrim(table_label)) + '\' + rtrim(ltrim(variable_label))) as category,
		'90-100' as name, dataset_code, table_source_code, variable_code, table_location
          from i2b2Census.i2b2Census.acs_20135a_definition m
		  where table_universe is not null
		  and table_label in (select table_label from i2b2Census.i2b2Census.acs_20135a_definition
								where variable_label = 'Total')
		  and variable_label != 'Total'
		  ) m
