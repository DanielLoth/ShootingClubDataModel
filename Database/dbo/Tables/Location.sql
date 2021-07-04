create table dbo.Location (
  CountryCode char(2) not null,
  SubdivisionCode char(3) not null,
  LocationType char(1) not null,
  ShortName nvarchar(100) not null,

  constraint UC_Location_PK
  primary key clustered (CountryCode, SubdivisionCode),

  constraint U__Location_ShortName_AK1
  unique (CountryCode, ShortName),

  constraint LocationType_discriminates_Location_FK
  foreign key (LocationType) references dbo.LocationType (LocationTypeCode)
);

go
