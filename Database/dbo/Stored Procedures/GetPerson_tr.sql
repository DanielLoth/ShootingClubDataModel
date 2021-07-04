create procedure dbo.GetPerson_tr
  @OrganisationId int,
  @PersonId int
as

set nocount on;
set transaction isolation level read committed;

select p.OrganisationId, p.PersonId, p.GivenNames, p.FamilyName, e.Email, cast(p.RowVersionStamp as bigint) as RowVersionStamp
from dbo.Person p
left join dbo.PersonEmail e
  on p.OrganisationId = e.OrganisationId
  and p.PersonId = e.PersonId
where p.OrganisationId = @OrganisationId and p.PersonId = @PersonId;

return 0;

go

grant execute on object::dbo.GetPerson_tr to WebsiteRole;
go
