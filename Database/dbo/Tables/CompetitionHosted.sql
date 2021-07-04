create table dbo.CompetitionHosted (
  OrganisationId int not null,
  CompetitionId int not null,
  RowVersionStamp rowversion not null,
  CreatedDtm datetimeoffset(0) not null,
  UpdatedDtm datetimeoffset(0) not null,
  CompetitionName nvarchar(100) not null,

  constraint UC_CompetitionHosted_PK
  primary key clustered (OrganisationId, CompetitionId),

  constraint Organisation_Hosts_CompetitionHosted_FK
  foreign key (OrganisationId)
  references dbo.Organisation (OrganisationId),

  constraint CompetitionHosted_HasCorrectCompetitionType_ck
  check (dbo.ValidateCompetitionType_fn(OrganisationId, CompetitionId, 1) = 1) -- Two-part (schema.func) name required here.
);

go
