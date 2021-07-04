create table dbo.ShootingRangeSchedule (
  OrganisationId int not null,
  ShootingRangeId int not null,
  UpdatedDtm datetimeoffset(0) not null,
  RowVersionStamp rowversion not null,
  
  constraint UC_ShootingRangeSchedule_PK
  primary key clustered (OrganisationId, ShootingRangeId),

  constraint ShootingRange_Has_ShootingRangeSchedule_FK
  foreign key (OrganisationId, ShootingRangeId)
  references dbo.ShootingRange (OrganisationId, ShootingRangeId)
);
