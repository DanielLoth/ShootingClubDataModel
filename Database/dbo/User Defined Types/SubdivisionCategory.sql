create type dbo.SubdivisionCategory as table (
  CountryCode char(2) not null,
  SubdivisionCategoryCode char(3) not null,
  SubdivisionCategoryName nvarchar(50) not null,

  primary key clustered (CountryCode, SubdivisionCategoryCode)
);
