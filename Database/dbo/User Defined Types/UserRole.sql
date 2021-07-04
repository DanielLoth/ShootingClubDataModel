create type dbo.UserRole as table (
  OrganisationId int not null,
  UserVerifiedId int not null,
  RoleCode char(2) not null,
  primary key clustered (OrganisationId, UserVerifiedId, RoleCode)
);
