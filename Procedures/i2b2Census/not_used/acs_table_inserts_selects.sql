exec [I2B2Census].[acs_table_inserts]
@p_output_table_fully_qualified = '[I2B2Census].[acs_20135a_blk_grp_150_1]'

drop procedure [I2B2Census].[acs_table_inserts]


select name, [UEC001],ac.variable_label, [UGA001], ab.variable_label,[UF8019], aa.variable_label from [I2B2Census].[acs_20135a_blk_grp_150_1]
join  [I2B2Census].[acs_definition] ac
on ac.variable_code = 'UEC001' 
join  [I2B2Census].[acs_definition] ab
on ab.variable_code = 'UGA001'
join  [I2B2Census].[acs_definition] aa
on aa.variable_code = 'UF8019'
order by id asc

select name, ac.variable_label, UFM002 from [I2B2Census].[acs_20135a_blk_grp_150_1], [I2B2Census].[acs_definition] ac
where ac.variable_code = 'UFM002'


select * from [I2B2Census].[acs_definition]
where lower(variable_label) like '%transport%'



SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
join  [I2B2Census].[acs_definition] ac
on ac.variable_code = COLUMN_NAME
WHERE TABLE_NAME = 'acs_20135a_blk_grp_150_1' AND TABLE_SCHEMA='I2B2Census'
