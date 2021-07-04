create procedure dbo.UpdatePerson_tr
  @OrganisationId int,
  @PersonId int,
  @GivenNames nvarchar(50),
  @FamilyName nvarchar(50),
  @Email dbo.EmailAddress,
  @RowVersionStamp bigint,
  @CurrentTime datetimeoffset(0)
as

set nocount on;
set transaction isolation level read committed;

select @CurrentTime = getutcdate() where @CurrentTime is null;

begin try
  begin transaction;

  update dbo.Person
  set GivenNames = @GivenNames, FamilyName = @FamilyName
  where OrganisationId = @OrganisationId and PersonId = @PersonId and RowVersionStamp = cast(@RowVersionStamp as rowversion);

  if @@ROWCOUNT <> 1 throw 100000, 'Record has been modified or no longer exists.', 1;

  exec dbo.UpdatePersonEmail @OrganisationId, @PersonId, @Email;

  commit;

  select @OrganisationId as OrganisationId, @PersonId as PersonId;
end try
begin catch
  rollback;
  select * from Error_V;
  return 1;
end catch;

return 0;

go

grant execute on object::dbo.UpdatePerson_tr to WebsiteRole;
go
