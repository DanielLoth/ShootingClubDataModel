create table dbo.OrganisationUserRole (
  OrganisationId int not null,
  UserVerifiedId int not null,
  RoleCode char(2) not null,
  RowVersionStamp rowversion not null,
  CreatedDtm datetimeoffset (0) not null,
  UpdatedDtm datetimeoffset (0) not null,

  constraint UC_OrganisationUserRole_PK
  primary key clustered (OrganisationId, UserVerifiedId, RoleCode),

  constraint Organisation_GrantsAccessTo_OrganisationUser_FK
  foreign key (OrganisationId, UserVerifiedId)
  references dbo.OrganisationUser (OrganisationId, UserVerifiedId),

  constraint Organisation_HasA_Role_FK
  foreign key (RoleCode)
  references dbo.Role (RoleCode)
);
