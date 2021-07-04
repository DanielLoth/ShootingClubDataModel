create table dbo.DisciplineRegistration (
  OrganisationId int not null,
  CompetitionId int not null,
  PersonId int not null,
  GoverningBodyCode char(4) not null,
  DisciplineCode char(4) not null,
  ShooterCohortCode char(1) not null,
  RowVersionStamp rowversion not null,
  CreatedDtm datetimeoffset (0) not null,
  UpdatedDtm datetimeoffset (0) not null,

  constraint UC_DisciplineRegistrant_PK
  primary key clustered (OrganisationId, CompetitionId, PersonId, GoverningBodyCode, DisciplineCode, ShooterCohortCode),

  constraint Person_IsOffered_DisciplineRegistration_FK
  foreign key (OrganisationId, PersonId)
  references dbo.Person (OrganisationId, PersonId),

  constraint DisciplineOffering_IsOfferedIn_DisciplineRegistration_FK
  foreign key (GoverningBodyCode, DisciplineCode, ShooterCohortCode)
  references dbo.DisciplineOffering (GoverningBodyCode, DisciplineCode, ShooterCohortCode)
);
