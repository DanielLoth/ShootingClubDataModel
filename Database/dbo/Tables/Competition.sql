create table dbo.Competition (
  OrganisationId int not null,
  CompetitionId int not null,
  IsHosted bit not null, -- Discriminator
  RowVersionStamp rowversion not null,
  CreatedDtm datetimeoffset(0) not null,
  UpdatedDtm datetimeoffset(0) not null,
  CompetitionName nvarchar(100) not null,

  constraint UC_Competition_PK
  primary key clustered (OrganisationId, CompetitionId),

  constraint Organisation_Hosts_Competition_FK
  foreign key (OrganisationId)
  references dbo.Organisation (OrganisationId)
);

go
