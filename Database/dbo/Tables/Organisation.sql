create table dbo.Organisation (
  OrganisationId int not null,
  OrganisationName nvarchar(100) not null,
  RowVersionStamp rowversion not null,
  CreatedDtm datetimeoffset (0) not null,
  UpdatedDtm datetimeoffset (0) not null,
  
  constraint UC_Organisation_PK primary key clustered (OrganisationId)
);
