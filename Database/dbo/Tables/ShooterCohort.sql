create table dbo.ShooterCohort (
  GoverningBodyCode char(4) not null,
  ShooterCohortCode char(1) not null,
  ShooterCohortName nvarchar(50) not null,
  RowVersionStamp rowversion not null,
  CreatedDtm datetimeoffset (0) not null,
  UpdatedDtm datetimeoffset (0) not null,

  constraint UC_ShooterCohort_PK
  primary key clustered (GoverningBodyCode, ShooterCohortCode),

  constraint U__ShooterCohort_Name_AK1
  unique (GoverningBodyCode, ShooterCohortName)
);
