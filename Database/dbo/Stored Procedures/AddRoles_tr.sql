create procedure dbo.AddRoles_tr
  @Roles dbo.Role readonly
as
begin
  set nocount on;
  set transaction isolation level serializable;

  begin try
    begin transaction;

    merge into dbo.Role t
    using @Roles s
    on t.RoleCode = s.RoleCode
    when matched then
      update set t.RoleName = s.RoleName
    when not matched by target then
      insert (RoleCode, RoleName)
      values (s.RoleCode, s.RoleName);

    commit;
  end try
  begin catch
    rollback;
    throw;
  end catch
end
go
