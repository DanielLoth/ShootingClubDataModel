create type dbo.LocationType as table (
  LocationTypeCode char(1),
  LocationTypeName nvarchar(50) not null,

  primary key clustered (LocationTypeCode),
  unique (LocationTypeName)
);
