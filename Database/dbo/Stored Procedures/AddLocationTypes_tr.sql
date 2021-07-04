create procedure dbo.AddLocationTypes_tr
  @LocationTypes dbo.LocationType readonly
as
begin
  set nocount on;
  set transaction isolation level serializable;

  begin try
    begin transaction;

    merge into dbo.LocationType t
    using @LocationTypes s
    on t.LocationTypeCode = s.LocationTypeCode
    when matched then
      update set t.LocationTypeName = s.LocationTypeName
    when not matched by target then
      insert (LocationTypeCode, LocationTypeName)
      values (s.LocationTypeCode, s.LocationTypeName);

    commit;
  end try
  begin catch
    rollback;
    throw;
  end catch
end
go
