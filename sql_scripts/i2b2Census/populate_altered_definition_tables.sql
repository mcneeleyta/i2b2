select * from [I2B2Census].[acs_20135a_definition]

update [I2B2Census].[acs_20135a_definition]
set table_location = '1'
where variable_code in(SELECT column_name
						FROM i2b2Census.INFORMATION_SCHEMA.COLUMNS
						WHERE TABLE_NAME = N'acs_20135a_blck_grp_150_ge_00_1')

update [I2B2Census].[acs_20135a_definition]
set table_location = '2'
where variable_code in(SELECT column_name
						FROM i2b2Census.INFORMATION_SCHEMA.COLUMNS
						WHERE TABLE_NAME = N'acs_20135a_blck_grp_150_ge_00_2')

update [I2B2Census].[acs_20135a_definition]
set table_location = '3'
where variable_code in(SELECT column_name
						FROM i2b2Census.INFORMATION_SCHEMA.COLUMNS
						WHERE TABLE_NAME = N'acs_20135a_blck_grp_150_ge_00_3')

update [I2B2Census].[acs_20135a_definition]
set table_location = '4'
where variable_code in(SELECT column_name
						FROM i2b2Census.INFORMATION_SCHEMA.COLUMNS
						WHERE TABLE_NAME = N'acs_20135a_blck_grp_150_ge_00_4')

update [I2B2Census].[acs_20135a_definition]
set table_location = '5'
where variable_code in(SELECT column_name
						FROM i2b2Census.INFORMATION_SCHEMA.COLUMNS
						WHERE TABLE_NAME = N'acs_20135a_blck_grp_150_ge_00_5')

update [I2B2Census].[acs_20135a_definition]
set table_location = '6'
where variable_code in(SELECT column_name
						FROM i2b2Census.INFORMATION_SCHEMA.COLUMNS
						WHERE TABLE_NAME = N'acs_20135a_blck_grp_150_ge_00_6')


-----------------------------------------------------------------------------------------
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
create table #ont_temp (ID int identity(1,1) , column_name varchar(100), total_name varchar(100))
declare @var_code_column_1 varchar(max)
declare @var_code_total_2 varchar(max)
declare @id int

insert into #ont_temp (column_name, total_name)
select m.variable_code, x.variable_code
from i2b2Census.i2b2Census.acs_20135a_definition m, i2b2Census.i2b2Census.acs_20135a_definition x 
where x.variable_label = 'Total'
and m.variable_label != 'Total'
and m.table_source_code = x.table_source_code
and m.table_universe = x.table_universe
and m.variable_code != x.variable_code

  while ((select count(*) from #ont_temp) > 0 )
	  begin
		
		select top 1 
		@id = id,
		 @var_code_column_1 = column_name,
		 @var_code_total_2 = total_name
		 from #ont_temp

		update i2b2Census.i2b2Census.acs_20135a_definition
		  set total_column_name = @var_code_total_2
		  where variable_code = @var_code_column_1

		delete from #ont_temp where ID = @id

	  end

  drop table #ont_temp

--select * from #ont_temp

END

GO
