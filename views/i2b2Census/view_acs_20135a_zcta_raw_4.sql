--this view will create the percentage portions for acs data.
create view i2b2data.vw_acs_zcta5_patient_zip_raw_dimension_4 as
select pd.*,
UJZ001,
UJ0001,
UJ1001,
UJ2001,
UJ3001,
UJ4001,
UKA001,
UKB001,
UKC001,
UKD001,
UKE001,
UKF001,
UKG001,
UKH001,
UKI001,
UKJ001,
UJV001,
UJV002,
UJV003,
UJW001,
UJW002,
UJW003,
UJW004,
UJW005,
UJW006,
UJW007,
UJX001,
UJY001,
UJ5001,
UJ7001,
UJ8001,
UJ6001,
UJ9001
  from i2b2data.i2b2data.patient_dimension pd, i2b2Census.i2b2Census.acs_20135a_zcta_id acs, 
  i2b2Census.i2b2Census.acs_20135a_zcta_860_ge_00_4 zcta4
  where substring(pd.zip_cd, 1, 5) = acs.zcta5
  and acs.id = zcta4.id4





--populate the column selects for raw
--select variable_code + ','
--  from i2b2Census.i2b2Census.acs_20135a_definition
--	where total_column_name is null
--	and table_universe is not null
--	and table_location = 4