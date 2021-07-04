create procedure dbo.AddPerson_tr
  @OrganisationId int,
  @PersonId int output,
  @GivenNames nvarchar(50),
  @FamilyName nvarchar(50),
  @Email dbo.EmailAddress,
  @CurrentTime datetimeoffset(0)
as

set nocount on;
set transaction isolation level read committed;

select @CurrentTime = getutcdate() where @CurrentTime is null;
select @PersonId = next value for PersonIdSequence where @PersonId is null;

begin try
  begin transaction;

  insert into dbo.Person (OrganisationId, PersonId, GivenNames, FamilyName, CreatedDtm, UpdatedDtm)
  values (@OrganisationId, @PersonId, @GivenNames, @FamilyName, @CurrentTime, @CurrentTime);

  insert into dbo.PersonEmail (OrganisationId, PersonId, Email)
  select @OrganisationId, @PersonId, @Email
  where @Email is not null and trim(@Email) <> N'';

  insert into dbo.PersonSchedule (OrganisationId, PersonId, UpdatedDtm)
  values (@OrganisationId, @PersonId, @CurrentTime);

  commit;

  select @OrganisationId as OrganisationId, @PersonId as PersonId;
end try
begin catch
  rollback;
  select * from Error_V;
  return 1;
end catch

return 0;

go

grant execute on object::dbo.AddPerson_tr to WebsiteRole;
go
