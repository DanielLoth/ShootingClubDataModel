create table dbo.GoverningBody (
  GoverningBodyCode char(4) not null,
  OrganisationName nvarchar(100) not null,
  RowVersionStamp rowversion not null,
  CreatedDtm datetimeoffset (0) not null,
  UpdatedDtm datetimeoffset (0) not null,

  constraint UC_GoverningBody_GoverningBody_PK
  primary key clustered (GoverningBodyCode)
);
