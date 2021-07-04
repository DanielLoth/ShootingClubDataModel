create table dbo.PersonSchedule (
  OrganisationId int not null,
  PersonId int not null,
  UpdatedDtm datetimeoffset(0) not null,
  RowVersionStamp rowversion not null,

  constraint UC_PersonSchedule_PK
  primary key clustered (OrganisationId, PersonId),

  constraint Person_Has_PersonSchedule_FK
  foreign key (OrganisationId, PersonId)
  references dbo.Person (OrganisationId, PersonId)
);
