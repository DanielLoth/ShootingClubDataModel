create table dbo.SubdivisionCategory (
  CountryCode char(2) not null,
  SubdivisionCategoryCode char(3) not null,
  SubdivisionCategoryName nvarchar(50) not null,

  constraint UC_SubdivisionCategory_PK
  primary key clustered (CountryCode, SubdivisionCategoryCode),

  -- This unique constraint ensures that a subdivision category name (e.g.: 'state' or 'territory')
  -- is not used more than once in the context of a given country.
  constraint U__SubdivisionCategory_Country_SubdivisionCategoryName_AK1
  unique (CountryCode, SubdivisionCategoryName),

  constraint Country_Recognises_SubdivisionCategory_FK
  foreign key (CountryCode)
  references dbo.Country (CountryCode)
);
go
