create table dbo.OrganisationUser (
  OrganisationId int not null,
  UserVerifiedId int not null,
  RowVersionStamp rowversion not null,
  CreatedDtm datetimeoffset (0) not null,
  UpdatedDtm datetimeoffset (0) not null,
  
  constraint UC_OrganisationUser_PK
  primary key clustered (OrganisationId, UserVerifiedId),

  constraint Organisation_Hosts_OrganisationUser_FK
  foreign key (OrganisationId)
  references dbo.Organisation (OrganisationId),

  constraint UserVerified_BelongsTo_Organisation_FK
  foreign key (UserVerifiedId)
  references dbo.UserVerified (UserVerifiedId),

  constraint U__OrganisationUser_AK1
  unique nonclustered (UserVerifiedId, OrganisationId)
);
