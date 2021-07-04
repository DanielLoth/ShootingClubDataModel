create procedure dbo.AddOrganisation_tr
  @UserId int,
  @OrganisationId int output,
  @OrganisationName nvarchar(100),
  @CurrentTime datetimeoffset(0)
as

set nocount on;
set transaction isolation level read committed;

select @CurrentTime = getutcdate() where @CurrentTime is null;
select @OrganisationId = next value for dbo.OrganisationIdSequence where @OrganisationId is null;

begin try
  begin transaction;

  insert into dbo.Organisation (OrganisationId, OrganisationName, CreatedDtm, UpdatedDtm)
  values (@OrganisationId, @OrganisationName, @CurrentTime, @CurrentTime);

  insert into dbo.OrganisationUser (OrganisationId, UserVerifiedId, CreatedDtm, UpdatedDtm)
  values (@OrganisationId, @UserId, @CurrentTime, @CurrentTime);

  insert into dbo.OrganisationUserRole (OrganisationId, UserVerifiedId, RoleCode, CreatedDtm, UpdatedDtm)
  values (@OrganisationId, @UserId, 'S', @CurrentTime, @CurrentTime);

  commit;

  select @OrganisationId as OrganisationId;
end try
begin catch
  rollback;
  select * from Error_V;
  return 1;
end catch

return 0;

go

grant execute on object::dbo.AddOrganisation_tr to WebsiteRole;
go
