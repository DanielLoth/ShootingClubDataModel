create type dbo.ParticipationType as table (
  ParticipationTypeCode char(1) not null,
  ParticipationTypeName nvarchar(50) not null,
  RowVersionStamp rowversion not null,

  primary key clustered (ParticipationTypeCode)
);
go

create type dbo.LocationParticipationType as table (
  CountryCode char(2) not null,
  SubdivisionCode char(3) not null,
  ParticipationTypeCode char(1) not null,
  ParticipationTypeName nvarchar(50) not null,
  RowVersionStamp rowversion not null,

  primary key clustered (CountryCode, SubdivisionCode, ParticipationTypeCode)
);
