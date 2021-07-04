create type dbo.Role as table (
  RoleCode char(2) not null,
  RoleName nvarchar(50) not null,

  primary key clustered (RoleCode),
  unique (RoleName)
);
