create type dbo.ShooterCohort as table (
  GoverningBodyCode char(4) not null,
  ShooterCohortCode char(1) not null,
  ShooterCohortName nvarchar(50) not null,

  primary key (GoverningBodyCode, ShooterCohortCode),
  unique (GoverningBodyCode, ShooterCohortName)
);
