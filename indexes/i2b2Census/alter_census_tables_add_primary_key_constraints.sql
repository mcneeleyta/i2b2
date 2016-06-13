ALTER TABLE [I2B2Census].[acs_20135a_zcta_860_ge_00_1]
   alter column id int not null

ALTER TABLE [I2B2Census].[acs_20135a_zcta_860_ge_00_1]
   ADD CONSTRAINT PK_ID
   PRIMARY KEY(ID)

ALTER TABLE [I2B2Census].[acs_20135a_zcta_860_ge_00_2]
   alter column id2 int not null

ALTER TABLE [I2B2Census].[acs_20135a_zcta_860_ge_00_2]
   ADD CONSTRAINT PK_ID2
   PRIMARY KEY(ID2)

ALTER TABLE [I2B2Census].[acs_20135a_zcta_860_ge_00_3]
   alter column id3 int not null

ALTER TABLE [I2B2Census].[acs_20135a_zcta_860_ge_00_3]
   ADD CONSTRAINT PK_ID3
   PRIMARY KEY(ID3)

ALTER TABLE [I2B2Census].[acs_20135a_zcta_860_ge_00_4]
   alter column id4 int not null

ALTER TABLE [I2B2Census].[acs_20135a_zcta_860_ge_00_4]
   ADD CONSTRAINT PK_ID4
   PRIMARY KEY(ID4)

ALTER TABLE [I2B2Census].[acs_20135a_zcta_860_ge_00_5]
   alter column id5 int not null

ALTER TABLE [I2B2Census].[acs_20135a_zcta_860_ge_00_5]
   ADD CONSTRAINT PK_ID5
   PRIMARY KEY(ID5)

ALTER TABLE [I2B2Census].[acs_20135a_zcta_860_ge_00_6]
   alter column id6 int not null

ALTER TABLE [I2B2Census].[acs_20135a_zcta_860_ge_00_6]
   ADD CONSTRAINT PK_ID6
   PRIMARY KEY(ID6)

ALTER TABLE [I2B2Census].[acs_20135a_zcta_id]
   alter column id int not null

ALTER TABLE [I2B2Census].[acs_20135a_zcta_id]
   alter column zcta5 varchar(5) not null

ALTER TABLE [I2B2Census].[acs_20135a_zcta_id]
   ADD CONSTRAINT PK_ID_ZIP
   PRIMARY KEY(ID, ZCTA5)
