create procedure dbo.GetOrganisationsByUser_tr
  @UserVerifiedId int
as

set nocount on;
set transaction isolation level read committed;

select o.OrganisationId, o.OrganisationName
from dbo.OrganisationUser ou
inner join dbo.Organisation o on ou.OrganisationId = o.OrganisationId
where ou.UserVerifiedId = @UserVerifiedId;

return 0;

go

grant execute on object::dbo.GetOrganisationsByUser_tr to WebsiteRole;
go
