create table dbo.Person (
  OrganisationId  int not null,
  PersonId int not null,
  RowVersionStamp rowversion not null,
  GivenNames nvarchar(50) not null,
  FamilyName nvarchar(50) not null,
  CreatedDtm datetimeoffset(0) not null,
  UpdatedDtm datetimeoffset(0) not null,
  
  constraint UC_Person_PK
  primary key clustered (OrganisationId, PersonId),

  constraint Organisation_Hosts_Person_FK
  foreign key (OrganisationId)
  references dbo.Organisation (OrganisationId)
);
go

exec sp_addmessage @msgnum = 100000, @severity = 16, @msgtext = N'%s test', @lang = 'us_english';
go
