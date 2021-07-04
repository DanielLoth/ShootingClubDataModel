create table dbo.CompetitionEndorsed (
  OrganisationId int not null,
  CompetitionId int not null,
  RowVersionStamp rowversion not null,
  CreatedDtm datetimeoffset(0) not null,
  UpdatedDtm datetimeoffset(0) not null,
  CompetitionName nvarchar(100) not null,

  constraint UC_CompetitionEndorsed_PK
  primary key clustered (OrganisationId, CompetitionId),

  constraint Organisation_Endorses_CompetitionEndorsed_FK
  foreign key (OrganisationId)
  references dbo.Organisation (OrganisationId),

  constraint CompetitionEndorsed_HasCorrectCompetitionType_ck
  check (dbo.ValidateCompetitionType_fn(OrganisationId, CompetitionId, 0) = 1)
);

go
