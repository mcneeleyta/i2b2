-- =============================================
-- Author:Todd McNeeley
-- Create date: 03/21/2016
-- Description:	create a table from a definition table for a fixed length file provided.
-- =============================================
CREATE PROCEDURE i2b2Census.acs_table_inserts
-- Add the parameters for the stored procedure here

@p_output_table_fully_qualified varchar(max)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

--set and declare your static parameters here
--create table #acs_temp (ID int identity(1,1) , variable_code varchar(max), data_type varchar(1), width int, start_column int)
declare @id int
declare @comma varchar(1) = ','
declare @create_column varchar(max) 
declare @create_insert_statement_1 varchar(max)
declare @create_insert_statement_final varchar(max)
declare @designate_column_data_type varchar(max)
declare @designate_column_start int
declare @designate_column_width int
declare @designate_variable_code varchar(max)

--used for values portion
create table #acs_file_temp (ID int, file_string varchar(max))
declare @file_string varchar(max)
declare @id2 int
declare @create_values varchar(max) 
declare @create_values_statement_1 varchar(max)


insert into #acs_file_temp (ID, file_string)
  select id, replace(file_string, '''', '') as file_string FROM [I2B2Census].[I2B2Census].[acs_20135a_temp] order by id

--outer while loop to go through each row in the file stored in a table temporarily.  
  while ((select count(*) from #acs_file_temp) >= 1)
    begin

--we have to create this table for each loop through.
create table #acs_temp (ID int identity(1,1) , variable_code varchar(max), data_type varchar(1), width int, start_column int)

insert into #acs_temp (variable_code, data_type, width, start_column)
  select variable_code, data_type, width, start_column FROM I2B2Census.I2B2Census.acs_definition order by start_column

	set @create_insert_statement_1 = 'insert into ' + @p_output_table_fully_qualified + ' ('
	set @create_values_statement_1 = 'values' + ' ('

		 select top 1 
		 @id2 = id,
		 @file_string = file_string
		 from #acs_file_temp
		 order by id asc

--need to figure out loop issue
--print 'file_string:' + cast(@id2 as varchar(5))

--create while loop to set the columns. 
--have to change table manually couldn't find a way to use table variable with this yet. 
  while ((select count(*) from #acs_temp) > 3000 )
	  begin

		select top 1 
		 @id = id,
		 @designate_variable_code = variable_code,
		 @designate_column_data_type = data_type,
		 @designate_column_width = width,
		 @designate_column_start = start_column
		 from #acs_temp
		 order by id asc



     --create your columns here no comma's yet
     --have to change table manually couldn't find a way to use table variable with this yet. 
    set @create_column = '[' + @designate_variable_code + ']' + @comma
	set @create_values = 
	case when @designate_column_data_type = 'n' 
	then 
		case when len(ltrim(rtrim(SUBSTRING(@file_string, @designate_column_start, @designate_column_width)))) = 0
			 then 'null' + @comma
			 when ltrim(rtrim(SUBSTRING(@file_string, @designate_column_start, @designate_column_width))) = '.'
			 then 'null' + @comma
			 else ltrim(rtrim(SUBSTRING(@file_string, @designate_column_start, @designate_column_width))) + @comma
			 end
	else char(39) + ltrim(rtrim(SUBSTRING(@file_string, @designate_column_start, @designate_column_width))) + char(39) + @comma
	end

	--update your table creation statement
	set @create_insert_statement_1 = @create_insert_statement_1 + @create_column
	set @create_values_statement_1 = @create_values_statement_1 + @create_values



	--need to figure out loop issue
--	print 'column:' + cast(@id as varchar(5))


	delete from #acs_temp where ID = @id

  end

--we have to drop the table and recreate for each loop through or won't work for 2 on. 
 drop table #acs_temp

	set @create_insert_statement_1 = substring(@create_insert_statement_1, 1, len(@create_insert_statement_1) -1) + ')' + char(13)
	set @create_values_statement_1 = substring(@create_values_statement_1, 1, len(@create_values_statement_1) -1) + ')' + char(13)

	--create the full insert_statement
	set @create_insert_statement_final = @create_insert_statement_1 + @create_values_statement_1

	delete from #acs_file_temp where ID = @id2

	--select @create_insert_statement_final

	exec (@create_insert_statement_final)

  end 

	drop table #acs_file_temp

END

GO