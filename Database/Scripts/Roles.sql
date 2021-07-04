declare @Roles as dbo.Role;

insert into @Roles (RoleCode, RoleName)
values
  ('S', 'Subscriber'),
  ('U', 'User');

if (N'$(InsertReferenceData)' = 'True')
begin
  exec dbo.AddRoles_tr @Roles;
end
