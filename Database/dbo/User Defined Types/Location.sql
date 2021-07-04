create type dbo.Location as table (
  CountryCode char(2) not null,
  SubdivisionCode char(3) not null,
  LocationType char(1) not null,
  ShortName nvarchar(100) not null,

  primary key clustered (CountryCode, SubdivisionCode)
);
