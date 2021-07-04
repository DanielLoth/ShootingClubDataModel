create table dbo.Score (
  OrganisationId int not null,
  PersonId int not null,
  GoverningBodyCode char(4) not null,
  DisciplineCode char(4) not null,
  ShooterCohortCode char(1) not null,
  ScoreDifferentiator int identity(1,1) not null,
  ScoreDate date not null,
  Score int not null,
  IsCompetitionScore bit not null,
  RowVersionStamp rowversion not null,

  constraint UC_Score_PK
  primary key clustered (OrganisationId, PersonId, GoverningBodyCode, DisciplineCode, ShooterCohortCode, ScoreDifferentiator),

  constraint Person_Records_Score_FK
  foreign key (OrganisationId, PersonId)
  references dbo.Person (OrganisationId, PersonId),

  constraint DisciplineOffering_IsScoredAs_Score_FK
  foreign key (GoverningBodyCode, DisciplineCode, ShooterCohortCode)
  references dbo.DisciplineOffering (GoverningBodyCode, DisciplineCode, ShooterCohortCode)
);
