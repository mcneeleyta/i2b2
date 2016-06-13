USE [I2B2Census]
GO

/****** Object:  StoredProcedure [I2B2Census].[update_column_cume_dist_merge]    Script Date: 5/19/2016 3:24:22 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:Todd McNeeley
-- Create date: 05/16/2016
-- Description:	update table with the cume_dist function results for a column. 
-- =============================================
CREATE PROCEDURE [I2B2Census].[update_column_cume_dist_merge]
-- Add the parameters for the stored procedure here
@p_output_column varchar(max),
@p_table_num int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

declare @sql varchar(max) 

set @sql = 'merge i2b2Census.i2b2Census.acs_20135a_zcta_860_ge_00_'+@p_table_num+'_cume_dist as T 
                        using
                        (
                        select id, cume_dist () over (order by ' +@p_output_column+ ' )*100 as cume_dist_res FROM i2b2Census.i2b2Census.acs_20135a_zcta_860_ge_00_'+@p_table_num+
							' where ' +@p_output_column+ ' is not null
                        ) as S
                        on 
                        S.id = T.id
                        
                        when matched then 
						update
                           set T.'+@p_output_column+ ' = S.cume_dist_res

                                                  
                        when not matched then 
                        
                        insert (id, ' +@p_output_column+ ')
                        values (S.id, S.cume_dist_res);'

--print @sql

exec(@sql)


END

GO


