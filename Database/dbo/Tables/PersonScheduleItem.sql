create table dbo.PersonScheduleItem (
  OrganisationId int not null,
  PersonId int not null,
  StartDtm datetimeoffset(0) not null,
  EndDtm datetimeoffset(0) not null,
  CreatedDtm datetimeoffset(0) not null,
  RowVersionStamp rowversion not null,

  constraint UC_PersonScheduleItem_PK
  primary key clustered (OrganisationId, PersonId, StartDtm, EndDtm),

  constraint PersonSchedule_Has_PersonScheduleItem_FK
  foreign key (OrganisationId, PersonId)
  references dbo.PersonSchedule (OrganisationId, PersonId)
);
