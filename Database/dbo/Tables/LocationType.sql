create table dbo.LocationType (
  LocationTypeCode char(1) not null,
  LocationTypeName nvarchar(50) not null,

  constraint UC_LocationType_PK primary key clustered (LocationTypeCode),
  constraint U__LocationType_LocationTypeName_AK1 unique (LocationTypeName)
);
go
