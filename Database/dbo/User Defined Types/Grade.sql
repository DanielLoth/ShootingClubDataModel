create type dbo.Grade as table (
  GoverningBodyCode char(4) not null,
  DisciplineCode char(4) not null,
  ShooterCohortCode char(1) not null,
  GradeCode char(3) not null,
  GradeName nvarchar(50) not null,
  MinimumScore int not null,
  DisplayOrder int not null,

  primary key clustered (GoverningBodyCode, DisciplineCode, ShooterCohortCode, GradeCode)
);
