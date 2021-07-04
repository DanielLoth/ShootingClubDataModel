create table dbo.DisciplineOffering (
  GoverningBodyCode char(4) not null,
  DisciplineCode char(4) not null,
  ShooterCohortCode char(1) not null,
  RowVersionStamp rowversion not null,
  CreatedDtm datetimeoffset (0) not null,
  UpdatedDtm datetimeoffset (0) not null,

  constraint UC_DisciplineOffering_PK
  primary key clustered (GoverningBodyCode, DisciplineCode, ShooterCohortCode),

  constraint Discipline_OfferedAs_DisciplineOffering_FK
  foreign key (GoverningBodyCode, DisciplineCode)
  references dbo.Discipline (GoverningBodyCode, DisciplineCode),

  constraint ShooterCohort_IsOffered_DisciplineOffering_FK
  foreign key (GoverningBodyCode, ShooterCohortCode)
  references dbo.ShooterCohort (GoverningBodyCode, ShooterCohortCode)
);
