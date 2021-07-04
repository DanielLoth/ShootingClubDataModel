create type dbo.DisciplineOffering as table (
  GoverningBodyCode char(4) not null,
  DisciplineCode char(4) not null,
  ShooterCohortCode char(1) not null,
  DisciplineOfferingName nvarchar(50) not null,

  primary key clustered (GoverningBodyCode, DisciplineCode, ShooterCohortCode)
);
