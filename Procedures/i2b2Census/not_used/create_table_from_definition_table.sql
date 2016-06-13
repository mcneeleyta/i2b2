-- =============================================
-- Author:Todd McNeeley
-- Create date: 03/21/2016
-- Description:	create a table from a definition table for a fixed length file provided.
-- =============================================
CREATE PROCEDURE i2b2Census.create_table_from_definition_table
-- Add the parameters for the stored procedure here

@p_output_table_fully_qualified varchar(max)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

--set and declare your static parameters here
create table #acs_temp (ID int identity(1,1) , variable_code varchar(max), data_type varchar(1), width int)
declare @id int
declare @comma varchar(1) = ','
declare @create_column varchar(max) 
declare @create_table_statement_1 varchar(max) = 'create table ' + @p_output_table_fully_qualified + '_1' + char(10) + '(' + char(10) + 'ID int identity(1,1),' + char(10)
declare @create_table_statement_2 varchar(max) = 'create table ' + @p_output_table_fully_qualified + '_2' + char(10) + '(' + char(10) + 'ID int identity(1,1),' + char(10)
declare @create_table_statement_3 varchar(max) = 'create table ' + @p_output_table_fully_qualified + '_3' + char(10) + '(' + char(10) + 'ID int identity(1,1),' + char(10)
declare @create_table_statement_4 varchar(max) = 'create table ' + @p_output_table_fully_qualified + '_4' + char(10) + '(' + char(10) + 'ID int identity(1,1),' + char(10)
declare @designate_column_data_type varchar(max)
declare @designate_column_width varchar(max)
declare @designate_variable_code varchar(max)


insert into #acs_temp (variable_code, data_type, width)
  select variable_code, data_type, width FROM I2B2Census.I2B2Census.acs_definition order by start_column


--create while loop to set the columns. 
--have to change table manually couldn't find a way to use table variable with this yet. 
  while ((select count(*) from #acs_temp) > 3000 )
	  begin

		select top 1 
		 @id = id,
		 @designate_variable_code = variable_code,
		 @designate_column_data_type = data_type,
		 @designate_column_width = width  
		 from #acs_temp

     --create your columns here
     --have to change table manually couldn't find a way to use table variable with this yet. 
    set @create_column = '[' + @designate_variable_code + '] ' + case when lower(@designate_column_data_type) = 'n' then 'numeric' else 'varchar' end + '(' + @designate_column_width + ')' + @comma

	--update your table creation statement
	set @create_table_statement_1 = @create_table_statement_1 + @create_column + char(10)

	delete from #acs_temp where ID = @id

  end

  --have to change table manually couldn't find a way to use table variable with this yet. 
  while ((select count(*) from #acs_temp) > 2000 )
	  begin

		select top 1 
		 @id = id,
		 @designate_variable_code = variable_code,
		 @designate_column_data_type = data_type,
		 @designate_column_width = width  
		 from #acs_temp

     --create your columns 
     --have to change table manually couldn't find a way to use table variable with this yet. 
    set @create_column = '[' + @designate_variable_code + '] ' + case when lower(@designate_column_data_type) = 'n' then 'numeric' else 'varchar' end + '(' + @designate_column_width + ')' + @comma

	--update your table creation statement
	set @create_table_statement_2 = @create_table_statement_2 + @create_column + char(10)

	delete from #acs_temp where ID = @id

  end

  --have to change table manually couldn't find a way to use table variable with this yet. 
  while ((select count(*) from #acs_temp) > 1000 )
	  begin

		select top 1 
		 @id = id,
		 @designate_variable_code = variable_code,
		 @designate_column_data_type = data_type,
		 @designate_column_width = width  
		 from #acs_temp

     --create your columns here
     --have to change table manually couldn't find a way to use table variable with this yet. 
    set @create_column = '[' + @designate_variable_code + '] ' + case when lower(@designate_column_data_type) = 'n' then 'numeric' else 'varchar' end + '(' + @designate_column_width + ')' + @comma

	--update your table creation statement
	set @create_table_statement_3 = @create_table_statement_3 + @create_column + char(10)

	delete from #acs_temp where ID = @id

  end

  --have to change table manually couldn't find a way to use table variable with this yet. 
  while ((select count(*) from #acs_temp) > 0 )
	  begin

		select top 1 
		 @id = id,
		 @designate_variable_code = variable_code,
		 @designate_column_data_type = data_type,
		 @designate_column_width = width  
		 from #acs_temp

     --create your columns here
     --have to change table manually couldn't find a way to use table variable with this yet. 
    set @create_column = '[' + @designate_variable_code + '] ' + case when lower(@designate_column_data_type) = 'n' then 'numeric' else 'varchar' end + '(' + @designate_column_width + ')' + @comma

	--update your table creation statement
	set @create_table_statement_4 = @create_table_statement_4 + @create_column + char(10)

	delete from #acs_temp where ID = @id

  end

set @create_table_statement_1 = substring(@create_table_statement_1, 1, len(@create_table_statement_1) -2) + char(10) + ')'
set @create_table_statement_2 = substring(@create_table_statement_2, 1, len(@create_table_statement_2) -2) + char(10) + ')'
set @create_table_statement_3 = substring(@create_table_statement_3, 1, len(@create_table_statement_3) -2) + char(10) + ')'
set @create_table_statement_4 = substring(@create_table_statement_4, 1, len(@create_table_statement_4) -2) + char(10) + ')'

--print @create_table_statement

select @create_table_statement_1 
select @create_table_statement_2
select @create_table_statement_3
select @create_table_statement_4

 drop table #acs_temp

END

GO