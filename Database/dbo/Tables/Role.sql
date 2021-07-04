create table dbo.Role (
  RoleCode char(2) not null,
  RoleName nvarchar(50) not null,

  constraint UC_Role_PK primary key clustered (RoleCode),
  constraint U__Role_RoleName_AK1 unique (RoleName)
);
