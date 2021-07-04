create table dbo.ScoreCompetition (
  OrganisationId int not null,
  PersonId int not null,
  GoverningBodyCode char(4) not null,
  DisciplineCode char(4) not null,
  ShooterCohortCode char(1) not null,
  ScoreDifferentiator int not null,
  CompetitionId int not null,
  RowVersionStamp rowversion not null,

  constraint UC_ScoreCompetition_PK
  primary key clustered (OrganisationId, PersonId, GoverningBodyCode, DisciplineCode, ShooterCohortCode, ScoreDifferentiator, CompetitionId),

  constraint Score_IsA_ScoreCompetition_FK
  foreign key (OrganisationId, PersonId, GoverningBodyCode, DisciplineCode, ShooterCohortCode, ScoreDifferentiator)
  references dbo.Score (OrganisationId, PersonId, GoverningBodyCode, DisciplineCode, ShooterCohortCode, ScoreDifferentiator),

  constraint Competition_IsEventRecording_ScoreCompetition_FK
  foreign key (OrganisationId, CompetitionId)
  references dbo.Competition (OrganisationId, CompetitionId),

  constraint ScoreCompetition_IsCompetitionScore_ck
  check (dbo.ValidateScoreType_fn(OrganisationId, PersonId, GoverningBodyCode, DisciplineCode, ShooterCohortCode, ScoreDifferentiator, 1) = 1)
);
