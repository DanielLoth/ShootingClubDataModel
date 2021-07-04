create table dbo.Participation (
  OrganisationId int not null,
  PersonId int not null,
  CountryCode char(2) not null,
  SubdivisionCode char(3) not null,
  ParticipationTypeCode char(1) not null,
  ParticipationDate date not null,
  RowVersionStamp rowversion not null,
  
  constraint UC_Participation_PK
  primary key clustered (OrganisationId, PersonId, CountryCode, SubdivisionCode, ParticipationTypeCode, ParticipationDate),
  
  constraint Person_Indicates_Participation_FK
  foreign key (OrganisationId, PersonId)
  references dbo.Person (OrganisationId, PersonId),

  constraint LocationParticipationType_Discriminates_Participation_FK
  foreign key (CountryCode, SubdivisionCode, ParticipationTypeCode)
  references dbo.LocationParticipationType (CountryCode, SubdivisionCode, ParticipationTypeCode)
);
go

create table dbo.ParticipationEndorsedExternalCompetition (
  OrganisationId int not null,
  PersonId int not null,
  CountryCode char(2) not null,
  SubdivisionCode char(3) not null,
  ParticipationTypeCode char(1) not null,
  ParticipationDate date not null,
  ExternalCompetitionId int not null,
  RowVersionStamp rowversion not null,

  constraint UC_ParticipationEndorsedExternalCompetition_PK
  primary key clustered (OrganisationId, PersonId, CountryCode, SubdivisionCode, ParticipationTypeCode, ParticipationDate, ExternalCompetitionId),

  constraint Participation_IsA_EndorsedExternalCompetition_FK
  foreign key (OrganisationId, PersonId, CountryCode, SubdivisionCode, ParticipationTypeCode, ParticipationDate)
  references dbo.Participation (OrganisationId, PersonId, CountryCode, SubdivisionCode, ParticipationTypeCode, ParticipationDate)
);
go

create table dbo.ParticipationOfficiate (
  OrganisationId int not null,
  PersonId int not null,
  CountryCode char(2) not null,
  SubdivisionCode char(3) not null,
  ParticipationTypeCode char(1) not null,
  ParticipationDate date not null,
  CompetitionId int not null,
  RowVersionStamp rowversion not null,

  constraint UC_ParticipationOfficiate_PK
  primary key clustered (OrganisationId, PersonId, CountryCode, SubdivisionCode, ParticipationTypeCode, ParticipationDate, CompetitionId),

  constraint Participation_IsA_ParticipationOfficiate_FK
  foreign key (OrganisationId, PersonId, CountryCode, SubdivisionCode, ParticipationTypeCode, ParticipationDate)
  references dbo.Participation (OrganisationId, PersonId, CountryCode, SubdivisionCode, ParticipationTypeCode, ParticipationDate)
);
go

create table dbo.ParticipationSafetyTraining (
  OrganisationId int not null,
  PersonId int not null,
  CountryCode char(2) not null,
  SubdivisionCode char(3) not null,
  ParticipationTypeCode char(1) not null,
  ParticipationDate date not null,
  RowVersionStamp rowversion not null,

  constraint UC_ParticipationSafetyTraining_PK
  primary key clustered (CountryCode, SubdivisionCode),

  constraint Participation_IsA_ParticipationSafetyTraining_FK
  foreign key (OrganisationId, PersonId, CountryCode, SubdivisionCode, ParticipationTypeCode, ParticipationDate)
  references dbo.Participation (OrganisationId, PersonId, CountryCode, SubdivisionCode, ParticipationTypeCode, ParticipationDate)
);
go

create table dbo.ParticipationTargetPractice (
  OrganisationId int not null,
  PersonId int not null,
  CountryCode char(2) not null,
  SubdivisionCode char(3) not null,
  ParticipationTypeCode char(1) not null,
  ParticipationDate date not null,
  RowVersionStamp rowversion not null,

  constraint UC_ParticipationTargetPractice_PK
  primary key clustered (OrganisationId, PersonId, CountryCode, SubdivisionCode, ParticipationTypeCode, ParticipationDate),

  constraint Participation_IsA_ParticipationTargetPractice_FK
  foreign key (OrganisationId, PersonId, CountryCode, SubdivisionCode, ParticipationTypeCode, ParticipationDate)
  references dbo.Participation (OrganisationId, PersonId, CountryCode, SubdivisionCode, ParticipationTypeCode, ParticipationDate)
);
go
