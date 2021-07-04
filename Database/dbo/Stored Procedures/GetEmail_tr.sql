create procedure dbo.GetEmail_tr
  @UserId int
as

set nocount on;
set transaction isolation level read committed;

select Email
from dbo.[User]
where UserId = @UserId;

return 0;

go

grant execute on object::dbo.GetEmail_tr to WebsiteRole;
go
