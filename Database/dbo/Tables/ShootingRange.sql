create table dbo.ShootingRange (
  OrganisationId int not null,
  ShootingRangeId int not null,
  RowVersionStamp rowversion not null,
  CreatedDtm datetimeoffset (0) not null,
  UpdatedDtm datetimeoffset (0) not null,
  RangeName nvarchar(50) not null,

  constraint UC_ShootingRange_PK
  primary key clustered (OrganisationId, ShootingRangeId),

  constraint Organisation_Has_ShootingRange_FK
  foreign key (OrganisationId)
  references dbo.Organisation (OrganisationId),

  constraint U__ShootingRange_AK1
  unique nonclustered (OrganisationId, RangeName)
);

go
