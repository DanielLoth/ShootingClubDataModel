create table dbo.Subdivision (
  CountryCode char(2) not null,
  SubdivisionCode char(3) not null,
  SubdivisionCategoryCode char(3) not null,
  RowVersionStamp rowversion not null,

  constraint UC_Subdivision_PK
  primary key clustered (CountryCode, SubdivisionCode),

  constraint Location_IsA_Subdivision_FK
  foreign key (CountryCode, SubdivisionCode)
  references dbo.Location (CountryCode, SubdivisionCode),

  constraint SubdivisionCategory_classifies_Subdivision_FK
  foreign key (CountryCode, SubdivisionCategoryCode)
  references dbo.SubdivisionCategory (CountryCode, SubdivisionCategoryCode),

  constraint Subdivision_HasIsoAlpha2SubdivisionCode_ck
  check (
    (len(trim(SubdivisionCode)) = 3 and SubdivisionCode like '[a-z0-9][a-z0-9][a-z0-9]') -- In support of codes such as: AU-NSW, AU-ACT
    or (len(trim(SubdivisionCode)) = 2 and SubdivisionCode like '[a-z0-9][a-z0-9]') -- In support of codes such as: MY-14, JP-13
  ),

  constraint Subdivision_HasCorrectLocationType_ck
  check (dbo.ValidateLocationType_fn(CountryCode, SubdivisionCode, 'S') = 1),

  constraint Subdivision_IsCycleFree_ck
  check (dbo.ValidateCycleFreeRecursion_Subdivision_fn() = 1)
);
go
