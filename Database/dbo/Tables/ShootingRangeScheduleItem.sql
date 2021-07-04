create table dbo.ShootingRangeScheduleItem (
  OrganisationId int not null,
  ShootingRangeId int not null,
  StartDtm datetimeoffset (0) not null,
  EndDtm datetimeoffset (0) not null,
  RowVersionStamp rowversion not null,

  constraint UC_ShootingRangeScheduleItem_PK
  primary key clustered (OrganisationId, ShootingRangeId, StartDtm, EndDtm),

  --constraint Match_Occupies_ShootingRangeScheduleItem_FK
  --foreign key (OrganisationId, ShootingRangeId, StartDtm, EndDtm)
  --references dbo.Match (OrganisationId, ShootingRangeId, StartDtm, EndDtm),

  constraint ShootingRangeSchedule_Contains_ScheduleItem_FK
  foreign key (OrganisationId, ShootingRangeId)
  references dbo.ShootingRangeSchedule (OrganisationId, ShootingRangeId)
);
