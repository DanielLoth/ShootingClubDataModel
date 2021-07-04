create table dbo.Country (
  CountryCode char(2) not null,
  SubdivisionCode char(3) not null,
  RowVersionStamp rowversion not null,

  constraint UC_Country_PK
  primary key clustered (CountryCode),

  constraint Location_IsA_Country_FK
  foreign key (CountryCode, SubdivisionCode)
  references dbo.Location (CountryCode, SubdivisionCode),

  constraint Country_HasIsoAlpha2Code_ck
  check (CountryCode like '[a-z][a-z]'),

  constraint Country_HasEmpty_SubdivisionCode_ck
  check (SubdivisionCode = ''),

  constraint Country_HasCorrectLocationType_ck
  check (dbo.ValidateLocationType_fn(CountryCode, '', 'C') = 1)
);
