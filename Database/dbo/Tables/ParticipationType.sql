create table dbo.ParticipationType (
  ParticipationTypeCode char(1) not null,
  ParticipationTypeName nvarchar(50) not null,
  RowVersionStamp rowversion not null,

  constraint UC_ParticipationType_PK
  primary key clustered (ParticipationTypeCode)
);
go

create table dbo.LocationParticipationType (
  CountryCode char(2) not null,
  SubdivisionCode char(3) not null,
  ParticipationTypeCode char(1) not null,
  ParticipationTypeName nvarchar(50) not null,
  RowVersionStamp rowversion not null,

  constraint UC_LocationParticipationType_PK
  primary key clustered (CountryCode, SubdivisionCode, ParticipationTypeCode),

  constraint ParticipationType_discriminates_LocationParticipationType_FK
  foreign key (ParticipationTypeCode)
  references dbo.ParticipationType (ParticipationTypeCode),

  constraint Location_Legislates_LocationParticipationType_FK
  foreign key (CountryCode, SubdivisionCode)
  references dbo.Location (CountryCode, SubdivisionCode)
);
go
