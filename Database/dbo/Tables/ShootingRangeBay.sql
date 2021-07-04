create table dbo.ShootingRangeBay (
  OrganisationId int not null,
  ShootingRangeId int not null,
  BayNumber int not null,
  RowVersionStamp rowversion not null,
  
  constraint UC_ShootingRangeBay_PK
  primary key clustered (OrganisationId, ShootingRangeId, BayNumber),

  constraint ShootingRange_Houses_ShootingRangeBay_FK
  foreign key (OrganisationId, ShootingRangeId)
  references dbo.ShootingRange (OrganisationId, ShootingRangeId),

  constraint ShootingRangeBay_HasAcceptableMaximumBayNumber_ck
  check (BayNumber <= 30)
);

go
