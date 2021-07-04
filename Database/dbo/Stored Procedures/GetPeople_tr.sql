create procedure dbo.GetPeople_tr
  @OrganisationId int
as

set nocount on;
set transaction isolation level read committed;

select OrganisationId, PersonId, GivenNames, FamilyName
from dbo.Person
where OrganisationId = @OrganisationId;

return 0;

go

grant execute on object::dbo.GetPeople_tr to WebsiteRole;
go
