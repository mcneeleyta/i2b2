--this view will create the percentage portions for acs data.
create view i2b2data.vw_acs_zcta5_patient_zip_raw_dimension_2 as
select pd.*,
UFV001,
UFW001,
UFX001,
UFY001,
UFZ001,
UF0001,
UF1001,
UF2001,
UF3001,
UF4001,
UF5001,
UF6001,
UF7001,
UF8001,
UF9001,
UGA001,
UGM001,
UGN001,
UGO001,
UGP001,
UGQ001,
UGR001,
UFM001,
UFN001,
UFO001,
UFP001,
UFQ001,
UFR001,
UFS001,
UFT001,
UFU001,
UGB001,
UGC001,
UGD001,
UGE001,
UGF001,
UGG001,
UGH001,
UGI001,
UGJ001,
UGK001,
UGL001
  from i2b2data.i2b2data.patient_dimension pd, i2b2Census.i2b2Census.acs_20135a_zcta_id acs, 
  i2b2Census.i2b2Census.acs_20135a_zcta_860_ge_00_2 zcta2
  where substring(pd.zip_cd, 1, 5) = acs.zcta5
  and acs.id = zcta2.id2





--populate the column selects for raw
--select variable_code + ','
--  from i2b2Census.i2b2Census.acs_20135a_definition
--	where total_column_name is null
--	and table_universe is not null
--	and table_location = 2