create type dbo.Country as table (
  CountryCode char(2) not null,
  ShortName nvarchar(100) not null,

  primary key clustered (CountryCode),
  unique (ShortName)
);

go
