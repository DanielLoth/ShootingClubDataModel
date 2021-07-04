create procedure dbo.GetPersonRowVersion_tr
  @OrganisationId int,
  @PersonId int,
  @RowVersionStamp bigint output
as

set nocount on;
set transaction isolation level read committed;

set @RowVersionStamp = 0;

select @RowVersionStamp = cast(RowVersionStamp as bigint)
from dbo.Person
where OrganisationId = @OrganisationId and PersonId = @PersonId;

return 0;

go

grant execute on object::dbo.GetPersonRowVersion_tr to WebsiteRole;
go
