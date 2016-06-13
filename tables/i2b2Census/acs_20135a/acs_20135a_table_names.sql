--the idea here is to have a list of the A tables and append the number for column to the end to get full table name. 
SELECT distinct TABLE_SCHEMA, table_name, SUBSTRING(table_name, len(table_name), 1) as table_location
into  i2b2Census.acs_20135a_table_names
FROM i2b2Census.INFORMATION_SCHEMA.TABLES
where table_name like 'acs_20135a%ge%'