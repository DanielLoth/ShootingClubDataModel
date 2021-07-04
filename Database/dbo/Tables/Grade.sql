create table dbo.Grade (
  GoverningBodyCode char(4) not null,
  DisciplineCode char(4) not null,
  ShooterCohortCode char(1) not null,
  GradeCode char(3) not null,
  GradeName nvarchar(50) not null,
  MinimumScore int not null,
  DisplayOrder int not null,
  RowVersionStamp rowversion not null,

  constraint UC_Grade_PK
  primary key clustered (GoverningBodyCode, DisciplineCode, ShooterCohortCode, GradeCode),

  constraint DisciplineOffering_Has_Grade_FK
  foreign key (GoverningBodyCode, DisciplineCode, ShooterCohortCode)
  references dbo.DisciplineOffering (GoverningBodyCode, DisciplineCode, ShooterCohortCode)
);
