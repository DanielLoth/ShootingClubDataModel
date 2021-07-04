create type dbo.Subdivision as table (
  CountryCode char(2) not null,
  SubdivisionCode char(3) not null,
  SubdivisionCategoryCode char(3) not null,
  ShortName nvarchar(100) not null,

  primary key clustered (CountryCode, SubdivisionCode)
);
