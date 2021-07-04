create table dbo.Visit (
  OrganisationId int not null,
  PersonId int not null,
  VisitDate date not null,
  RowVersionStamp rowversion not null,

  constraint UC_Visit_PK
  primary key clustered (OrganisationId, PersonId, VisitDate),

  constraint Person_Indicates_Visit_FK
  foreign key (OrganisationId, PersonId)
  references dbo.Person (OrganisationId, PersonId)
);
